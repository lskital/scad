$fn=50;

out_cube_x = 22;
out_cube_y = 23;
out_cube_z = 16;

cylinder_in_d = 10.5;
cylinder_h = 16;

x_wall = 2;
y_wall = 2;
z_wall = 2;

cylinder_out_d = out_cube_z;

in_cube_x = out_cube_x - x_wall;
in_cube_y = out_cube_y - 2 * y_wall;
in_cube_z = out_cube_z - z_wall;

x_offset = 0.5 * x_wall;
y_offset = 0;
z_offset = 0.5 * z_wall;

module cage1() {
difference() {
    cube([out_cube_x, out_cube_y, out_cube_z], true);
    translate([x_offset, y_offset, z_offset]) cube([in_cube_x, in_cube_y, in_cube_z], true);
    translate([0.5*in_cube_x+x_offset, 0, -0.5*in_cube_z]) cylinder(d=in_cube_y, h=z_wall, center=true);
    }

translate([0.5*out_cube_x, 0.5*(out_cube_y-y_wall), 0]) rotate([90, 0, 0]) cylinder(h=y_wall, d=out_cube_z, center=true);
translate([0.5*out_cube_x, -0.5*(out_cube_y-y_wall), 0]) rotate([90, 0, 0]) cylinder(h=y_wall, d=out_cube_z, center=true);
}

module cylinder_mount() {
    difference() {
        cylinder(h=cylinder_h, d=cylinder_out_d, center=true);
        cylinder(h=cylinder_h, d=cylinder_in_d, center=true);
    }
}



cage1();
//translate([0, 0.5*(out_cube_y+cylinder_h), 0]) rotate([90, 0, 0]) cylinder_mount();
translate([0, -0.5*(out_cube_y+cylinder_h), 0]) rotate([90, 0, 0]) cylinder_mount();
translate([-0.5*(out_cube_x+cylinder_h), 0, 0]) rotate([0, 90, 0]) cylinder_mount();