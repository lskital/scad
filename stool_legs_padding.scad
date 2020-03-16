padding = 5;
id = 16;
od = id+2*padding;

l = 50;


cutout = od*0.2;

difference() {
cylinder(d=od, h=l);
cylinder(d=id, h=l);
translate([-0.5*cutout, 0, 0]) cube([cutout, 0.5*od, l]);
}