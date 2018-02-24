// Cup holder
$fn = 50;
cup_d1 = 90;
cup_d2 = 89;
cup_h = 10;
cup_w = 5;

mount_x = 10;
mount_y = 30;
mount_z = 40;
mount_x_offset = 6;

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
    translate([-0.5*mount_x-0.01, 0, -0.5*mount_z + cup_h + 5]) rotate([0, 90, 0]) screw_countersunk();
    translate([-0.5*mount_x-0.01, 0.25*mount_y, 0.5*mount_z - 5]) rotate([0, 90, 0]) screw_countersunk();
    translate([-0.5*mount_x-0.01, -0.25*mount_y, 0.5*mount_z - 5]) rotate([0, 90, 0]) screw_countersunk();
    }
    translate([-0.5*mount_x_offset, 0, -0.5*(mount_z-cup_h)]) cube([mount_x_offset, mount_y, cup_h], center=true);
}

module solid_mount() {
outer_cup_mount();
translate([0.5*cup_d1 + mount_x_offset, 0, 0.5*mount_z]) wall_mount();
}

difference() {
    solid_mount();
    inner_cup_mount();
}