from dataclasses import dataclass
import json

# ------------------------------------------------------------------------------

@dataclass
class Vec2:
    x: float
    y: float

    def __mul__(self, other):
        return Vec2(self.x * other.x, self.y * other.y)

    def __truediv__(self, other):
        return Vec2(self.x / other.x, self.y / other.y)

    def __add__(self, other):
        return Vec2(self.x + other.x, self.y + other.y)

    def __sub__(self, other):
        return Vec2(self.x - other.x, self.y - other.y)

    def __format__(self):
        return f"({self.x}, {self.y})"

@dataclass
class Rect:
    l: float
    t: float
    r: float
    b: float

# ------------------------------------------------------------------------------

workarea = Vec2(3840, 2160)
# padding_outer = 7
# padding_inner = 4
padding_outer = 0
padding_inner = 0
num_zones_horizontal = 6
num_zones_vertical = 2

# ------------------------------------------------------------------------------

def get_zone(x, y, w, h):
    zone_extent = workarea / Vec2(num_zones_horizontal, num_zones_vertical)

    tl_xy = Vec2(x, y)
    bl_xy = Vec2(x + w, y + h)

    tl = zone_extent * tl_xy
    br = zone_extent * bl_xy

    def pad(outer):
        return padding_outer if outer else padding_inner / 2

    tl.x += pad(tl_xy.x == 0)
    tl.y += pad(tl_xy.y == 0)
    br.x -= pad(bl_xy.x == num_zones_horizontal)
    br.y -= pad(bl_xy.y == num_zones_vertical)

    return Rect(tl.x, tl.y, br.x, br.y)

# ------------------------------------------------------------------------------

def new_group(groups, name):
    group = {
        "name": name,
        "padding": 0,
        "zones": []
    }
    groups.append(group)
    return group

def new_zone(group, x, y, w, h):
    zone = get_zone(x, y, w, h)

    scale = Vec2(100, 100) / workarea

    group["zones"].append({
        "x": zone.l * scale.x,
        "y": zone.t * scale.y,
        "width":  (zone.r - zone.l) * scale.x,
        "height": (zone.b - zone.t) * scale.y,
    })

# ------------------------------------------------------------------------------

groups = []

master_grid = new_group(groups, "Master Grid")

# (1 x 1) zones

for h in range(0, num_zones_horizontal):
    for v in range(0, num_zones_vertical):
        new_zone(master_grid, h, v, 1, 1)

# (2 x 1) zones

for h in range(0, num_zones_horizontal - 1):
    for v in range(0, num_zones_vertical):
        new_zone(master_grid, h, v, 2, 1)

# (2 x 2) zones

for h in range(0, num_zones_horizontal - 1):
    new_zone(master_grid, h, 0, 2, 2)

# (3 x 2) zones

for h in range(0, num_zones_horizontal - 2):
    new_zone(master_grid, h, 0, 3, 2)

overlaps = new_group(groups, "Wide Overlaps")

# (3 x 1) zones

for h in range(0, num_zones_horizontal - 2):
    for v in range(0, num_zones_vertical):
        new_zone(overlaps, h, v, 3, 1)

# (4 x 1) zones

for h in range(0, num_zones_horizontal - 3):
    for v in range(0, num_zones_vertical):
        new_zone(overlaps, h, v, 4, 1)

# (4 x 2) zones

for h in range(0, num_zones_horizontal - 3):
    new_zone(overlaps, h, 0, 4, 2)

# (5 x 2) zones

for h in range(0, num_zones_horizontal - 4):
    new_zone(overlaps, h, 0, 5, 2)

fullscreen = new_group(groups, "Fullscreen")

# (6 x 2) zones

new_zone(fullscreen, 0, 0, 6, 2)

print(json.dumps(groups, indent=4))
