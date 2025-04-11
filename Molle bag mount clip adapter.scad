
stud_d=6;
stud_h=60;
stud_w=22;
base_d=6;
base_h=25;
stud_distance=90;



extension_d=22;
extension_h=base_h;
extension_w=15;
hole_distance=85;
hole_dia=6;
head_dia=10;
//head_d=6;

base_w=hole_distance+stud_w;

screw_length=21;

lightbar_dia=20;
lightbar_elevation=26;
lightbar_stand_w=4;
lightbar_stand_d=10;

module lightbar() {
  translate([0.5*(stud_w)-0.5*lightbar_stand_w, 0.5*lightbar_dia, 0])    
    rotate([0, 90, 0]) cylinder(h=hole_distance+lightbar_stand_w, d=lightbar_dia);
  translate([0.5*(stud_w)-0.5*lightbar_stand_w, 0, 0])  
    cube([lightbar_stand_w, lightbar_stand_d, lightbar_elevation+0.5*(lightbar_dia+extension_h)]);
  translate([0.5*(stud_w-lightbar_stand_w)+hole_distance, 0, 0])  
    cube([lightbar_stand_w, lightbar_stand_d, lightbar_elevation+0.5*(lightbar_dia+extension_h)]);
}

module stud() {
  cube([stud_w, stud_d, stud_h]);


}

module extension() {
  //cube([extension_w, extension_d, extension_h]);
  //cube([0.5*extension_w, extension_d, 0.5*extension_h]);
  hull() {
    cube([extension_w, base_d, extension_h]);
  translate([1, extension_d-base_d, 0.5*extension_w-2]) cube([extension_w-2, base_d, extension_w]);
  }
}

module screw_hole() {
  $fn=24;
  hole_needed=base_d+extension_d;
  head_d = hole_needed - screw_length;
    translate([0.5*base_w, 0, -0.5*base_h])
    rotate([-90, 0, 0]) {
        cylinder(h=base_d+extension_d, d=hole_dia);
        //cylinder(h=head_d, d=head_dia);
    }
}

module base() {
  cube([base_w, base_d, base_h]);
  stud();
  translate([base_w-stud_w, 0, 0]) stud();

    translate([0.5*(base_w-extension_w+hole_distance), 0, 0]) extension();
  translate([0.5*(base_w-extension_w-hole_distance), 0, 0]) extension();
    
    
    translate([0, 0, -(lightbar_elevation+0.5*lightbar_dia)])
  lightbar();
}

difference() {
  translate([0, 0, -base_h]) base();
  translate([0.5*hole_distance, 0, 0]) screw_hole();
  translate([-0.5*hole_distance, 0, 0]) screw_hole();
  translate([0.5*hole_distance, 0, 40]) screw_hole();
  translate([-0.5*hole_distance, 0, 40]) screw_hole();
  translate([0.5*hole_distance, 0, 20]) screw_hole();
  translate([-0.5*hole_distance, 0, 20]) screw_hole();
}

