// Pocket organizer


slots = [[0, [24, 10]], [1, [22, 11, 40]], [0, [19, 13.5, 45]], [1, [17.5, 10.5, 20]]];
back_slots = [[1, [60, 4, 70]]];
h = 15;
wall = 1;
extra_space = 2;
base = 1;
bottom_wall = 1;

module slot_generator(slots=slots, offset=0, i=0, direction=1) {
      echo(offset, i);     
      s = slots[i][1];
      slot_type = slots[i][0];
      if (slot_type == 0)
        round_slot(slots, offset, i);
      else
        rectangular_slot(slots, offset, i);
      if (i < len(slots)-1) {
          o2 = offset + s.x + 2*wall + extra_space;
          slot_generator(slots, o2, i+1);
      }
  }
 
  
  module rectangular_slot(slots, offset, i) {
      s = slots[i][1];
      inner = [s.x, s.y, s.z];
      outer = [s.x+2*wall, s.y+2*wall, s.z];
      translate([offset, 0, 0]) {
        translate([0, 0, 0]) cube([outer.x+extra_space, base, h]);  
        difference(){
          cube(outer);
          translate([wall, wall, bottom_wall]) cube(inner);
        }
      }
      
  }
  module round_slot(slots, offset, i) {
      s = slots[i][1];
      inner = [s.x, s.y];
      outer = [s.x+2*wall, s.y];
      translate([offset, 0, 0]) {
        translate([0, 0, 0]) cube([outer.x+extra_space, base, h]);  
      translate([0.5*s.x, 0.5*outer.x, 0]) difference(){
          cylinder(d=outer.x, h=outer.y);
          translate([0, 0, bottom_wall]) cylinder(d=inner[0], h=inner[1]);
        }
      }
  }
  
 slot_generator();
 //translate([0, wall, 0]) 
 translate([0, 0, 0])
   mirror([0,1,0]) slot_generator(slots=back_slots);