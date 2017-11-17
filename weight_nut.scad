include <threads.scad>;


cut_offset=45;
cut_d=50;

height=25;
dia = 50;


//english_thread(1, 4, 4, square=true);


r = 0.5 * dia;
circle_offset = r - 0.5*height;


module rounded(){
  translate([0,0,0]){
    rotate_extrude(convexity = 10, $fn = 100)
      translate([circle_offset, 0, 0])
        circle(d = height, $fn = 100);
  }
  cylinder(d=dia-height, h=height, center=true);
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
  translate([0, 0, -0.5*height])
    metric_thread(27, 6.35, height, square=true, rectangle=0.5, internal=true);
}