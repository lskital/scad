x = 6.6;

x1 = 13;

y1 = 10;
y = 28;


z = 50;

n_screws = 2;
screw_offset = 12;

module screw_countersunk(
        l=20,   //length
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


cube([x, y, z]);
translate([0, -y1, 0]) difference() {
cube([x1, y1, z]);

z_off = z - 2 * screw_offset;
for(a = [0:n_screws-1])   
  translate([x1+1, 0.5*y1, screw_offset + a * z_off / (n_screws - 1)]) rotate([0, -90, 0]) screw_countersunk();
    
}