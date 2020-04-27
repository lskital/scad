a = 80;
b = 46;
e = 100;
d = 71;

width = 15;

screw_offset = 21;
module screw_countersunk(
        l=30,   //length
        dh = 10,   //head dia
        lh = 3.6,   //head length
        ds = 5.2,  //shaft dia
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
    cube([e,d,width]);
    cube([a,b,width]);
    
translate([screw_offset, d+1, 0.5*width]) rotate ([90, 0, 0]) screw_countersunk();
}