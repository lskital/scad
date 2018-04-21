total_x = 150;
total_y = 100;
total_z = 4;

slot_x = 5;
slot_y = 3;
slot_z = 4 * total_z;

offset_x = 10;
offset_y = 10;
div = 0.8;

rotation = 15;

x_shift = 2;
y_shift = -2;

difference () {
  cube([total_x, total_y, total_z]);
  for (o_x = [offset_x:slot_x + div:total_x - slot_x - offset_x]) {
      for (o_y = [offset_y:slot_y + div:total_y])
        translate([o_x + x_shift, o_y + y_shift, -0.5 * slot_z]) rotate([rotation, 0, 0]) cube([slot_x, slot_y, slot_z]);
  }
  
}
