//universal rod mount


id = 25;
od = id+3;
height = 30;

screw = "M3x10";

screw_block_width = od*0.25;

zblock_width = 10;
zblock_depth = 10;
ziptie_w = 5;
ziptie_h = 2; 

module zblock() {
    cube([zblock_depth, zblock_width, height], center=true);
}

module main_cylinder() {
  //difference() {
    { 
        cylinder(h=height, d=od, center=true);
        translate([0.5*od, 0, 0]) cube([zblock_depth, zblock_width, height], center=true);
    }
    //cylinder(h=height, d=id, center=true);
 // }
}


//main_cylinder();
zblock();