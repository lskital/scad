
wall_thickness=3;

height=15;

l1=44;
l2=11;

l3=20;



module corner(l, h, t, side) {
    cube([l, h, t]);
    cube([l, t, h]);
    if (side==1 || side==3) cube([t, h, h]);
    if (side==2 || side==3) translate([l-t, 0, 0]) cube([t, h, h]);
}
  
length = l1-l2;
translate([height-wall_thickness, 0, 0]) corner(length+wall_thickness, height, wall_thickness, 2);
translate([height, -length, 0])
  rotate([0, 0, 90]) corner(length, height, wall_thickness, 1);

cube([height, height, wall_thickness]);

