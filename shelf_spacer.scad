// spacer for the shelf

x = 25;
y = 70;
z = 18;

h_d = 5;
h_offset = 10;

offset = 0.5*y-h_offset;
difference() {
  cube([x, y, z], center=true);
  translate([0, offset, 0]) cylinder(d=h_d, h=z, center=true);
}