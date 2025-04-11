e1_dia=23.25;
e2_dia=25.75;
h=2.3;
dist=35;
slot_w=3;
joiner_w=10;
hole_dia=6;
angle=220;


module coin(dia) {

rotate_extrude(angle=angle) square([0.5*dia, h]);

}



module key() {
rotate([0, 0, 0.5*(180-angle)+90]) coin(e1_dia);
translate([dist, 0, 0]) rotate([0, 0, 0.5*(180-angle)-90]) coin(e2_dia);
translate([0, -0.5*joiner_w, 0]) cube([dist, joiner_w, h]);
}

module cut_out() {
cylinder(d=hole_dia, h=h);
translate([dist, 0, 0]) cylinder(d=hole_dia, h=h);
translate([0, -0.5*slot_w, 0]) cube([dist, slot_w, h]);
}


difference() {
key();
cut_out();
}

