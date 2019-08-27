od = 40.7;
od_low = 34.5;
h_hull = 20;
h = h_hull+14;
h_mid = 3;
h_low = 25;

od1 = 25.6;
h1 = 32;

wall = 1;

dist = -1;

overlap = 10;

id = od - 2*wall;
id_low = od_low - 2*wall;
id1 = od1 - 2*wall;

offset = 0.5 * (od1 + dist);


module outer() {
hull() {
cylinder(d=od, h=h_hull);
translate([0, offset, -h1]) cylinder(d=od1, h=h1+overlap);
translate([0, -offset, -h1]) cylinder(d=od1, h=h1+overlap);
}
cylinder(d=od, h=h);
translate([0, 0, h])cylinder(d1=od, d2=od_low, h=h_mid);
translate([0, 0, h+h_mid])cylinder(d=od_low, h=h_low);
}

difference() {
    outer();
    cylinder(d=id, h=h);
    cylinder(d=id_low, h=h+h_mid+h_low);
    translate([0, offset, -h1]) cylinder(d=id1, h=h1);
    translate([0, -offset, -h1]) cylinder(d=id1, h=h1);
    translate([0, offset, 0])sphere(d=id1);
    translate([0, -offset, 0])sphere(d=id1);
}