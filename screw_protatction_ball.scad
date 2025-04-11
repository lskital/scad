sphere_d = 30;
cut_off=1.5;
hole_d = 7.8;
hole_depth = sphere_d-cut_off-1;
hole_taper_d = 8.2;
hole_taper_h = 5;
nut_hole_h = 8;
nut_hole_d = 15;

 
difference() {
sphere(d=sphere_d);
translate([0, 0, -0.5*sphere_d]) {
  cylinder(h=hole_depth, d=hole_d);
  cylinder(h=nut_hole_h, d=nut_hole_d);
  translate([0, 0, nut_hole_h]) cylinder(h=hole_taper_h, d1=hole_taper_d, d2=hole_d);
}
translate([0, 0, 0.5*sphere_d-cut_off]) cylinder(d=sphere_d, h=sphere_d);
}
