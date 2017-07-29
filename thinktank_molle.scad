
slot_length=105;
slot_width=5;

molle_length=48;
molle_distance=3;
molle_width=6.2;

wall_width=3;
molle_separator_width=wall_width;


depth=10;

$fn=10;

module base() {
    //width excluding 'minkowsky' sum
  internal_width = slot_width + wall_width + molle_width;
  minkowski() {
    cube([slot_length, internal_width, 0.5*depth], center=false);
    cylinder(r=wall_width, h=0.5*depth, center=false);
}
}

module slot_cube(length, width, depth) {
    cube_length = length-width;
    translate([0.5*width, 0, 0]){
    cube([cube_length, width, depth], center=false);
    translate([0, 0.5*width, 0]) {cylinder(h=depth, d=width, center=false);}
    translate([cube_length, 0.5*width, 0]) {cylinder(h=depth, d=width, center=false);}
}}

module gen_molle_slots(length) {
    molle_target_length=length-2*wall_width;
    echo ("molle_target_length", molle_target_length);
    count = floor((molle_target_length + molle_separator_width) / (molle_length + molle_separator_width));
    echo ("count", count);
    molle_total_length = count*molle_length + (count-1) * molle_separator_width;
    echo ("molle_total_length1", molle_total_length);
    initial_offset = 0.5 * (length - molle_total_length);
    echo("initia_offset", initial_offset);
    for(i = [0:count-1]) {
        offset = initial_offset + (molle_length+wall_width)*i;
        echo ("offset", offset, i);
        translate([offset, 0, 0]) {slot_cube(molle_length, molle_width, depth);}
    }

}



difference() {
  base();
  slot_cube(slot_length, slot_width, depth);
  translate([0, slot_width + wall_width, 0]) gen_molle_slots(slot_length);
}
