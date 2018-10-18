x = 86;
y = 86;
z = 2;

$fn=20;

hole_d = 5;
hole_distance = 60;

module hole() {
 cylinder(d=hole_d, h=z, center=true);   
}


difference() {
cube([x, y, z], true);
translate([0.5*hole_distance, 0, 0]) hole();
translate([-0.5*hole_distance, 0, 0]) hole();
}