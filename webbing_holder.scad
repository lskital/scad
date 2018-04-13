include <shapes.scad>
include <cubeX.scad>

$fn = 20;

webbing_slot_x = 26.5;
webbing_slot_y = 2.5;

slot_sep = 1;

left_wall = 2;
right_wall = 1;
bottom_wall = 2;

radius_out = 1.5;
radius_in = 1;

hook_slot_x = webbing_slot_x + right_wall+radius_out;
hook_slot_y = 2;
hook_y = 2;
hook_sep = 1;

height = 6;




total_x = right_wall + webbing_slot_x + left_wall;
total_y = bottom_wall + webbing_slot_y + slot_sep + hook_slot_y + hook_y;

offset0 = 0.5 * (left_wall - right_wall);
offset1 = 0.5 * (total_y - webbing_slot_y) - bottom_wall;
offset2 = offset1 - slot_sep - webbing_slot_y;

module main() {
difference() {
  
  translate([offset0, 0, 0]) _cubeX(total_x, total_y, height, radius_out, true, true);
 
  translate([0, offset1, 0]) roundedBox(webbing_slot_x, webbing_slot_y, height, radius_in);
 
  translate([-0.5*(right_wall+radius_out), offset2, 0]) roundedBox(hook_slot_x, hook_slot_y, height, radius_in);
}
}

main();





