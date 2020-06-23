
top_u = 0;
bottom_u = 12;

middle_width = 700;
u_width = 490;
u = 45;

depth = 520;

top_cabinet_h = top_u * u;
bottom_cabinet_h = bottom_u * u;
single_wall = 18;

shelf_h = bottom_cabinet_h-single_wall-200;
shelf_h2 = 80;

leg_h = 50;



top_h = 2 * single_wall;
bottom_h = single_wall;

panel_d = 18;
panel_h = 25;
panel_dist = 10;

// height without legs
main_h = bottom_h + bottom_cabinet_h + 0*single_wall + top_cabinet_h + top_h;
main_w = 6*single_wall + middle_width + 2*u_width + 2*single_wall;
total_h = main_h + leg_h;

module rack(num, width=u_width){
    cube([width, depth, num*u]);
}

module leg() {
    cube([2*single_wall, depth, leg_h]);
}
module legs4() {
    translate([0, 0, -leg_h]) {
      translate([0,0,0]) leg();
      translate([2*single_wall+u_width,0,0]) leg();
      translate([4*single_wall+u_width+middle_width,0,0]) leg();
      translate([6*single_wall+2*u_width+middle_width,0,0]) leg();
     }
}
module main() {
    legs4();
    difference() {
    cube([main_w, depth, main_h]);
    translate([0, 0, bottom_h]) {
        translate([2*single_wall, 0, 0]) rack(bottom_u);
        translate([4*single_wall+u_width, 0, 0]) rack(bottom_u, middle_width);
        translate([6*single_wall+u_width+middle_width, 0, 0]) rack(bottom_u);
    }
    translate([0, 0, bottom_h+single_wall+bottom_cabinet_h]) {
        translate([2*single_wall, 0, 0]) rack(top_u);
        translate([4*single_wall+u_width, 0, 0]) rack(top_u, middle_width);
        translate([6*single_wall+u_width+middle_width, 0, 0]) rack(top_u);
    }
    }
}

module shelf(h) {
    translate([4*single_wall+u_width, 0, single_wall+h])
    cube([middle_width, depth, single_wall]);
}

 
 module front_panel_v(h, w) {
    num = w / (panel_h+panel_dist);
    //echo("num", num);
    for (i = [0:1:num]) {
        //echo("i", i);
        translate([i*(panel_dist+panel_h), 0, 0]) 
          translate([0.5*panel_dist, 0, 0]) cube([panel_h, panel_d, h]);
    }
 }

 
 module panel_set3() {
     translate([2*single_wall, -panel_d, bottom_h]) 
       front_panel_v(bottom_cabinet_h + top_cabinet_h + single_wall, u_width);    
     translate([4*single_wall+u_width, -panel_d, bottom_h]) 
       front_panel_v(shelf_h2, middle_width);
     translate([6*single_wall+u_width+middle_width, -panel_d, bottom_h]) 
       front_panel_v(bottom_cabinet_h + top_cabinet_h + single_wall, u_width);
 }
 
 module tv_stand(h, w) {
     stand_depth = 50+0.33*depth;
     stand_h = total_h + h;
     tv_plate_h = 0.25 * h;
     translate([u_width+2*single_wall, 0.66*depth, -leg_h]) {
         cube([2*single_wall, stand_depth, stand_h]);
         translate([middle_width+2*single_wall, 0, 0]) 
           cube([2*single_wall, stand_depth, stand_h]);
           translate([-100, -single_wall, total_h])
             cube([middle_width+4*single_wall+200, single_wall, h]);
     }

 }
 
 module tv() {
     h = 965;
     w = 1683;
     d = 60;
     
     cube([w, d, h]);
     }
     
 module speaker() {
    color([0,0,1]) translate([-250, 0, 0]) cube([500, 200, 185]);
} 

module receiver() {
    color("black") translate([-220, 0, 0]) cube([440, 460, 186]);
}

module appliances() { 
     translate([0.5*(main_w-1683), 0.66*depth - 120, main_h+50]) tv();
     translate([0.5*main_w, 0, 2*single_wall+shelf_h+10]) speaker();
     translate([0.5*main_w, 0, 2*single_wall+shelf_h2+10]) receiver();
}
main();
//panel_set3();
tv_stand(1000, 100);
shelf(shelf_h);
shelf(shelf_h2);
//appliances();
mid = shelf_h - 220 - single_wall;
echo ("mid", mid);
echo("Height: ", total_h);
echo("Width: ", main_w);