// Vesa 100mm to 75mm adapter


plate_edge = 120;
plate_height = 10;
vesa_a = 100;
vesa_b = 75;

hole_a = 5.5;
hole_b = 4.5;

nut_h = 5;
nut_d = 9.5;

head_d = 10;
head_h = 5;



module plate() {
    cube([120,120,10], center=true);
}

module vesa_hole_a() {
    cylinder(d=hole_a, h=plate_height, center=true, $fn=12);
    translate([0, 0, 0.5*(plate_height-nut_h)]) cylinder(d=nut_d, h=nut_h, center=true, $fn=6);
}

module vesa_hole_b() {
    cylinder(d=hole_b, h=plate_height, center=true, $fn=12);
    translate([0, 0, -0.5*(plate_height-head_h)]) cylinder(d=head_d, h=head_h, center=true, $fn=12); 
}
module vesa_a_holes() {
  off = 0.5 * vesa_a;
  translate([off, off, 0]) vesa_hole_a();
  translate([-off, -off, 0]) vesa_hole_a();
  translate([-off, off, 0]) vesa_hole_a();
  translate([off, -off, 0]) vesa_hole_a();
}
module vesa_b_holes() {
  off = 0.5 * vesa_b;
  translate([off, off, 0]) vesa_hole_b();
  translate([-off, -off, 0]) vesa_hole_b();
  translate([-off, off, 0]) vesa_hole_b();
  translate([off, -off, 0]) vesa_hole_b();
}

difference() 
{
  plate();
  vesa_a_holes();
  vesa_b_holes();
}
