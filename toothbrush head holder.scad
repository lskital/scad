// Cup holder
//$fn = 50;
cup_d1 = 14;
cup_d2 = 14;
cup_h = 30;
cup_w = 2;

mount_x = 2;
mount_y = cup_d1*2+10;
mount_z = cup_h;
mount_x_offset = mount_x;

module screw_countersunk(
        l=20,   //length
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

module outer_cup_mount() {
  outer_d = cup_d1 + cup_w;
  cylinder(d=outer_d, h=cup_h);
  
    
}

module inner_cup_mount() {
    cylinder(d1=cup_d1, d2=cup_d2, h=cup_h);
}
    
module wall_mount() {
    difference() {
    cube([mount_x, mount_y, mount_z], center=true);
    translate([-0.5*mount_x-0.01, 0.5*(mount_y-8), 0]) 
      rotate([0, 90, 0]) 
        screw_countersunk();
    translate([-0.5*mount_x-0.01, -0.5*(mount_y-8), 0]) 
      rotate([0, 90, 0]) 
        screw_countersunk();
    }
    //translate([-0.5*mount_x_offset, 0, -0.5*(mount_z-cup_h)]) cube([mount_x_offset, mount_y, cup_h], center=true);
}


module holder() {
rotate([0, 0, -45]) {
    difference() {
    outer_cup_mount();
    inner_cup_mount();
    translate([-0.5*(cup_d1+cup_w), 0, 0]) rotate([0, 90, 0]) cylinder(h=2*cup_w, d=1*cup_d1);
}
    //cylinder(h=cup_w+5, d=5);
    
    y = cup_d2+0.5*cup_w;
    x = cup_w;
    translate([-0.5*x, -0.5*y, 0]) cube([x, y, cup_w]);
  }
    translate([0.5*(cup_d1+mount_x), 0, 0.5*cup_h]) wall_mount();
}

holder();
translate([0, mount_y-8, 0]) holder();
