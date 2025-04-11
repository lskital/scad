od = 20;
id = 18;
tab_x = 12;
tab_y = 1.5*od;
tab_h = 3;
oh=8;
ih=7.5;

hole_d = 25.4;

module solid_plug() {
translate([0, 0, -0.5*tab_h+oh]) cube([tab_x, tab_y, tab_h], center=true);
cylinder(d=od, h=oh);
}

module plug()
difference() {
solid_plug();
cylinder(d=id, h=ih);
}


module double_plug() {
  plug();
  translate([0, hole_d, 0]) plug();
}


double_plug();