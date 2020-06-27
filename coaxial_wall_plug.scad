// coaxial wall plug

od = 10;
id = 8;

base_d = 20;
base_h = 2;

stem_h = 15;

chamfer_h = 5;

module plug() {
cylinder(d=base_d, h=base_h);
translate([0, 0, base_h]) 
  cylinder(d=od, h=stem_h-chamfer_h);
translate([0, 0, base_h+stem_h-chamfer_h])
  cylinder(d1=od, d2=id, h=chamfer_h);
}

difference() {
    plug();
    cylinder(d=id, h=base_h+stem_h);
}
