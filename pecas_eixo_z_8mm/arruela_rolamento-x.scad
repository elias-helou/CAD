difference(){
    cylinder( r = 3.2, h = 2, $fn = 50  );
    translate( [ 0, 0, -1 ] )
        cylinder( r = 2.3, h = 4, $fn = 50  );
    translate( [ 0, 0, -1 ] )
        cube( [ 5, 5 ,4 ]  );
}