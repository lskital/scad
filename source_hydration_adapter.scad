// source hydration connector

hd = [[1.5, 8.4], [1.6, 11], [2, 8.6], [6.5, 11], [1, 11.3], [3, 9], [2,  12], [1.5, 16]];

module cylinder_series(dimensions, index = 0, offset = 0) {
    hx = dimensions[index];
    translate([0, 0, offset]) cylinder(h=hx[0], d=hx[1]);
    new_offset = offset + hx[0];
    new_index = index + 1;
    if (dimensions[new_index] != undef)
        cylinder_series(dimensions, new_index, new_offset);
}

cylinder_series(hd);