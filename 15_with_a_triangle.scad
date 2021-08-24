
font="Bitstream Vera Sans:style=Bold";
//font="Titan One";
//font="Baskerville:style=Bold";
text_on_flat="15";
//text_on_flat2="Kingi";
text_size=80;
depth=5;
spacing=1;

frame_z_offset = 0.5*text_size;

frame_width=10;
frame_depth=20;
frame_cover_overlap=frame_width*0.8;
picture_overlap=frame_width-frame_cover_overlap;

picture_x=100;
picture_z=150;
picture_depth=0.5*frame_depth;

cover_spacing=0.4;
cover_wall_width=0.8;
cover_depth_multiplier=0.8;

module the_bar(length) {
  bar_depth = 0.33*depth;
  translate([0, 0, 0.5*bar_depth]) cube([length, 0.1*text_size, bar_depth], center=true);
}


module the_text(text, size) {
linear_extrude(height=depth, convexity=4)
    text(text, 
         size=size,
         font=font,
         halign="center",
         spacing=spacing);
}

module the_text_with_bar(text, size, length) {
linear_extrude(height=depth, convexity=4)
    text(text, 
         size=size,
         font=font,
         halign="center",
         spacing=spacing);
  the_bar(length);
}

module ibar(width, length) {
  cube([width, length, 1]);
}


translate([0, 5, 0]) linear_extrude(0.33*depth) polygon([[-30,0],[30,0],[0,-80]]);
the_text(text_on_flat, 60);
//translate([0, -50, 0]) the_text_with_bar(text_on_flat, 60, 50);
//the_frame();
//cover();
//translate([29.8, 18, 0]) ibar(6,6);
//translate([48.3, -29.5, 0]) ibar(7.35,7);
//translate([-23.8, -29.5, 0]) ibar(7.35,7);