$fn = 50;

key_x = 9.1;
key_y = 19.5;
key_z = 2.6;
key_cut_d = 4.5;
key_cut_dist = 7.5;

handle_d = 30;
handle_z = 1.5;
handle_1_z = key_z + handle_z;
handle_2_z = handle_z;

block_base = 0.25 * handle_d;
block_diff = 0.1;
block_base_z = key_z;

hole_d = 8;
hole_margin = 2;

module key() {
  difference() {
    cube([key_x, key_y, key_z]);
    translate([0, key_cut_dist, 0]) cylinder(d=key_cut_d, h=key_z);
    translate([key_x, key_cut_dist, 0]) cylinder(d=key_cut_d, h=key_z);
  }
}

module handle_1() {
  offset_y = 0.5*handle_d - key_y;
    
  difference() {
    cylinder(d=handle_d, h=handle_1_z);
    translate([-0.5*key_x, offset_y, 0]) key();
    block_edge = block_base*(1+block_diff);
    translate([-0.55*(key_x+block_base), 0, 0]) cube([block_edge, block_edge, block_base_z+3*block_diff], center=true);
    translate([0.55*(key_x+block_base), 0, 0]) cube([block_edge, block_edge, block_base_z+3*block_diff], center=true);
    //translate([0, -block_edge, 0]) cube([block_edge, block_edge, block_z], center=true);
    hole_offset = -0.5*(handle_d - hole_d) + hole_margin;
    translate([0, hole_offset, 0]) cylinder(d=hole_d, h=2*handle_1_z);
  }  
}

module handle_2() {
  difference() {
    cylinder(d=handle_d, h=handle_2_z);
    hole_offset = -0.5*(handle_d - hole_d) + hole_margin;
    translate([0, hole_offset, 0]) cylinder(d=hole_d, h=2*handle_1_z);
  }
  block_edge = block_base*(1-block_diff);
  translate([-0.55*(key_x+block_base), 0, 0]) cube([block_edge, block_edge, block_base_z-block_diff], center=true);
  translate([0.55*(key_x+block_base), 0, 0]) cube([block_edge, block_edge, block_base_z-block_diff], center=true);
  //translate([0, -block_edge, 0]) cube([block_edge, block_edge, block_z], center=true); 
}

//key();
handle_1();
rotate([0, 180, 0]) translate([0, 0, 10]) 
handle_2();

