
slot_length=240;
slot_width=6.2;

molle_length=10;
molle_distance=48;
molle_width=2;

wall_width=4;
molle_separator_width=wall_width;

entry_hole_d=9;
entry_hole_offset=10+wall_width;

depth=15;

height=depth+25;

$fn=10;

module base() {
    //width excluding 'minkowsky' sum
  internal_width = slot_width;
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
        offset = initial_offset + (molle_length+molle_distance)*i;
        echo ("offset", offset, i);
        translate([offset, 0, 0]) {slot_cube(molle_length, molle_width, height);}
    }

}

module screw_countersunk(
        l=20,   //length
        dh = 8,   //head dia
        lh = 3,   //head length
        ds = 4,  //shaft dia
        $fn=20,
        )
{
    union() {
        cylinder(h=lh, r1=dh/2, r2=ds/2);
        cylinder(h=l, d=ds);
    }
}


difference() {
  base();
  slot_cube(slot_length, slot_width, depth);
  translate([entry_hole_offset, 0, 0.5*depth]) rotate([90, 0, 0]) cylinder(d=entry_hole_d, h=wall_width);
  translate([slot_length - entry_hole_offset, 0, 0.5*depth]) rotate([90, 0, 0]) cylinder(d=entry_hole_d, h=wall_width);
  translate([entry_hole_offset, slot_width-0.1, 0.5*depth]) rotate([-90, 0, 0]) screw_countersunk(); 
  translate([slot_length - entry_hole_offset, slot_width-0.1, 0.5*depth]) rotate([-90, 0, 0]) screw_countersunk();
  
}

  
   

