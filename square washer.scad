


x = 50;
y = 24;
z = 10;

d = 7;

module screw_countersunk(
        l=20,   //length
        dh = 8.5,   //head dia
        lh = 3.0,   //head length
        ds = 4.2,  //shaft dia
        rec = 2,
        $fn=20,
        )
{
        translate([0, 0, rec]) {
          cylinder(h=lh, r1=dh/2, r2=ds/2);
          cylinder(h=l, d=ds);
        }
        cylinder(h=rec, d=dh);
}


difference() {
cube([x, y, z]);
translate([0.25*x, 0.5*y, 0]) screw_countersunk();
translate([0.75*x, 0.5*y, 0]) screw_countersunk();
}
