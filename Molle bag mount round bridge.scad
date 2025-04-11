
stud_d=4;
stud_h=85;
stud_w=25;
base_d=10+stud_d;
base_h=20;
stud_distance=90;

base_w = 200;

extension_d=30;
extension_h=base_h;
extension_w=15;
hole_distance=85;
hole_dia=6;
head_dia=10;
//head_d=6;

screw_length=21;

module stud() {
 hull() { 
  cube([stud_w, stud_d, stud_h]);
  translate([0.5*stud_w, 0.5*stud_d, stud_h+0.5*stud_w]) sphere(d=stud_d);
 }
  //translate([0.5*stud_w, 0, stud_h]) rotate([-90, 0, 0]) cylinder(h=stud_d, d=stud_w);

}

module extension() {
  //cube([extension_w, extension_d, extension_h]);
      hull() {
    cube([extension_w, 1, extension_h]);
    translate([1, extension_d-base_d, 0]) cube([extension_w-2, base_d, extension_w]);
  }

}

module screw_hole() {
  $fn=24;
  hole_needed=base_d+extension_d;
  head_d = hole_needed - screw_length;
    translate([0.5*base_w, 0, -0.5*base_h])
    rotate([-90, 0, 0]) {
        cylinder(h=base_d+extension_d, d=hole_dia);
        cylinder(h=head_d, d=head_dia);
    }
}

module base() {
  //cube([base_w, base_d, base_h]);
  hull() {
  translate([0, 0.5*base_h, 0.5*base_h]) rotate([0, 90, 0]) cylinder(d=base_h, h=base_w);
  translate([0, 0.5*base_h, 0]) cube([base_w, 0.5*base_d, 0.5*base_d]);
  }
  //translate([0, 0.5*base_h, 0.5*base_h]) 
 
  hull() {
  translate([0, 0.8*base_h, 0.5*base_h]) rotate([0, 90, 0]) 
    cylinder(d=base_h, h=stud_d);
  translate([0, 0.5*base_h, 0.5*base_h]) rotate([0, 90, 0]) 
    cylinder(d=base_h, h=stud_d);
   }
  hull() {
  translate([base_w-stud_d, 0.8*base_h, 0.5*base_h]) rotate([0, 90, 0]) 
    cylinder(d=base_h, h=stud_d);
   translate([base_w-stud_d, 0.5*base_h, 0.5*base_h]) rotate([0, 90, 0]) 
    cylinder(d=base_h, h=stud_d);
  }
 
  translate([0.5*(base_w-extension_w+hole_distance), 0.5*base_h, 0]) extension();
  translate([0.5*(base_w-extension_w-hole_distance), 0.5*base_h, 0]) extension();
}

difference() {
  translate([0, 0, -base_h]) base();
  translate([0.5*hole_distance, 0, 0]) screw_hole();
  translate([-0.5*hole_distance, 0, 0]) screw_hole();
}
//stud();
//translate([stud_distance, 0, 0]) stud();
