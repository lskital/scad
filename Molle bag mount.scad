
stud_d=4;
stud_h=85;
stud_w=25;
base_d=10+stud_d;
base_h=25;
stud_distance=90;

base_w = stud_distance+stud_w;

extension_d=20;
extension_h=base_h;
extension_w=15;
hole_distance=45;
hole_dia=5;
head_dia=10;
head_d=6;

module stud() {
 hull() { 
  cube([stud_w, stud_d, stud_h]);
  translate([0.5*stud_w, 0.5*stud_d, stud_h+0.5*stud_w]) sphere(d=stud_d);
 }
  //translate([0.5*stud_w, 0, stud_h]) rotate([-90, 0, 0]) cylinder(h=stud_d, d=stud_w);

}

module extension() {
  cube([extension_w, extension_d, extension_h]);

}

module screw_hole() {
  translate([0.5*base_w, 0, -0.5*base_h])
    rotate([-90, 0, 0]) {
        cylinder(h=base_d+extension_d, d=hole_dia);
        cylinder(h=head_d, d=head_dia);
    }
}

module base() {
  
  cube([base_w, base_d, base_h]);
  translate([0.5*(base_w-extension_w+hole_distance), base_d, 0]) extension();
  translate([0.5*(base_w-extension_w-hole_distance), base_d, 0]) extension();
}

difference() {
  translate([0, 0, -base_h]) base();
  translate([0.5*hole_distance, 0, 0]) screw_hole();
  translate([-0.5*hole_distance, 0, 0]) screw_hole();
}
stud();
translate([stud_distance, 0, 0]) stud();
