total_x = 170;
total_y = 150;
total_z = 4;

slot_x = 5;
slot_y = 3;
slot_z = 4 * total_z;

offset_x = 15;
offset_y = 15;
div_x = 0.8;

div_y = 1.5;

rotation = 30;

x_shift = 1;
y_shift = -4;

module screw_countersunk(
        l=20,   //length
        dh = 8,   //head dia
        lh = 3,   //head length
        ds = 4,  //shaft dia
        $fn=20,
        )
{
    union() {
        cylinder(h=lh, r1=dh/2, r2=ds/2);
        cylinder(h=l, d=ds);
    }
}


difference () {
  cube([total_x, total_y, total_z]);
  for (o_x = [offset_x:slot_x + div_x:total_x - slot_x - offset_x]) {
      for (o_y = [offset_y:slot_y + div_y:total_y])
        translate([o_x + x_shift, o_y + y_shift, -0.5 * slot_z]) rotate([rotation, 0, 0]) cube([slot_x, slot_y, slot_z]);
  }
  
  translate([0.5*offset_x, 0.5*offset_y, 0]) screw_countersunk();
  translate([total_x-0.5*offset_x, 0.5*offset_y, 0]) screw_countersunk();
  translate([total_x-0.5*offset_x, total_y-0.5*offset_y, 0]) screw_countersunk();
  translate([0.5*offset_x, total_y-0.5*offset_y, 0]) screw_countersunk();
}
