$fn=100;
diameter = 8;
length = 150;
tip_length= 15;
flat_offset=20;
flat_depth=2;
wire_depth=tip_length;
wire_d=1.2;
text_on_flat="Brian Foley  Ganeti SRE  2015-2016";
text_size=4;

translate([0, 0, 0.5*length]) {
rotate([0, 90, 0]) {
linear_extrude(height=0.5*diameter, convexity=4)
    text(text_on_flat, 
         size=text_size,
         font="Arial Black",
         //font="Bitstream Vera Sans",
         halign="center",
         valign="center");
}
}

difference() {
    union() {
        translate([0, 0, -tip_length]) {
            cylinder(d2=diameter, d1=2, h=tip_length, center=false);
        }
        cylinder(d=diameter, h=length, center=false);
    }
    translate([0.5*diameter-flat_depth, -diameter/2, flat_offset]) {
        cube([diameter, diameter,length-2*flat_offset], center=false);
    }
    translate([0, 0, -tip_length]) {
        cylinder(d=wire_d, h=wire_depth, center=false);
    }
}