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

module plank_mount_base(x, y, d) {
  slider_width = 35;
  wall_bottom = 3;
  wall = 2.5;
  
  t_x = slider_width;
  t_y = x + 2 * wall;
  t_z = y + wall + wall_bottom;
  
  x_offset = 0.5 * (t_x - base_width);
  translate([-x_offset, -t_y+base_depth, -t_z])
  difference() {
    cube([t_x, t_y, t_z]);
    translate([0, wall, wall_bottom]) cube([t_x, x, y]);
    translate([0.5 * t_x, 0.5 * t_y, 0]) cylinder(h=wall_bottom, d=d, $fn=20);
  }
  
    
}

module X_stand() {
    lx = 160;
    ly = 160;
    wx = 23;
    wy = 23;
    h = 5;
    translate([-0.5*(lx-wy), 0, -h]) cube([lx, wx, h]);
    translate([0, -0.5*(ly-wx), -h]) cube([wy, ly, h]);
}

module spigot() {
  d1 = 16;
  d2 = 12;
  d3 = 16;
  d4 = 23;
  h1 = 7;
  h2 = 10;
  h3 = 8;
  h4 = 15;
    
  //cylinder(h=h4, d=d4);
  translate([0,0, 0.5*h4]) cube([d4, d4, h4], center=true);
  translate([0,0, h4]) cylinder(d=d3, h=h3);
  translate([0,0, h4+h3]) cylinder(d=d2, h=h2);
  translate([0,0, h4+h3+h2]) cylinder(d=d1, h=h1);
}
module spigot_stand() {
  X_stand();
  translate([0.5*23, 0.5*23, 0]) spigot();
}

difference() {
spigot_stand();
translate([0.5*23, 0.5*23, -25]) cylinder(h=100, d=4);
}
//plank_x = 46;
//plank_y = 14;
//hole_dia = 4.9;
//translate() plank_mount_base(plank_x, plank_y, hole_dia);
//translate([0, 0, -ziptie_base_height]) ziptie_base_90();


//hot_shoe();
