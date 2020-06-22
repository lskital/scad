od = 40;
id = 35;
hd = 6;

base_h = 8;
cup_h = 17;

difference() {
cylinder(d=od, h=base_h+cup_h);
cylinder(d=id, h=cup_h);
cylinder(d=hd, h=base_h+cup_h);
}
