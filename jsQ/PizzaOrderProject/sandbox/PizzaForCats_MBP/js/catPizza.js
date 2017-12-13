//  JS pizza code //



// Nav 
function navFunction() {
    var x = document.getElementById("navID");
    if (x.className === "navD") {
        x.className += " responsive";
    } else {
        x.className = "navD";
    }
}
