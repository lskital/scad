depth = 10;
rib_width = 24.6;
insert_width = 8;
insert_height = 15;
flat_width = 2*(rib_width+insert_width);
flat_height = 2;

cube([flat_width, flat_height, depth]);
translate([0.5*rib_width, flat_height, 0]) cube([insert_width, insert_height, depth]);
translate([1.5*rib_width+insert_width, flat_height, 0]) cube([insert_width, insert_height, depth]);