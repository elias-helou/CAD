// Dimensões
a_tela = 100;
l_tela = 150;

a_vidro = a_tela + 8;
l_vidro = l_tela + 8;
p_vidro = 2;

a_moldura = a_tela + 25;
l_moldura = l_tela + 25;

a_vao = a_tela - 1;
l_vao = l_tela - 1;

p_paspatur = 1;

p_tela = 18 + p_vidro + p_paspatur;

module moldura() {
    
    difference() {
        cube(
                [
                    l_moldura,
                    a_moldura,
                    p_tela + p_vidro + p_paspatur
                ], center = true
            );
        cube(
                [
                    l_vao,
                    a_vao,
                    p_tela + p_vidro + p_paspatur + 2
                ], center = true
            );
        translate( [ 0, 0, 2 ] )
            cube(
                    [
                        l_vidro,
                        a_vidro,
                        p_tela + p_vidro + p_paspatur + 2
                    ], center = true
                );
        // Furos
        translate( [ l_vidro / 2 + d_furo, -a_tela / 3, - ( p_tela + p_vidro + p_paspatur ) / 2 + p_vidro + 1 ] )
            cylinder( d = d_furo, $fn = 50, h = p_tela + p_vidro + p_paspatur );
        translate( [ l_vidro / 2 + d_furo, a_tela / 3, - ( p_tela + p_vidro + p_paspatur ) / 2 + p_vidro + 1 ] )
            cylinder( d = d_furo, $fn = 50, h = p_tela + p_vidro + p_paspatur );
        translate( [ -( l_vidro / 2 + d_furo ), -a_tela / 3, - ( p_tela + p_vidro + p_paspatur ) / 2 + p_vidro + 1 ] )
            cylinder( d = d_furo, $fn = 50, h = p_tela + p_vidro + p_paspatur );
        translate( [ -( l_vidro / 2 + d_furo ), a_tela / 3, - ( p_tela + p_vidro + p_paspatur ) / 2 + p_vidro + 1 ] )
            cylinder( d = d_furo, $fn = 50, h = p_tela + p_vidro + p_paspatur );
    }
}

a_conector = 10;
l_conector = 10;

a_pe = 10;
l_pe = l_moldura;
p_pe = 70;

d_furo = 3.5;

module pe(){
    // Conector
    translate( [ 0, a_moldura / 2 + a_conector / 2 - 0.5, 0 ] )
        cube( 
            [
                l_conector,
                a_conector + 1,
                p_tela + p_vidro + p_paspatur
            ], center = true
        );
    
    // Pe
    difference() {
        translate( [ 0, a_moldura / 2 + a_conector + a_pe / 2 - 1e-3 - 6, p_pe / 2 - ( p_tela + p_vidro + p_paspatur ) / 2 - 10 ] )
            rotate( 10, [ 1, 0, 0 ] )
                cube(
                    [
                        l_pe,
                        a_pe,
                        p_pe
                    ], center = true
                );
        translate( [ 0, 0, - ( p_tela + p_vidro + p_paspatur ) / 2 - 250 ] )
            cube( [ 500, 500, 500 ], center = true );
        
    }
}

module paspatur() {
    difference(){
        cube( [ l_vidro - 0.5, a_vidro - 0.5, 15 ], center = true );
        translate( [ 0, 0, 1 ] )
        cube(
                [
                    l_tela + 3.0,
                    a_tela + 3.0,
                    15
                ], center = true
            );
        translate( [ 0, 0, -2 ] )
            cube(
                    [
                        l_vao,
                        a_vao,
                        p_tela + p_vidro + p_paspatur + 2
                    ], center = true
                );
    }
}

moldura();
pe();
//paspatur();





















