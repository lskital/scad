//webbing size
ws=25.4;

width=20;

hook_length=3*ws;
hook_thickness=2;
hook_retention=1.75;
hook_retention_h=1.5;

top_length=5;

gap=2;
v_thickness=6;
h_thickness=5;

carrier_length=3*ws+5;
shelf_depth=30;

hole_d=3;

module hole(){
  hole_y_offset=hook_thickness+gap+0.5*v_thickness;
  translate([0, hole_y_offset, 0])
    cylinder(h=width, r=hole_d/2, center=false);
}
module hook() {
  cube([hook_length, hook_thickness, width]);
  
  retention_y=2*hook_retention+hook_thickness;
  translate([hook_length-hook_retention_h, -hook_retention, 0]) 
    cube([hook_retention_h, retention_y, width]);
}

module carrier() {
  cube([carrier_length, v_thickness, width ]);
  translate([carrier_length-h_thickness, v_thickness, 0])
    cube([h_thickness, shelf_depth, width ]);  
}

module top_joint() {
  joint_depth=hook_thickness+gap+v_thickness;
  cube([h_thickness, joint_depth ,width]);
}

carrier_y_offset=hook_thickness + gap;
joint_x_offset=h_thickness+carrier_length;

difference(){
  union(){
    hook();
    translate([0, carrier_y_offset, 0]) carrier();
    translate([-h_thickness, 0, 0]) top_joint();
  }
  hole();
}
