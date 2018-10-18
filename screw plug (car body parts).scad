include <shapes.scad>;

head_dia = 20;
head_h = 4.75;

neck_dia = 9.75;
neck_straight_h = 4.70;
neck_taper_h = 5;
neck_taper_dia = 11.75;

neck_flex_cut_dia = neck_dia-4;
screw_hole_dia = 3.9;

top_taper_h = 2;
top_taper_dia = 8.75;

screw_taper_h = 6;

cut_width = 2;

$fn=10;


module screw_countersunk(
        l=3.2,   //length
        dh = 8,   //head dia
        lh = 3,   //head length
        ds = 4,  //shaft dia
        $fn=20,
        )
{
    union() {
        cylinder(h=lh, r1=dh/2, r2=ds/2);
        cylinder(h=l, d=ds);
    }
}

module plug() {
hexagon(size=head_dia, height=head_h);

offset1 = 0.5*head_h;
translate([0, 0, offset1]) 
  cylinder(d=neck_dia, h=neck_straight_h);

offset2 = offset1 + neck_straight_h;
translate([0, 0, offset2]) 
  cylinder(h=neck_taper_h, d1=neck_dia, d2=neck_taper_dia);
  
offset3 = offset2 + neck_taper_h;
translate([0, 0, offset3])
  cylinder(h=top_taper_h, d1=neck_taper_dia, d2=top_taper_dia);
}  

total_neck_length = neck_straight_h + neck_taper_h + top_taper_h;

difference() {
plug();
translate([0, 0, 0.5*(total_neck_length+head_h)+0.1]) {
cube([cut_width, head_dia, total_neck_length], center=true);
cube([head_dia, cut_width, total_neck_length], center=true);
}
translate([0, 0, -0.5*head_h]) cylinder(d=screw_hole_dia, h=head_h+neck_straight_h);
translate([0, 0, 0.5*head_h]) 
  cylinder(d1=neck_flex_cut_dia, d2=2*cut_width, h=neck_straight_h);
translate([0, 0, -0.5*head_h]) screw_countersunk();

}

//support
//translate([0, 0, 0.5*head_h+neck_straight_h]) cylinder(h=0.3, d=neck_dia);
