// GShock GBA 800 chapter ring

od = 33;
id = 31;
ring_h = 0.9;

module main_ring() {
    $fn=72;
    difference() {
        cylinder(h=ring_h, d=od);
        cylinder(h=ring_h, d=id);
    }
}

module idx(width, length, rot) {
    idx_h = 2;
    rotate([0, 0, rot]) translate([-0.5*od, -0.5*width, 0]) {
        difference() {
          cube([length, width, idx_h]);
          translate([1, 0, 2]) rotate([0, 30, 0]) cube([10, width, idx_h]);
        }
    }
}
module notches() {
    rot = 15;
    nl_w = 2;
    nl_s = 1;
    rotate([0, 0, -15]) translate([-0.5*od-1, -0.5*nl_w, 0]) cube([1.5, nl_w, ring_h]);
    rotate([0, 0, -195]) translate([-0.5*od-1, -0.5*nl_s, 0]) cube([1.5, nl_s, ring_h]);
}

main_ring();
idx(3, 3.5, 0);
idx(3, 3.5, 180);

idx(3, 3.5, 90);
idx(3, 3.5, 270);

idx(2, 3.5, 30);
idx(2, 3.5, -30);
idx(2, 3.5, -60);
idx(2, 3.5, -120);
idx(2, 3.5, -150);

idx(2, 2.5, 60);
idx(2, 2.5, 120);
idx(2, 2.5, 150);

notches();

