base_x = 100;
base_y = 105;
base_z = 2;

hole_dia = 3;

hole_dist_x = 95;
hole_dist_y = 90;

stand_h = 15;
stand_dia = 6;

vent_dia = 40;
vent_x = 45;
vent_y = 27;

sidewall_x = 3;
sidewall_h = base_z+5;
sidewall_hole_h = base_z+0.5*(sidewall_h-base_z);
sidewall_hole_d = 15;

$fn=10;

module stand() {
  difference() {
    cylinder(d=stand_dia, h=stand_h);
    cylinder(d=hole_dia, h=stand_h);
  }
}

module stands() {
  //translate([0.5*stand_dia, 0.5*stand_dia, base_z]) {
  translate([0, 0, base_z]) {
    stand();
    translate([hole_dist_x,0, 0]) stand();
    translate([0, hole_dist_y, 0]) stand();
    translate([hole_dist_x, hole_dist_y, 0]) stand();
  }
}

module base_holes() {
  //translate([0.5*stand_dia, 0.5*stand_dia, base_z]) {
    translate([0, 10, 0]) cylinder(d=hole_dia, h=base_z);
    translate([hole_dist_x,10, 0]) cylinder(d=hole_dia, h=base_z);
    translate([0, hole_dist_y-10, 0]) cylinder(d=hole_dia, h=base_z);
    translate([hole_dist_x, hole_dist_y-10, 0]) cylinder(d=hole_dia, h=base_z);
}

module vent() {
  cylinder(d=vent_dia, h=base_z);
}

module sidewall() {
  difference() {
    cube([sidewall_x, base_y, sidewall_h]);
    translate([0, sidewall_hole_d, sidewall_hole_h])
    rotate([0, 90, 0]) cylinder(h=sidewall_x*10, d=hole_dia);
    translate([0,base_y-sidewall_hole_d, sidewall_hole_h])
    rotate([0, 90, 0]) cylinder(h=sidewall_x*10, d=hole_dia);
  }
}

difference() {
  cube([base_x, base_y, base_z]);
  translate([vent_x, vent_y, 0]) vent();
  translate([0.5*(base_x-hole_dist_x), 0.5*(base_y-hole_dist_y), 0]) base_holes();
}
translate([0.5*(base_x-hole_dist_x), 0.5*(base_y-hole_dist_y), 0]) {
   stands();
}

translate([-sidewall_x, 0, 0]) sidewall();
translate([base_x, 0, 0]) sidewall();

