x = 125.2;
y = 13;
hole_d = 11.2;
hole_dist = 95;
h = 4;

contour = 1;
contour_h = h+2;


difference() {
cube([x, y, h]);

translate([0.5*(x-hole_dist), 0.5*y, 0]) cylinder(d=hole_d, h=h, $fn=6);
translate([0.5*(x+hole_dist), 0.5*y, 0]) cylinder(d=hole_d, h=h, $fn=6);
    
}


/*
translate([-contour, -contour, 0]) cube([x+2*contour, contour, contour_h]);
translate([-contour, 0, 0]) cube([contour, y, contour_h]);
translate([x, 0, 0]) cube([contour, y, contour_h]);
*/