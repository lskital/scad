$fn = 20;
od = 10;
id = 7;

taper_h = 5;
taper_d = id + 1;
h = 16;

cut_w = 4;
cut_depth = 0.5*(od - id);
cut_h = 9;

module body() {
cylinder(d=od, h=h);
translate([0, 0, h]) cylinder(d1=od, d2=taper_d, h=taper_h);
}

difference() {
body();
translate([0.5*cut_w, -0.5*cut_depth, 0]) cube([cut_w, cut_depth, cut_h]);
cylinder(d=id, h=h+taper_h);
}