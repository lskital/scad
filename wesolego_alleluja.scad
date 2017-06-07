
//font="Bitstream Vera Sans Bold";
//font="Arial Black";
font="Baskerville:style=Bold";
text_on_flat="Wesołego";
text_on_flat2="Alleluja";
text_size=40;
depth=3;
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



module the_text(text) {
linear_extrude(height=depth, convexity=4)
    text(text, 
         size=text_size,
         font=font,
         halign="center",
         spacing=spacing);
}

module picture_frame() {
    frame_size_x = picture_x - 2*picture_overlap + 2*frame_width;
    frame_size_z = picture_z - 2*picture_overlap + 2*frame_width;
    window_size_x = picture_x - 2*picture_overlap;
    window_size_z = picture_z - 2*picture_overlap;
    translate([-0.5*frame_size_x, 0, 0]) difference() {
        cube([frame_size_x, frame_depth, frame_size_z]);
        translate([frame_width, 0, frame_width]) cube([window_size_x, frame_depth, window_size_z]);
    }    
}

module base_frame_with_text() {
  rotate([90, 0, 0]) the_text();
  translate([0, -frame_depth, frame_z_offset]) picture_frame();
}

module picture_cut() {
  real_picture_depth=frame_depth-picture_depth;
  translate([-0.5*picture_x, -real_picture_depth, frame_z_offset+frame_width-picture_overlap]) cube([picture_x, real_picture_depth, picture_z]);
}


module the_frame() {
    difference() {
      base_frame_with_text();
      picture_cut();
    }
}

module cover() {
  real_cover_depth=cover_depth_multiplier*(frame_depth-picture_depth);
  cover_x = picture_x-2*cover_spacing;
  cover_z = picture_z-2*cover_spacing;
  cut_x = 0.5*(cover_x-3*cover_wall_width);
  cut_z = cover_z-2*cover_wall_width;
  cut_y = real_cover_depth-cover_wall_width;
  
  translate([-0.5*cover_x, -real_cover_depth, frame_z_offset+frame_width-picture_overlap+cover_spacing]) 
    difference() {
      cube([cover_x, real_cover_depth, cover_z]);
      translate([cover_wall_width, 0, cover_wall_width]) cube([cut_x, cut_y, cut_z]);
      translate([cut_x+2*cover_wall_width, 0, cover_wall_width]) cube([cut_x, cut_y, cut_z]);
    }
}


the_text(text_on_flat);
translate([0, -50, 0]) the_text(text_on_flat2);
//the_frame();
//cover();
