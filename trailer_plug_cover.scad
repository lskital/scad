od = 38;
id = 36;
hd = 6;

base_h = 3;
cup_h = 20;


difference() {
cylinder(d=od, h=base_h+cup_h);
cylinder(d=id, h=cup_h);
//cylinder(d=hd, h=base_h+cup_h);
}
