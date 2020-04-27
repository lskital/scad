//Victorinox hex bit adapter
external_x = 12;
external_y = 7;
external_h = 22;

slot_x = 8.6;
slot_y = 2.2;
slot_h = 21;

difference() {
hull() {
cylinder($fn=6, d=11, h=9);
translate([-0.5*external_x, -0.5*external_y, -external_h]) cube([external_x, external_y, external_h]);
}

cylinder($fn=6, d=8, h=9);
translate([-0.5*slot_x, -0.5*slot_y, -slot_h-(external_h-slot_h)]) cube([slot_x, slot_y, slot_h]);
}