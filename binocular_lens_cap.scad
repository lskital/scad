//Binocular lens cap
$fn=100;
//small side:
//lens_d = 34;
//cap_distance = 10;


//large side:
lens_d = 41;
cap_distance = 4;


cap_depth = 10;



arc_multiplier = 4;
//arc_width = 1 * cap_distance;
arc_width = 10;
arc_length = cap_distance*3.14;
arc_hole = 0.33 * arc_width;

wall_width = 1.6;


module arc() {
    outer_d = cap_distance*arc_multiplier;
    inner_d = outer_d-arc_width;
    echo(outer_d);
    echo(inner_d);
    module base_cylinder() translate([0, -inner_d, 0]) difference()
    {
      cylinder(r=outer_d, h=wall_width);
      cylinder(r=inner_d, h=wall_width);
    }
    intersection() 
    {
        base_cylinder();
        translate([0, 0.5*cap_distance, 0]) cube([2*arc_length, 2*arc_width, 4*wall_width], center=true);
    }
}

module oval(arc_d, length) {
    offset = 0.5*(length - arc_d);
    echo(offset);
    hull() {
      translate([offset, 0, 0]) cylinder(d=arc_d, h=wall_width);
      translate([-offset, 0, 0]) cylinder(d=arc_d, h=wall_width);
  }
}


module lens_cap(d) {
    difference() {
    cylinder(h=cap_depth+wall_width, d=d+2*wall_width);
    translate([0, 0, wall_width]) cylinder(h=cap_depth, d=d);
    
    }
    
}
difference() {
translate([0, 0.25*lens_d, 0]) arc();
translate([0, 0.25*lens_d + 0.5*arc_width, 0])    oval(arc_d=arc_hole, length=2.5*arc_hole);
//translate([0, 0.25*lens_d + 0.5*arc_width, 0]) cylinder(d=arc_hole, h=wall_width);
}
x_offset = 0.5*(lens_d+2*wall_width+cap_distance);
translate([-x_offset, 0, 0]) lens_cap(lens_d);
translate([x_offset, 0, 0])lens_cap(lens_d);

