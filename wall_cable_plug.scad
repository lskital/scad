dia1=27;
dia2=dia1+5;
dia3=dia1-2;
h1=1;
h2=7;

cable_hole_x=11;
cable_hole_y=5.5;


module cable_hole() {
  hull() {
  translate([cable_hole_y/2,0,0])
    cylinder(d=cable_hole_y, h=h1, center=false);
  translate([-cable_hole_y/2,0,0])
    cylinder(d=cable_hole_y, h=h1, center=false);
  }
}


module plug() {
  cylinder(d=dia2, h=h1, center=false);
  difference() {
    translate([0, 0, h1]) cylinder(d=dia1, h=h2, center=false);
    translate([0, 0, h1]) cylinder(d=dia3, h=h2, center=false);
  }
    
}

difference() {
plug();
translate([0, 9, 0]) cable_hole();
translate([0, 12, h1+0.5*h2]) cube([cable_hole_x, cable_hole_y, h2], center=true);
}