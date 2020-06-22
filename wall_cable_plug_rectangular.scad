// rectangular hole plug

hole_x = 30;
hole_y = 40;

extension = 6;

cover_h = 1;
plug_h = 2;

edge_h = 10;

edge_wall = 2;

cable_hole_x=8;
cable_hole_y=5;
cable_hole_offset=2;


module cable_hole() {
  hull() {
  translate([cable_hole_y/2,0,0])
    cylinder(d=cable_hole_y, h=plug_h, center=false);
  translate([-cable_hole_y/2,0,0])
    cylinder(d=cable_hole_y, h=plug_h, center=false);
  }
}

module base() {
cube([hole_x+2*extension, hole_y+2*extension, cover_h]);
translate([extension, extension, cover_h]) cube([hole_x, hole_y, edge_h]);
}

difference() {
base();
translate([extension+edge_wall, extension+edge_wall, plug_h])
  cube([hole_x-2*edge_wall, hole_y-2*edge_wall, edge_h+cover_h-plug_h]);
translate([0.5*(hole_x+2*extension), extension+edge_wall+0.5*cable_hole_y+cable_hole_offset, 0]) 
 cbale_hole();
}