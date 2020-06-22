<<<<<<< HEAD
od = 40;
id = 35;
=======
od = 37;
id = 33;
>>>>>>> 08997f2dfa9be5d4f3188134c84efa29b521ce5c
hd = 6;

base_h = 8;
cup_h = 17;

difference() {
cylinder(d=od, h=base_h+cup_h);
cylinder(d=id, h=cup_h);
cylinder(d=hd, h=base_h+cup_h);
}
