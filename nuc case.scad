base_x = 100;
base_y = 105;
base_z = 2;

hole_dia = 3;

hole_dist_x = 95;
hole_dist_y = 90.4;

stand_h = 15;
stand_dia = 6;

vent_dia = 40;
vent_x = 55;
vent_y = 27;

sidewall_x = 3;
sidewall_h = base_z+8;
sidewall_hole_h = base_z+0.5*(sidewall_h-base_z);
sidewall_hole_d = 15;

ssd_stands = 2;
ssd_offset = 0;

cover_sidewall_x = 3;
cover_sidewall_h = 51+ssd_stands;
cover_top_z = 2;


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

module sidewall(h=sidewall_h) {
  difference() {
    cube([sidewall_x, base_y, h]);
    translate([0, sidewall_hole_d, sidewall_hole_h])
    rotate([0, 90, 0]) cylinder(h=sidewall_x*10, d=hole_dia);
    translate([0,base_y-sidewall_hole_d, sidewall_hole_h])
    rotate([0, 90, 0]) cylinder(h=sidewall_x*10, d=hole_dia);
  }
}

module mobo_plate() {
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
}

module cover_nh() {
  translate([-(sidewall_x + cover_sidewall_x), 0, 0]) sidewall(h=cover_sidewall_h);
  translate([sidewall_x + base_x, 0, 0]) sidewall(h=cover_sidewall_h);
  translate([-(sidewall_x+cover_sidewall_x), 0, cover_sidewall_h]) {
    cube([base_x+2*(sidewall_x+cover_sidewall_x), base_y, cover_top_z]);
    //translate([0, ssd_offset, 0]) cube([base_x+2*(sidewall_x+cover_sidewall_x), base_y, cover_top_z]);
  }
  translate([0, 0, cover_sidewall_h-ssd_stands])
    translate([69.85, 100, 0]) rotate([0, 0, 180]) 
      ssd_stands(); 
}

module cover() {
  difference() {
    cover_nh();
    translate([0, 0, cover_sidewall_h-ssd_stands])
      translate([69.85, 100, 0]) rotate([0, 0, 180]) 
        ssd_holes();
  }
}

module ssd_holes() {
  translate([0.5*(69.85-61.72), 14, 0]) cylinder(d=3.5, h=20);
  translate([0.5*(69.85-61.72)+61.72, 14, 0]) cylinder(d=3.5, h=20);
  translate([0.5*(69.85-61.72), 90.6, 0]) cylinder(d=3.5, h=20);
  translate([0.5*(69.85-61.72)+61.72, 90.6, 0]) cylinder(d=3.5, h=20);

}
module ssd_stands(h=2){
//  difference() {
//  translate([0, 0, -5]) cube([69.85, 100, 5]);
//  translate([0.5*(69.85-55), 0.5*(100-90), 0]) cube([55, 90, 0.5]);
//}
  translate([0.5*(69.85-61.72), 14, 0]) cylinder(d=6, h=h);
  translate([0.5*(69.85-61.72)+61.72, 14, 0]) cylinder(d=6, h=h);
  translate([0.5*(69.85-61.72), 90.6, 0]) cylinder(d=6, h=h);
  translate([0.5*(69.85-61.72)+61.72, 90.6, 0]) cylinder(d=6, h=h);
}

mobo_plate();
cover();
