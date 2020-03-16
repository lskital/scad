h = 3.5;
od = 7;
id = 4;
$fn=10;


difference(){
    cylinder(h=h, d=od, $fn=6);
    cylinder(h=h, d=id, $fn=20);
}