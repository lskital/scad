//shelf trim 2

x = 26;
y = 300;
z = 19;

x1 = 50;
y1 = 1;
z1 = 63;

overlap_h = 0.45;
overlap_d = 2;



translate([0, -y, 0]) cube([x, y, z]);
cube([x1, y1, z1]);
translate([0, -overlap_d, 0]) cube([x1, overlap_d, overlap_h]);
