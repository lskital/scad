plug_h = 23;

cut_off=1.5;
hole_d = 5.8;
hole_depth = plug_h;
hole_taper_d = 5.1;
hole_taper_h = 3;
nut_hole_h = 5;
nut_hole_d = 11.5;

wall = 2;

outer_d = hole_d+wall;
outer_nut_d = nut_hole_d+wall;
outer_nut_h = nut_hole_h+wall;


module cut_out() {
    translate([0, 0, 0]) {
  cylinder(h=hole_depth, d=hole_d);
  cylinder(h=nut_hole_h, d=nut_hole_d);
  translate([0, 0, nut_hole_h]) cylinder(h=hole_taper_h, d1=hole_taper_d, d2=hole_d);
  translate([0, 0, plug_h]) sphere(d=outer_d-2);
    }
}

module outer_shell() {
    translate([0, 0, 0]) {
  cylinder(h=plug_h, d=outer_d);
  cylinder(h=outer_nut_h, d=outer_nut_d);
  translate([0, 0, plug_h]) sphere(d=outer_d);
    }
}

module screw_cover() 
difference() {
sphere(d=sphere_d);
translate([0, 0, 0]) {
  cylinder(h=hole_depth, d=hole_d);
  cylinder(h=nut_hole_h, d=nut_hole_d);
  translate([0, 0, nut_hole_h]) cylinder(h=hole_taper_h, d1=hole_taper_d, d2=hole_d);

}
translate([0, 0, 0.5*sphere_d-cut_off]) cylinder(d=sphere_d, h=sphere_d);
}

difference() {

hull() 
   outer_shell();
cut_out();
}
