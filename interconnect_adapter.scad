$fn = 20;
od = 10;
<<<<<<< HEAD
id = 7;
=======
id = 5.5;
>>>>>>> 7d5d58d6f3ac0b9d6b1bb4ce78e86bbd80a453cb

taper_h = 5;
taper_d = id + 1;
h = 16;

cut_w = 4;
cut_depth = 0.5*od;
cut_h = 9;

module body() {
cylinder(d=od, h=h);
translate([0, 0, h]) cylinder(d1=od, d2=taper_d, h=taper_h);
}

difference() {
body();
//translate([-0.5*cut_w, 0.25*id, 0]) cube([cut_w, cut_depth, cut_h]);
cylinder(d=id, h=h+taper_h);
}

