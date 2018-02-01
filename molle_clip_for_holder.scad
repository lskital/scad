//Molle hanger


width = 15;
thickness = 1;
length1 = 30;

limiter_width = 8;
limiter_thickness = 1;

total_length = 2 * length1 + limiter_thickness;

module limiter(limiter_width=limiter_width) {
    translate([0, -0.5*width, 0]) cube([limiter_thickness, width, limiter_width]);
    translate([0.5 * limiter_thickness, 0, 0]) cylinder(h=0.75*limiter_width, d1=0.5*width, d2=limiter_thickness);
}

cylinder(d=width, h=thickness);
translate([total_length-width, 0, 0]) cylinder(d=width, h=thickness);
translate([0, -0.5*width, 0]) cube([total_length-width, width, thickness]);

translate([0.5 * (total_length - width), 0, 0]) limiter();
limiter(5);
//translate([0.5 * (total_length - width), -0.5 * width, 0]) cube([limiter_thickness, width, limiter_width]);
//translate([0.5 * (total_length - width + limiter_thickness), 0, 0]) cylinder(h=0.75*limiter_width, d1=0.5*width, d2=limiter_thickness);