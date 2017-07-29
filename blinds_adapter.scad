$fn = 20;

wall_d = 3.5;

x1 = 42;
y1 = 25;


x2 = 25;
z2 = 37;

cross_h = 15 + wall_d;

arm_offset_x = (x1 - x2)*0.5;

arm_offset_y = (y1 - wall_d);

base_hole_d = 4.5;

top_hole_d = 6;

base_hole_offset = 4.5 + 0.5 * base_hole_d;

top_hole_offset = 27.5 + 0.5 * top_hole_d;

module base() {
  difference() {
    cube([x1, y1, wall_d]);
    translate([base_hole_offset, 0.5*y1, 0]) cylinder(d=base_hole_d, h=wall_d);
    translate([x1-base_hole_offset, 0.5*y1, 0]) cylinder(d=base_hole_d, h=wall_d);
  }

}

module arm() {
    difference() {
      translate([arm_offset_x, 0, 0]) cube([x2, wall_d, z2]);
      translate([0.5 * x1, -wall_d, top_hole_offset]) rotate([-90, 0, 0]) cylinder(d=top_hole_d, h=wall_d*3);
    }
}

module cross_section() {
  translate([0.5*(x1-wall_d), 0, 0]) difference() {
    cube([wall_d, y1, cross_h]);
    translate([0, y1*0.5, 33]) rotate([0, 90, 0]) cylinder(d=40, h=wall_d);
  }
}

base();

arm();
translate([0, arm_offset_y, 0]) arm();

cross_section();