//Hot shoe ziptie adapeter

hs_width = 19;
hs_depth = 20;
hs_height = 3;
hs_slot_width = 13;
hs_slot_height = 1.5;

slope_width = 8;
slope_angle = 5;

ziptie_slot_width = 4;
ziptie_slot_height = 2;

wall_width = 2;
wall_height = 1.2;

//offset for ziptie_base
ziptie_offset1=2.5;

//offset for ziptie_base_90
ziptie_offset2=0;

ziptie_base_height = wall_width+ziptie_slot_height;
base_width = wall_width*2+hs_width;
base_depth = hs_depth+wall_width;

module hot_shoe() {
    //base cube
    difference() {
        cube([base_width, base_depth, wall_height+hs_slot_height+hs_height]);
        //hot shoe cut cube
        translate([wall_width, 0, wall_height]) cube([hs_width, hs_depth, hs_height]);
        //slot cut cube
        translate([wall_width + 0.5*(hs_width-hs_slot_width), 0, wall_height+hs_height]) cube([hs_slot_width, hs_depth, hs_slot_height]);
        //slope cut cube
        slope_x = 0.5*(base_width-slope_width);
        //slope_z = wall_width*0.8;
        slope_z = 0;
        translate([slope_x,0,slope_z]) rotate([slope_angle, 0, 0]) cube([slope_width, hs_depth, wall_width]);        
    }
}
module ziptie_base() {
    module ziptie_cut() {
      cube([ziptie_slot_width, base_depth, ziptie_slot_height]);
    }
    slot1_x = base_width/3-0.5*ziptie_slot_width-ziptie_offset1;
    slot2_x = (2*base_width/3)-0.5*ziptie_slot_width+ziptie_offset1;
    difference() {
        //base cube
        cube([base_width, base_depth, ziptie_base_height]);
        //ziptie slots
        translate([slot1_x, 0, wall_width]) ziptie_cut();
        translate([slot2_x, 0, wall_width]) ziptie_cut();
    }
    
    
}
module ziptie_base_90() {
    module ziptie_cut() {
      cube([base_width, ziptie_slot_width, ziptie_slot_height]);
    }
    slot1_y = base_width/3-0.5*ziptie_slot_width-ziptie_offset2;
    slot2_y = (2*base_width/3)-0.5*ziptie_slot_width+ziptie_offset2;
    difference() {
        //base cube
        cube([base_width, base_depth, ziptie_base_height]);
        //ziptie slots
        translate([0, slot1_y, wall_width]) ziptie_cut();
        translate([0, slot2_y, wall_width]) ziptie_cut();
    }
    
    
}

translate([0, 0, -ziptie_base_height]) ziptie_base_90();
hot_shoe();

