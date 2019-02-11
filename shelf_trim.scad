//shelf trim


l = 262;
h = 20;
d = 1;
overlap_h = 0.45;
overlap_d = 2;


cube([l, h + overlap_h, d]);
cube([l, overlap_h, overlap_d + d]);