lip_w = 3;
lip_h = 3;

ins_h = 6;
ins_w = 3;

d = 34;

h_h = 2.0;
h_w = 4.0;
h_d = 10;

c_d = 10;

fn = 100;

difference(){
    
    union(){
        
        cylinder( h = lip_h, d = d + 2 * lip_w, $fn = fn );
        cylinder( h = lip_h + ins_h, d = d, $fn = fn );
        
    }
    
    translate( [ 0, 0, lip_h ] )
        cylinder( h = ins_h + 1, d = d - 2 * ins_w, $fn = fn );
    
    translate( [ 0, ( d - c_d ) / 2, -1 ] )
        #cylinder( h = ins_h + lip_h + 2, d = c_d, $fn = fn );    
    translate( [ -c_d / 2, ( d - c_d ) / 2, -1 ] )
        cube( [ c_d, c_d + lip_w, ins_h + lip_h + 2 ]);    


    translate( [ -h_d / 2 + h_h / 2, -h_w / 2, -1 ] )
        cube( [ h_h, h_w, lip_h + 2 ]);
    translate( [ h_d / 2 - h_h / 2, -h_w / 2, -1 ] )
        cube( [ h_h, h_w, lip_h + 2 ]);
}