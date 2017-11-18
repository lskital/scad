// Ryobi up-side-down holder for tools and batteries




slot_height = 82;  // height of the battery + tool's base with some margin
depth = 135;  // total depth of the mount

slot_width = 83;

cut_out_width = 50;
cut_out_depth = 92;

side_walls_width = 3;

top_width = 5;

bottom_width = 3;


//------

total_height = slot_height + top_width + bottom_width;
total_width = slot_width + 2 * side_walls_width;

screw_z_offset = slot_height + bottom_width;
screw_x_offset = 0.5 * total_width;
screw_x_offset_1 = 0.5 * (total_width - cut_out_width);
screw_x_offset_2 = 0.5 * (total_width + cut_out_width);

middle_screw_depths = [0.10, 0.25, 0.5, 0.85];

front_screw_depth = 15;

module cage() {
  difference() {
      cube([total_width, depth, total_height]);
      translate([side_walls_width, 0, bottom_width]) cube([slot_width, depth, slot_height]);
      translate([0.5*total_width, cut_out_depth-0.5*cut_out_width, 0])
        cylinder(d=cut_out_width, h=bottom_width);
      translate([0.5*(total_width-cut_out_width), 0, 0])
        cube([cut_out_width, cut_out_depth-0.5*cut_out_width, bottom_width]);
      translate([screw_x_offset, cut_out_depth, screw_z_offset]) screw_countersunk();
      translate([screw_x_offset_1, front_screw_depth, screw_z_offset]) screw_countersunk();
      translate([screw_x_offset_2, front_screw_depth, screw_z_offset]) screw_countersunk();
      for (i = middle_screw_depths)
        translate([screw_x_offset, i*depth, screw_z_offset]) screw_countersunk();
  }
}

module screw_countersunk(
        l=20,   //length
        dh = 8,   //head dia
        lh = 3,   //head length
        ds = 4,  //shaft dia
        $fn=20,
        )
{
    union() {
        cylinder(h=lh, r1=dh/2, r2=ds/2);
        cylinder(h=l, d=ds);
    }
}

cage();
//translate([screw_x_offset, cut_out_depth, screw_z_offset]) screw_countersunk();