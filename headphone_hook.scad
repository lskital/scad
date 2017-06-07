//Headpohne hook


shelf_height=49.8;

shelf_mount_depth=shelf_height;
shelf_mount_width=shelf_height;

headband_dia = 150;

wall_width=4;

module mount() {
  difference() {
    cube([shelf_mount_depth+wall_width, shelf_mount_width, shelf_height+2*wall_width], center=false);
    translate([0, 0, wall_width]) cube([shelf_mount_depth, shelf_mount_width, shelf_height], center=false);
  }
}

module headband() {
}
//mount();