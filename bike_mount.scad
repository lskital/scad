handlebar_dia = 35;
clamp_thickness = 5;
clamp_width = 10;
clamp_gap = 4;

fl_dia=26;

screew_block_ = [15, 20, clamp_width];

M3_nut_dia = 6;
M3_dia = 3;
M3_washer_dia = 7.1;
cutout_clearance=10;
nut_offset=1;

outer_dia=handlebar_dia+2*clamp_thickness;
outer_fl_dia=fl_dia+2*clamp_thickness;

block_offset=0.20;

module nut() {
  $fn = 6;
  cylinder(d=M3_nut_dia, h=10);
}

module screew_cutout() {
cutout_offset=(screew_block_[0]-cutout_clearance);
//cutout_offset=0;
translate([-10+0.5*cutout_offset, 0.5*M3_nut_dia+nut_offset, 0.5*(clamp_width)])
rotate([0, 90, 0]) {
  nut(); $fn=12;
  cylinder(d=M3_dia, h=40);
  translate([0, 0, 10+cutout_clearance])
    cylinder(d=M3_washer_dia, h=10);
}
}

module screew_block() {
  difference() {
    cube(screew_block_);
    translate([0.5*(-clamp_gap+screew_block_[0]), 0, 0]) cube([clamp_gap, screew_block_[1], screew_block_[2]]);
    screew_cutout();
  }
}

module body_cutout(outer_dia, inner_dia) {
  cylinder(d=inner_dia, h=clamp_width);
  translate([-0.5*clamp_gap, -0.5*outer_dia, 0]) cube([clamp_gap,  outer_dia, clamp_width]);
  translate([-0.5*screew_block_[0], -(block_offset*screew_block_[1]+0.5*outer_dia), 0])
      screew_cutout();
  translate([0,0,clamp_width])
  rotate([0,180,180]) translate([-0.5*screew_block_[0], -(block_offset*screew_block_[1]+0.5*outer_dia), 0])
      screew_cutout();
}


module body_outline(dia) {
  cylinder(d=dia, h=clamp_width);
  translate([-0.5*screew_block_[0], -(block_offset*screew_block_[1]+0.5*dia), 0]) screew_block();
  translate([0, 0, clamp_width]) rotate([180, 0, 0]) 
    translate([-0.5*screew_block_[0], -(block_offset*screew_block_[1]+0.5*dia), 0]) screew_block();
}

module clamp(outer_dia, inner_dia) {
  difference() {
    body_outline(outer_dia);
    body_cutout(outer_dia, inner_dia);
  }
}
//body_cutout(outer_dia, handlebar_dia);

clamp(outer_dia, handlebar_dia);
translate([0.5*(outer_dia+outer_fl_dia)+2, 0, 0]) clamp(outer_fl_dia, fl_dia);
connector_y = 20;
translate([0.5*handlebar_dia, -0.5*connector_y, 0])
  cube([2*clamp_thickness, connector_y, clamp_width]);
