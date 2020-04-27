$fn=20;

lug_width = 17;
lug_od = 2.5;
lug_id = 2;
lug_tool_slot = 2;

strap_width=24.2;
strap_h = 1.8;
strap_wall_h=0.5;

tot_width1 = strap_width + 1;
tot_width2 = strap_width + 1;

h1 = 5;
h2 = 2;



l=4;
offset = 0.5*(tot_width1-lug_width);

off_x = 2;
off_z = 0.5*(tot_width1-tot_width2);

module lug_part() {
difference() {
    hull(){
    cylinder(d=lug_od, h=lug_width);
    translate([-0.5, lug_id, 0]) cylinder(d=2, h=lug_width);
    }
    cylinder(d=lug_id, h=lug_width);
    translate([-lug_id+0.5, -1, 0]) cube([1,2,lug_tool_slot]);
    translate([-lug_id+0.5, -1, lug_width-lug_tool_slot]) cube([1,2,lug_tool_slot]);
}
}

module strap_part() {
difference() {
  hull() {
    cylinder(d=2, h=tot_width1);
    translate([off_x, 0, off_z]) cylinder(d=2, h=tot_width2);
    translate([0, l, off_z]) cylinder(d=2, h=tot_width2);
  }
  translate([-(1-strap_wall_h), -0.5*l, 0.5*(tot_width1-strap_width)]) cube([strap_h, l*2, strap_width]);
}
}

translate([off_x+0.5, -lug_od, offset]) 
  lug_part();
strap_part();