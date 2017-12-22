include <shapes.scad>;


size = 62.5;
width = 10;
height = 12;

handle_lenght_factor = 2.5;
handle_width_factor = 1/1.75;

module wrench_base(size, height) {
    handle_lenght = size * handle_lenght_factor;
    handle_width = size * handle_width_factor;
    base_size = size + 2*width;
    
    cube([handle_lenght, handle_width, height], center=true);
    hexagon(size=base_size, height=height);
}


module wrench(size, height) {
  difference() {
    wrench_base(size, height);
    hexagon(size=size, height=height);
  }
    
}



/*
difference() {
//cylinder(d=72, h=0.2);
hexagon(size=66, height=0.5);
hexagon(size=62.5, height=0.5);
}
*/

wrench(size, height);