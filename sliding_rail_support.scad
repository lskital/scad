x = 6.6;

x1 = 13;

y = 28;
y1 = 10;

z = 50;


cube([x, y, z]);
translate([0, -y1, 0]) cube([x1, y1, z]);