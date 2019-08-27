
//font="Bitstream Vera Sans Bold";
//font="Arial Black";
font="Baskerville:style=Bold";
text_on_flat="70";
text_size=80;
depth=4;
spacing=0.9;

hole_d = 4;
cube_d = 5;
module the_text() {
linear_extrude(height=depth, convexity=4)
    text(text_on_flat, 
         size=text_size,
         font=font,
         halign="center",
         spacing=spacing);
}

module the_bar() {
  cube([50, 5, 0.5*depth]);
  translate([25, 0, 0]) {
      cube(cube_d);
        the_hole();
  }
}

module the_hole() {
   translate([0.5*(hole_d + (cube_d - hole_d)), cube_d, 0.5*(hole_d + (cube_d - hole_d))]) rotate([90, 0, 0]) 
          cylinder(d=hole_d, h=5); 
}
the_text();
difference() {
  translate([-25, 0, 0]) the_bar();
  the_hole();
}

