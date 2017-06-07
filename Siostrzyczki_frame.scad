
//font="Bitstream Vera Sans Bold";
//font="Arial Black";
font="Baskerville:style=Bold";
text_on_flat="Siostrzyczki";
//text_on_flat="SIOSTRZYCZKI";
text_size=35;
depth=40;
spacing=0.89;

frame_z_offset = 0.5*text_size;

frame_width=10;
frame_depth=20;
frame_cover_overlap=frame_width*0.5;
picture_overlap=frame_width-frame_cover_overlap;

picture_x=180;
picture_z=130;
picture_depth=0.5*frame_depth;

cover_spacing=0.5;
cover_wall_width=1.2;
cover_depth_multiplier=0.8;



module the_text() {
linear_extrude(height=depth, convexity=4)
    text(text_on_flat, 
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

module support() {
    frame_size_x = picture_x - 2*picture_overlap + 2*frame_width;
    support_width=5;
    support_height=5;
    z_offset = support_height+7;
    translate([-0.5*frame_size_x, -depth, -z_offset]) 
    {
        cube([frame_size_x, depth, support_height]);
        translate([0, depth-support_width, support_height]) cube([frame_size_x, support_width, z_offset-support_height]);
    }
        
}

//the_frame();
//support();
cover();
