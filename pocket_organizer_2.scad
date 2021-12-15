// Pocket organizer

slots = [[24, 10], [22, 11], [19, 13.5], [17.5, 10.5]];
h = 30;
wall = 1;
extra_space = 2;
base = 1;
bottom_wall = 1;

module slot_generator(offset=0, i=0) {
      echo(offset, i);
      s = slots[i];
      inner = [s.x, s.y, h];
      outer = [s.x+2*wall, s.y+wall, h];
      translate([offset, 0, 0]) {
        translate([0, -base, 0]) cube([outer.x+extra_space, base, h]);  
        difference(){
          cube(outer);
          translate([wall, 0, bottom_wall]) cube(inner);
        }
      }
      if (i < len(slots)-1) {
          o2 = offset + s.x + 2*wall + extra_space;
          slot_generator(o2, i+1);
      }
  }
 
  slot_generator();