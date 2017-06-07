// Molle clip


wall_width=1.6;
gap=1.6;

total_length=5*25.4+2*wall_width;

clip_width=25;

clip_hook1 = 25;
clip_hook2 = 7;

rib_chamfer = 15;

module rounded_rib(length, height, base_dia) {
    translate([0, 0.5*base_dia-height, 0]) rotate([0, 90, 0]) difference()
    {
    union () {
    translate([0, 0, rib_chamfer]) cylinder(h=length-2*rib_chamfer, d=base_dia);
    translate([0, 0, 0]) cylinder(h=rib_chamfer, d2=base_dia, d1=base_dia-2*height);
    translate([0, 0, length-rib_chamfer]) cylinder(h=rib_chamfer, d1=base_dia, d2=base_dia-2*height);
    }
    translate([-0.5*base_dia, -0.5*base_dia+height , 0]) cube([base_dia, base_dia, length]);
    }
}

module base_clip() {
    difference() {
    //base
    cube([total_length, 2*wall_width+gap, clip_width]);
    
    //gap
    translate([wall_width, wall_width, 0]) cube([total_length-2*wall_width, gap, clip_width]);
    
    //opening
    translate([wall_width+clip_hook1, wall_width+gap, 0]) cube([total_length-clip_hook1-clip_hook2, wall_width, clip_width]);    
    }
}

base_clip();
translate([0, 0, 0.5*clip_width]) rounded_rib(length=total_length-clip_hook2, height=3, base_dia=20);