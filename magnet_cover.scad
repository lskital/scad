bottom_wall = 0.15;
wall = 1;
top_wall = 0.5;

top_h = 7;
bottom_top_diff = 0;
bottom_h = top_h - bottom_top_diff;

bottom_cup_id = 32;
bottom_cup_od = bottom_cup_id + wall;

bottom_top_fit = 0.1;

top_cup_id = bottom_cup_od + bottom_top_fit;
top_cup_od = top_cup_id + wall;

hole_d = 5;


module top_solid() {
  cylinder(h=top_h, d=top_cup_od);

}

module top_cavity() {
  cylinder(h=top_h-top_wall, d=top_cup_id);
}

module bottom_solid() {
  cylinder(h=bottom_h, d=bottom_cup_od);

}

module bottom_cavity() {
  cylinder(h=bottom_h-bottom_wall, d=bottom_cup_id);
}

module top() {
difference() {
  top_solid();
  top_cavity();
  cylinder(h=2*top_h, d=hole_d);
}
}

module bottom() {
difference() {
  bottom_solid();
  bottom_cavity();
}
}

translate([top_cup_od, 0, bottom_top_diff]) bottom();
top();