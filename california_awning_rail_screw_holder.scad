base_x = 100;
base_y = 20;
base_z = 5;

screw_x = 25;
screw_y = 15;
screw_z = 4.7;

screw_dist = 50;
hole_d=5;

module screw() {
  cube([screw_x, screw_y, screw_z]);
  translate([0.5*screw_x, 0.5*screw_y, 0]) cylinder(d=hole_d, h=3*base_z);
}
module screws() {
screw();
translate([screw_dist, 0, 0]) screw();
}

module base() {
  translate([0.5*base_y, 0, 0]) cube([base_x-base_y, base_y, base_z]);
  translate([0.5*base_y, 0.5*base_y, 0]) cylinder(d=base_y, h=base_z);
  translate([base_x-0.5*base_y, 0.5*base_y, 0]) cylinder(d=base_y, h=base_z);
  
  
}

module main() {
difference(){
  base();
  translate([0.5*(base_x-(screw_dist+screw_x)), 0.5*(base_y-screw_y), 0]) screws();
}
}
main();
