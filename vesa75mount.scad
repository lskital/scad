// vesa wall mount 75mm


vesa_size = 75;
plate_size = 120;

plate_width = 7;

hole_d1 = 4.5;
hole_d2 = 10;
hole_h2 = 4;
hole_h1 = plate_width;

slot_h = 5;
slot_side_wall = 5;
slot_top_wall = 10;
slot_overlap = 10;
slot_overlap_h = 5;

module hole(h1=hole_h1, d1=hole_d1, h2=hole_h2, d2=hole_d2, rot=0) {
    rotate([rot, 0, 0]) {
     cylinder(d=d1, h=h1, center=true);
     translate([0, 0, 0.5*(h1-h2)]) cylinder(d=d2, h=h2, center=true);
    }
    
}
module vesa_holes(h=hole_h1, r=0) {
    off = 0.5*vesa_size;
    translate([off, off, 0]) hole(h1=h, rot=r);
    translate([-off, -off, 0]) hole(h1=h, rot=r);
    translate([-off, off, 0]) hole(h1=h, rot=r);
    translate([off, -off, 0]) hole(h1=h, rot=r);
}


module plate() {
    x = plate_size;
    z = plate_width;
    z1 = slot_h + slot_overlap_h;
    difference() {
      cube([x, x, z], center=true);
      vesa_holes();
    }
    translate([0, 0, 0.5*(z+z1)]) cube([x, x, z1], center=true);
}

module wall_plate(tol=0, add=0) {
    x = plate_size - 2*slot_side_wall + tol;
    y = plate_size - slot_top_wall + tol;
    z = slot_h + tol;
    x1 = x - 2*slot_overlap + tol;
    y1 = y - slot_overlap + tol;
    z1 = slot_overlap_h + tol + add;
    translate([0, 0.5*slot_top_wall, 0]) cube([x, y, z], center=true);
    translate([0, 0.5*(slot_top_wall+slot_overlap), 0.5*(z + z1)]) cube([x1, y1, z1], center=true);
}

module vesa_plate() {
    difference() {
      plate();
      translate([0, 0, 0.5*(plate_width+slot_h)]) wall_plate();
    }
}

module wall_plate_with_holes() {
    add=5;
    tol=-2;
    h = slot_h + slot_overlap_h + add + 2*tol;
    tr_h = slot_h + tol;
    difference() {
      wall_plate(tol=tol, add=add);
      translate([0, 10, 0.5*(h-tr_h)]) vesa_holes(h=h, r=180);
    }
}
//hole();
//plate();
//translate([0, 0, 0.5*(plate_width+slot_h)]) wall_plate();
vesa_plate();
//translate([0, 0, 0.5*(plate_width+slot_h)]) 
//  wall_plate_with_holes();
