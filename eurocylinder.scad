$fn=32;
plate_x = 18 + 2*15;
plate_y = 34 + 10;
plate_z = 2;
cylinder_h = 8;
 
  
module eurocylinder(h=1, scale=1) {
  x1 = 18*scale;
  r = 3*scale;
  x2 = 11*scale;
  y2 = (34 - 0.5*18 - r)*scale;
  
  
  cylinder(d=x1, h=h, center=true);
  translate([0, 0.5*y2, 0]) {
      hull() {
      cube([x2, y2, h], center=true);
      translate([0.5*x2-r,0.5*y2, 0]) cylinder(r=r, h=h, center=true);
      translate([-(0.5*x2-r),0.5*y2, 0]) cylinder(r=r, h=h, center=true);
      }
  }
}

module screw_countersunk(
        l=20,   //length
        dh = 8.5,   //head dia
        lh = 3.2,   //head length
        ds = 4,  //shaft dia
        rec = 2,
        $fn=20,
        )
{
    union() {
        translate([0, 0, rec]) {
        cylinder(h=lh, r1=dh/2, r2=ds/2);
        cylinder(h=l, d=ds);
        }
        cylinder(h=rec, d=dh);
    }
}

module plate() {
  cube([plate_x, plate_y, plate_z], center=true);
  translate([0,0,0.5*(cylinder_h-plate_z)]) eurocylinder(scale=1.3, h=cylinder_h);
}


difference() {
  plate();
  eurocylinder();
}