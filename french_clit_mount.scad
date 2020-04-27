mount_edge = 10;
mount_length = 50;

part_b_overhead_x = 30;
part_b_overhead_y = 15;

sface_h = 30;

n_screws = 2;
screw_offset = 12;

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

module part_a_no_holes() {
    linear_extrude(mount_length)
  polygon([[0,0],[mount_edge,mount_edge],[mount_edge,0]]);
  
    translate([mount_edge, 0, 0]) cube([sface_h, mount_edge, mount_length]);

}
module part_a() {
difference() {
    part_a_no_holes();
z_off = mount_length - 2 * screw_offset;
for(a = [0:n_screws-1])   
  translate([0.5*(sface_h+mount_edge), 0, screw_offset + a * z_off / (n_screws - 1)]) rotate([-90, 0, 0]) screw_countersunk();
}
}

module part_b() {
difference() {
  translate([-part_b_overhead_x, 0, 0])
    cube([sface_h+mount_edge+part_b_overhead_x, mount_edge+part_b_overhead_y, mount_length]);
  translate([0, part_b_overhead_y, 0]) part_a_no_holes();

    z_off = mount_length - 2 * screw_offset;
for(a = [0:n_screws-1])   
  translate([0.5*(sface_h+mount_edge), part_b_overhead_y+1, screw_offset + a * z_off / (n_screws - 1)]) rotate([90, 0, 0]) screw_countersunk();
}
}

part_b();