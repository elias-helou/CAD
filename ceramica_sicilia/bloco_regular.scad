w = 167;
l = 100;
h = 8.7;

tol_w = 0.6;
tol_l = 0.6;
tol_h = 0.24;

lip = 15;

wall = 2;

bottom = 3.5;

v_conn_w = w / 10 + tol_w;
v_conn_h = 1.5;

brace_h = 2.5;

module horizontal_connector() {
    
    difference(){
        cube( [ w + tol_w + 2 * wall, lip + tol_l + wall, h + bottom + tol_h ] );
        
        translate( [ wall, wall, bottom ] )
            cube( [ w + tol_w, lip + tol_l + 1, h + tol_h + 1 ] );
        
        translate( [ ( w + tol_w + 2 * wall - v_conn_w ) / 2, wall, bottom - v_conn_h - tol_h ] )
            cube( [ v_conn_w + tol_w, 100, 100] );
    
        translate( [ w / 5 + wall - v_conn_w / 2, wall, bottom - v_conn_h - tol_h ] )
            cube( [ v_conn_w + tol_w, 100, 100] );

            translate( [ w + tol_w + 2 * wall - wall - w / 5 - v_conn_w / 2, wall, bottom - v_conn_h - tol_h ] )
            cube( [ v_conn_w + tol_w, 100, 100] );
    }

}

module vertical_connector() {
    
    cube( [ v_conn_w - tol_w, 95, v_conn_h - tol_h ] );
    
}

module brace() {
    
    difference(){
    
        cube( [ w + tol_w + 2 * wall + 2 * 1.2 + tol_w, brace_h, h + bottom + tol_h + 2 * 1.2 + tol_w ] );
        
        translate( [ 1.2, -0.5, 1.2 ] )
            cube( [ w + tol_w + 2 * wall + tol_w, brace_h + 1, h + bottom + tol_h + tol_w ] );        
    }
    
}

//horizontal_connector();

//translate( [ ( w + tol_w + 2 * wall - v_conn_w + 2 * tol_w ) / 2, wall + 2.5, bottom - v_conn_h - tol_h ] )
//    vertical_connector();

translate( [ -1.2 - tol_w / 2, 0, -1.2 - tol_w / 2 ] )
    brace();