translate([-50-14.6,18.25,-17])
import("thermomix_spindle.stl", center=true);

// might need a fix to align properly
difference() {
cylinder(d1=23.6, d2=20.3, h=90);
cylinder(d2=9, d1=14, h=90);
translate([0,0,-3]) cylinder(d=18.0, h=17);
}

d=7;
translate([-15.5+0.5*d,18-0.5*d,-17])
cylinder(d2=d, d1=0.7*d, h=17.7);

translate([15.5-0.5*d,-18+0.5*d,-17])
cylinder(d2=d, d1=0.7*d, h=17.7);
