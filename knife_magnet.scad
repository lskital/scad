magnet_d = 10;
magnet_h = 3.2;

height = 12;
width = magnet_d + 2;
length = magnet_d * 4;

$fn = 40;

module base() {
    cylinder(h=height, d=width);
    translate([length - width, 0, 0])
      cylinder(h=height, d=width);
    translate([0, -0.5*width, 0])
      cube([length-width, width, height]);
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

module magnet() {
  cylinder(h=magnet_h, d=magnet_d);
}
difference() {
  base();
  translate([0.5*(length-width), 0, 0]) magnet();
  screw_countersunk();
  translate([length - width, 0, 0]) screw_countersunk();
}