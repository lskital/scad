include <threads.scad>;

cut_offset=45;
cut_d=50;

height=18;
dia = 55;

r = 0.5 * dia;
circle_offset = r - 0.5*height;

grabs_d = 15;
grabs_depth = 0.25;
base_size=0.9; // percent of diameter

module rounded(){
  rotate_extrude(convexity = 10, $fn = 100)
    translate([circle_offset, 0, 0])
      circle(d = height, $fn = 100);
  cylinder(d=dia-height, h=height, center=true, $fn=100);
  translate([0, 0, -0.25*height]) cylinder(d=base_size*dia, h=0.5*height, center=true, $fn=100);
  //for(i = [0:7]) rotate([0, 0, i*45]) translate([r-grabs_depth*grabs_d, 0, 0]) sphere(d=grabs_d, center=true);
}

/*
difference()
{
cylinder(d=55, h=height);
//translate([cut_offset, 0, 0]) cylinder(d=50, h=height);
//translate([-cut_offset, 0, 0]) cylinder(d=50, h=height);
//translate([0, cut_offset, 0]) cylinder(d=50, h=height);
//translate([0, -cut_offset, 0]) cylinder(d=50, h=height);
for(i = [0:7]) rotate([0, 0, i*45]) translate([30, 0, 0]) cylinder(d=20, h=height);
metric_thread(27, 6.35, height, square=true, rectangle=0.5, internal=true);
}
*/

difference(){
  rounded();
  //cylinder(d=dia-height, h=height, center=true, $fn=10);
  translate([0, 0, -0.5*height])
    metric_thread(27, 6.35, height, square=true, rectangle=0.5, internal=true);
}

