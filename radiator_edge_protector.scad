l = 50;
w_tot = 5;
h_tot = 7.5;
h_grove = 5;
ww = 2;
wg = 1;

difference() {
cube([w_tot, l, h_tot]);
translate([ww, 0, 0]) cube([wg, l, h_grove]);
}