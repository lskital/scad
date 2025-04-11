d1 = 40;
d2 = 50;
wall = 1;
h  = 20;
bottom = 1;

difference() {
cylinder(d1=d1, d2=d2, h=h);
translate([0, 0, bottom])
cylinder(d1=d1-wall, d2=d2-wall, h=h-bottom);
}

grab_handles = 0.3;
intersection() {
cylinder(d1=d1, d2=d2, h=h);    
translate([-0.5*d2, 0, 0]) cube([d2*grab_handles, wall, h]);
}

intersection() {
cylinder(d1=d1, d2=d2, h=h);    
translate([0.5*d2-(d2*grab_handles), 0, 0]) cube([d2*grab_handles, wall, h]);
}