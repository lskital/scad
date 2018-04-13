include <shapes.scad>
include <cubeX.scad>

$fn = 20;

webbing_slot_x = 26.5;
webbing_slot_y = 3.2;

slot_sep = 3.5;

left_wall = 5.5;
right_wall = 3;
bottom_wall = 4;

radius_out = 1.5;
radius_in = 1;

hook_slot_x = webbing_slot_x + right_wall+radius_out;
hook_slot_y = 4.5;
hook_y = 5.5;
hook_sep = 8;

height = 3;




total_x = right_wall + webbing_slot_x + left_wall;
total_y = bottom_wall + webbing_slot_y + slot_sep + webbing_slot_y + hook_sep + hook_slot_y + hook_y;

offset0 = 0.5 * (left_wall - right_wall);
offset1 = 0.5 * (total_y - webbing_slot_y) - bottom_wall;
offset2 = offset1 - slot_sep - webbing_slot_y;
offset3 = offset2 - 0.5 * (webbing_slot_y + hook_slot_y) - hook_sep;

module hook() {
    _cubeX(right_wall, 1.5*hook_slot_y+radius_out, height, radius_out, true, true);
    translate([0.5*(0.20*hook_slot_y+radius_out), 0.5*(1.4*hook_slot_y),0]) _cubeX(webbing_slot_x*0.2, 0.25*hook_slot_y+radius_out, height, radius_out, true, true);
}

module main() {
difference() {
  
  translate([offset0, 0, 0]) _cubeX(total_x, total_y, height, radius_out, true, true);
 
  translate([0, offset1, 0]) roundedBox(webbing_slot_x, webbing_slot_y, height, radius_in);
  translate([0, offset2, 0]) roundedBox(webbing_slot_x, webbing_slot_y, height, radius_in);  
  translate([-0.5*(right_wall+radius_out), offset3, 0]) roundedBox(hook_slot_x, hook_slot_y, height, radius_in);
    
  translate([-0.5 * webbing_slot_x + right_wall, offset3 + 0.65  * hook_slot_y, 0]) rotate(-23, 0, 0) cube([0.6*webbing_slot_x, 1.0*hook_slot_y, height], true);
}
}

main();

hook_offset_x = -0.5 * (webbing_slot_x + right_wall);
hook_offset_y = offset3 - 0.5 * radius_out;
translate([hook_offset_x, hook_offset_y, 0]) hook();




