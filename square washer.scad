


x = 49;
y = 48;
z = 7;

d = 7;

difference() {
cube([x, y, z]);
translate([0.5*x, 0.5*y, 0]) cylinder(d=d, h=z);
}
