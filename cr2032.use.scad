
// 
// dimension reference: https://www.theengineeringprojects.com/wp-content/uploads/2018/09/introduction-to-cr2032.png
// cr2032 model
// 

function cr2032_dimensions() = [
    [ "d1", 19.70], // .. 20
    [ "d2", 17.70],
    [ "h1", 2.90], // .. 3.2
    [ "h2", 0.1],
];

function cr2032_dim(term) = 
    let (
        dim = cr2032_dimensions(),
        find = search([term], dim),
        value = dim[find[0]][1]
    ) value;

module cr2032_model(d1_corr=0, d2_corr=0, h1_corr=0, h2_corr=0) {
    d1 = cr2032_dim("d1");
    d2 = cr2032_dim("d2");
    h1 = cr2032_dim("h1");
    h2 = cr2032_dim("h2");
    
    translate([0, 0, 0])
    cylinder(h1+h1_corr, d=d1+d1_corr);

    translate([0, 0, h1+h1_corr])
    cylinder(h2+h2_corr, d=d2+d2_corr);
}

// usage:

$fn = 360;

cr2032_model(h1_corr=2, h2_corr=2);

