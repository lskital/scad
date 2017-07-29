// violin limiter

insert_height = 9;

base_width = 50;
base_depth = insert_height;
base_height = 35;



cutout_width = 38;

x_offset = 0.5*(base_width - cutout_width);

difference() {
cube([base_width, base_depth, base_height]);
translate([x_offset, 0, insert_height]) cube([cutout_width, base_depth, base_height]);
}