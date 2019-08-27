x = 150;
y = 90;
z = 2;

$fn=20;

hole_d = 4;
hole_d2 = 6;
hole_distance = 120;

module hole() {
 cylinder(d1=hole_d, d2=hole_d2, h=z, center=true);   
}


difference() {
cube([x, y, z], true);
translate([0.5*hole_distance, 0, 0]) hole();
translate([-0.5*hole_distance, 0, 0]) hole();
}