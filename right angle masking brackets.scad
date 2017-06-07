width=19;
depth=10;
wall_thickness=1.2;
length1=119;
length2=200;
length3=41;


module right_angle_cubes(width, depth, l1, l2) {
  cube([width, depth, l1], center=false);
  translate([0, 0,width]) {rotate([0, 90, 0]) {cube([width, depth, l2], center=false);}}
}



module right_angle_bracket_left() {
difference() {
right_angle_cubes(width+2*wall_thickness, depth+2*wall_thickness, length1+wall_thickness, length2+wall_thickness);
translate([wall_thickness, 0, wall_thickness]) {right_angle_cubes(width, depth, length1, length2);}
}
}

module right_angle_bracket_right() {
mirror() { right_angle_bracket_left(); }
}


module straight(width, depth, l1) {
difference() {
 cube([width+2*wall_thickness, depth+2*wall_thickness, l1], center=false);
 translate([wall_thickness, 0, 0]) { cube([width, depth, l1], center=false);}
}
}


//right_angle_bracket_right();
//translate([width+2*wall_thickness+2, 0, length1+width+3*wall_thickness+2]) { rotate([0, 180, 0]) { right_angle_bracket_left(); }}

straight(width, depth, length3);