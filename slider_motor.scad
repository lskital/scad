nema17_hole_d = 3.5;
nema17_hole_distance = 31;
nema17_hole_length = 5;
nema17_xy = 42.3;
nema17_shaft_hole_d = 23;

lm_x = 15;
lm_y = 20;
lm_z = 5;

lm_hole_d = 6.5;
lm_hole_head_d = 12;
lm_hole_distance = 69.5;
lm_indent_width = 55;



fp_y = 3;
motor_offset_x = 37 - fp_y;
// 30mm from the base
motor_offset_z =  30 - (0.5 * nema17_xy);




//lm_total_width = 89.8;
lm_total_width = lm_x + lm_hole_distance;



fp_x = motor_offset_x + fp_y;
fp_z = motor_offset_z + nema17_xy;

lm_base_y = nema17_xy + fp_y;

module lm_hole() {
    hull() {
    cylinder(d=lm_hole_d, h = 2*lm_z);
    translate([0, lm_hole_d, 0]) cylinder(d=lm_hole_d, h = 2*lm_z);
    }
    hull() {
    cylinder(d=lm_hole_head_d, h = lm_z);
    translate([0, lm_hole_d, 0]) cylinder(d=lm_hole_head_d, h = lm_z);
    }
}
module lower_mount_leg() {
    difference() {
    cube([lm_x, lm_y, 2 * lm_z]);
    translate([0.5*lm_x, 0.33*lm_y, 0]) lm_hole();
    }
    
    
}

module lower_mount() {
    lower_mount_leg();
    translate([lm_hole_distance, 0, 0]) lower_mount_leg();
    translate([lm_x, 0, 0]) cube([lm_indent_width, lm_y, lm_z]);
    translate([0, lm_y, 0]) cube([lm_total_width, lm_base_y, lm_z]);
}
module face_plate(x, y, z) {
    cube([x, y, z]);
    
}

module nema17_holes() {
  offset = 0.5 * (nema17_xy - nema17_hole_distance);
  translate([offset, offset, 0]) {
  translate([0, 0, 0]) cylinder(d=nema17_hole_d, h=nema17_hole_length);
  translate([nema17_hole_distance, 0, 0]) cylinder(d=nema17_hole_d, h=nema17_hole_length);
  translate([0, nema17_hole_distance, 0]) cylinder(d=nema17_hole_d, h=nema17_hole_length);
  translate([nema17_hole_distance, nema17_hole_distance, 0]) cylinder(d=nema17_hole_d, h=nema17_hole_length);
  translate([0.5*nema17_hole_distance, 0.5*nema17_hole_distance, 0]) cylinder(d=nema17_shaft_hole_d, h=nema17_hole_length);
  }
}
module nema17_plate(z_offset) {
    edge = nema17_xy;
    thickness = 3;
    difference() {
    cube([thickness, edge, edge + z_offset]);
    translate([thickness, 0, z_offset]) rotate([0, -90, 0]) nema17_holes();
    }
} 
lower_mount(lm_x, lm_y, lm_z);
translate([0, lm_y, 0]) face_plate(fp_x, fp_y, fp_z);
translate([motor_offset_x, lm_y + fp_y, 0]) nema17_plate(motor_offset_z);

