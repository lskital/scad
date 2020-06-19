od = 37;
id = 33;
hd = 6;

base_h = 5;
cup_h = 20;

difference() {
cylinder(d=od, h=base_h+cup_h);
cylinder(d=id, h=cup_h);
cylinder(d=hd, h=base_h+cup_h);
}
