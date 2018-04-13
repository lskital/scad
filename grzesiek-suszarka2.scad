$fn = 50;

cylinder_in_d = 10.5;
cylinder_h = 17;
cylinder_out_d = 15;

distance = 55;
d_wall = 4;

cylinder_wall = cylinder_out_d -cylinder_in_d;

module cylinder_mount() {
    difference() {
        cylinder(h=cylinder_h, d=cylinder_out_d, center=true);
        cylinder(h=cylinder_h, d=cylinder_in_d, center=true);
    }
}

module cylinder_mount_cut() {
    difference() {
        cylinder(h=cylinder_h, d=cylinder_out_d, center=true);
        cylinder(h=cylinder_h, d=cylinder_in_d, center=true);
        translate([0.57*cylinder_out_d, 0, 0]) cylinder(h=cylinder_h, d=cylinder_out_d, center=true);
    }
}

translate([0, 0.5*(distance+cylinder_out_d), 0]) cylinder_mount_cut();
cube([d_wall, distance + cylinder_wall, cylinder_h], center=true);
translate([0, -0.5*(distance+cylinder_out_d), 0]) cylinder_mount();