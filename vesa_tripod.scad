// Vesa 100mm to 75mm adapter


plate_edge = 120;
plate_height = 5;
vesa_a = 100;
vesa_b = 75;

hole_a = 5.5;
hole_b = 4.5;

nut_h = 5;
nut_d = 9.5;

head_d = 10;
head_h = 5;



module plate() {
    cube([plate_edge,plate_edge,plate_height], center=true);
}

module vesa_hole_a() {
    cylinder(d=hole_a, h=plate_height, center=true, $fn=12);
    translate([0, 0, 0.5*(plate_height-nut_h)]) cylinder(d=nut_d, h=nut_h, center=true, $fn=6);
}

module vesa_hole_b() {
    cylinder(d=hole_b, h=plate_height, center=true, $fn=12);
    //translate([0, 0, -0.5*(plate_height-head_h)]) cylinder(d=head_d, h=head_h, center=true, $fn=12); 
}
module vesa_a_holes_() {
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

module vesa_a_holes() {
  off = 0.5 * vesa_a;
  translate([off, off, 0]) vesa_hole_b();
  translate([-off, -off, 0]) vesa_hole_b();
  translate([-off, off, 0]) vesa_hole_b();
  translate([off, -off, 0]) vesa_hole_b();
}

module bottom_plate() {
 difference() {
   cube([plate_height, plate_edge, plate_edge+plate_height]);
   for(i = [-40, -20, 0, 20, 40]) {
    translate([-0.5*plate_height, 0.5*plate_edge, 0.5*plate_edge+i]) rotate([0, 90, 0]) 
    cylinder(h=2*plate_height, d=6);
   }
     
 }

}

difference() 
{
  plate();
  vesa_a_holes();
  vesa_b_holes();
}

x = plate_edge;

translate([-0.5*x-plate_height, -0.5*x ,-x-0.5*plate_height])
bottom_plate();

offset = 0.25*75;

translate([-0.5*x, -offset-plate_height, -0.5*plate_height]) rotate([-90, 0, 0]) 
  linear_extrude(plate_height) polygon([[0,0],[0,x],[x,0]]);

translate([-0.5*x, offset, -0.5*plate_height]) rotate([-90, 0, 0]) 
  linear_extrude(plate_height) polygon([[0,0],[0,x],[x,0]]);
