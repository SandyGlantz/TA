



// nav  - shows hamburger at small size and hides items except Home (see CSS)
function hamburger() {
    var x = document.getElementById("NavBar");
     if (x.className === "topnav") {
    x.className += " responsive";
    } 
    else {
    x.className = "topnav";
    }
    }
    





//  =====  cancel button  =====
// this isn't working.  Will come back to it for version 2
function cancelOrder() {	
document.getElementById("formMenu").reset();
};



//  sound
function Meow() {
	var audio = document.getElementById("meow");
	audio.play();
			  }




/*
================   START OF RECEIPT  ================  

================   SIZE (radio buttons)   ================  
*/
function getReceipt() {    
  var text1 = "<h3>Your Order:</h3>";  
  var runningTotal = 0;  
  var sizeTotal = 0;  
  var sizeArray = document.getElementsByClassName("size");   /*  all items with class of size (the "Size" category). */

  for (var i = 0;   i < sizeArray.length;   i++)  {      /* This iterates through the category items  */
	if (sizeArray[ i ].checked) {      /*This condition will check each item in the iteration to see if that particular item has been checked or not  ... AND it will give a "checked" value to that checked item*/
		var selectedSize = sizeArray[ i ].value;    /* declares new var (selectedSize) that temporarily stores the value to be added to the text1 var (and listed in the receipt ) */
		text1 = text1+selectedSize+"<br>";   /* concatenates a new value to the previous value (already) stored within (var) text1  */
		}
    }
    
    //this determines the money portion of the SIZE (radio) category
	if (selectedSize === "Snack Size") {
		sizeTotal = 6;
	} else if (selectedSize === "Individual Size") {
		sizeTotal = 10;
	} else if (selectedSize === "Dinner Size") {
		sizeTotal = 14;
	} else if (selectedSize === "Party Size") {
        sizeTotal = 16;
    } else if (selectedSize === "Cat Shape Size") {
		sizeTotal = 16;
    }
	runningTotal = sizeTotal; 

	console.log(selectedSize+" = $"+sizeTotal+".00");
//  prints to receipt:
	document.getElementById("sizeLineItem").innerHTML=
	(   ("<h3>Your Order Summary</h3>") +  "&nbsp "   +( "$" + sizeTotal + ".00" )  +  "&nbsp "   +  "&nbsp "  + selectedSize   );
     
	console.log("size selected (text1): "+text1);
	console.log("(runningTotal cslg in size) Subtotal: $"+runningTotal+".00");  	

// this calls the NEXT function so the code keeps going 
getCrust( runningTotal, text1 ); 
};	 // All three of these variables will be passed on to each function
/*
  ================   end of SIZE option code ================  
*/
  


   

/*
  ================   CRUST  (radio buttons)  ================  
*/
function getCrust(runningTotal,text1) {    
		var crustTotal = 0;
		var selectedCrust = [ ]
		var crustArray = document.getElementsByClassName("crust");   
		
for (var i = 0;   i < crustArray.length;   i++)  {    
	if (crustArray[ i ].checked) {    
		var selectedCrust = crustArray[ i ].value;   
		text1 = text1 + selectedCrust + "<br>";  
// CAREFUL ABOUT WRITING OVER THIS 
		}
	}
	
//this determines the money portion of the CRUST (radio) category
	if (selectedCrust === "No Gluten Crust") {
		crustTotal = 0;
	} else if (selectedCrust === "Cheese Crust") {
		crustTotal = 0;
	} else if (selectedCrust === "Salmon Skin Crust") {
		crustTotal = 3;
	} else if (selectedCrust === "Thin Crust") {
		crustTotal = 0;
	} else if (selectedCrust === "Regular Crust") {
		crustTotal = 0;
			}
	runningTotal =  (runningTotal + crustTotal); /* Adds the crust category amount (cost) to the runningTotal */
		
	console.log(selectedCrust+" = $"+crustTotal+".00");
	//  prints to screen 
	document.getElementById("crustLineItem").innerHTML= (  " + " +  "$" + crustTotal + ".00"  +  "&nbsp "   +  "&nbsp "+  " Crust:  " +  selectedCrust   );
	console.log("crust selected (text1): "+text1);
	console.log("(runningTotal cslg in crust) Subtotal: $"+runningTotal+".00");  
			
	getSauce(runningTotal,text1); 
		};		
/*
================   end of CRUST option code ================  
*/
	  
	  
	   
	
/*
	  ================   SAUCE (radio buttons)   ================  
*/
	function getSauce(runningTotal,text1) {    
		var sauceTotal = 0;
		var selectedSauce = [ ]
		var sauceArray = document.getElementsByClassName("sauce");   
			
	for (var i = 0;   i < sauceArray.length;   i++)  {    
		if (sauceArray[ i ].checked) {    
		 var selectedSauce = sauceArray[ i ].value;   
		   text1 = text1 + selectedSauce + "<br>";  
	 // CAREFUL ABOUT WRITING OVER THIS in subsequent concatenations
				}
			}
		
	 // this determines the money portion of the SAUCE (radio) category
		if (selectedSauce === "Mouse Mousse") {
			sauceTotal = 0;
		} else if (selectedSauce === "Marinara") {
			sauceTotal = 0;
		} else if (selectedSauce  === "DF Cream") {
			sauceTotal = 0;
		} else if (selectedSauce  === "No Sauce") {
			sauceTotal = 0;
			 }
		runningTotal =  (runningTotal + sauceTotal); /* Adds the sauce category amount (cost) to the runningTotal */
		 
	 console.log(selectedSauce+" = $"+sauceTotal+".00");
			   
	//  prints to screen 
	 document.getElementById("sauceLineItem").innerHTML= (  " + " +  "$" + sauceTotal + ".00"  +  "&nbsp "   +  "&nbsp "+  " Sauce:  " +  selectedSauce   );
		  
	console.log("sauce selected (text1): "+text1);
	console.log("(runningTotal cslg in sauce) Subtotal: $"+runningTotal+".00");  
				
		
	 getCheese(runningTotal,text1); 
			};	
			
 /*
================   end of SAUCE option code ================  
*/
		  
		  
		  
	 
	  
	   
	
/*
 ================   CHEESE  (radio buttons)  ================  
*/
	function getCheese(runningTotal,text1) {    	
	var cheeseTotal = 0;
	var selectedCheese = [ ]
	var cheeseArray = document.getElementsByClassName("cheese");   
			
	for (var i = 0;   i < cheeseArray.length;   i++)  {    
		if (cheeseArray[ i ].checked) {    
		 var selectedCheese = cheeseArray[ i ].value;   
		   text1 = text1 + selectedCheese + "<br>";  
	 // CAREFUL ABOUT WRITING OVER THIS
				}
			}
		
	 // this determines the money portion of the CHEESE (radio) category
		if (selectedCheese === "Regular Cheese") {
			cheeseTotal  = 0;
		} else if (selectedCheese === "Cheez") {
			cheeseTotal  = 0;
		} else if (selectedCheese  === "Dbl Cheese") {
			cheeseTotal = 3;
			 }
		runningTotal =  (runningTotal + cheeseTotal ); /* Adds the cheese category amount (cost) to the runningTotal */
		 
	 console.log(selectedCheese+" = $"+cheeseTotal +".00");
			   
	//  prints to screen 
	 document.getElementById("cheeseLineItem").innerHTML= (  " + " +  "$" + cheeseTotal  + ".00"  +  "&nbsp "   +  "&nbsp "+  " Cheese:  " +  selectedCheese   );
		  
	console.log("cheese selected (text1): "+text1);
	console.log("(runningTotal cslg in cheese) Subtotal: $"+runningTotal+".00");  
				
		
	 getVeg(runningTotal,text1); 
			};			
/*
================   end of CHEESE option code ================  
*/
		  
	


	 
/*
================   VEGGIES (checkboxes)   ================  
*/	
function getVeg(runningTotal,text1) {
	var vegTotal = 0;
	var selectedVeg = [ ];
	var vegArray = document.getElementsByClassName("veggies");
	for (var j = 0;  j < vegArray.length;  j++) {
		if (vegArray[ j ].checked) {
			selectedVeg.push(" " + vegArray[ j ].value);
			console.log("selected veg item: ("+vegArray[ j ].value+")");
			text1 = text1+vegArray[ j ].value+"<br>";
		}
	}
	var vegCount = selectedVeg.length;
		if (vegCount > 1) {
			vegTotal = (vegCount - 1);
		} else {
			vegTotal = 0;
		}
	runningTotal = (runningTotal + vegTotal);
console.log("total selected veg items: "+vegCount);
console.log(vegCount+" veg - 1 free veg = "+"$"+vegTotal+".00");
		
	document.getElementById("veggiesLineItem").innerHTML=(  '' + '' +  '$' + vegTotal + '.00'  +  '&nbsp '   +  '&nbsp '+  '  "Veggie(s)"  (1st veg free!):  ' +  selectedVeg   );
	
console.log("veg text1: "+text1);
console.log("Purchase Total: "+"$"+runningTotal+".00");
	
getMeat(runningTotal,text1); // All three of these variables are passed on to each function
	};	
/*
================   end of VEGGIES option code ================  
*/	
	







 /*
    ================   MEATS  (checkboxes)  ================  
*/
function getMeat( runningTotal, text1 )  {    
	var meatTotal = 0;  
	var selectedMeat = [ ];   /* stores the user checked items as a string array */
    var meatArray = document.getElementsByClassName("meats");  /*  meatArray - the array of all the input options from the "Meats" category. */    
	for (var i = 0;  i < meatArray.length;  i++) {   /* This iterates through the category items  */
		if (meatArray[ i ].checked) {   /*  This condition will check each item in the iteration to see if that particular item has been checked or not  ... AND it will give a "checked" value to that checked item*/
		selectedMeat.push(" " + meatArray[ i ].value);  /* Push adds to the array  */
		console.log("selected meat item: ("+meatArray[ i ].value+")");
		text1 = text1+meatArray[ i ].value+"<br>"; 
			//  CAREFUL ABOUT WRITING OVER ABOVE LINE
		}
    }
	
	
//  this determines the money portion of the MEATS category
	var meatCount = selectedMeat.length; // counts the number of items designated as checked
	if (meatCount > 1) {
		meatTotal = (meatCount - 1);
	} else {
		meatTotal = 0;
	}
	runningTotal = (runningTotal + meatTotal); /* Adds the MEAT category amount (cost) to the runningTotal */



console.log ("total meat items: "+meatCount);
console.log (meatCount+" (meat - 1 free meat) = "+"$"+meatTotal+".00");
console.log ("$" + meatTotal + ".00" +  " meat total:  " +  selectedMeat);
console.log ("meat list (text1): "+text1);
console.log("$" + meatTotal + ".00" +  " meat total:  meat list (text1): "+text1);
console.log (  "$" + meatTotal + ".00" +  " meat total (1st meat free!):  " +  selectedMeat   );

 document.getElementById("meatLineItem").innerHTML=(  " + " +  "$" + meatTotal + ".00"  +  "&nbsp "   +  "&nbsp "+  " Meat  (1st meat free!):  " +  selectedMeat   );

console.log("meat selected (text1): "+text1);
console.log ("(runningTotal cslg in meat) Purchase Total: "+"$"+runningTotal+".00")


 //  commented out next line because added in the array with spacing to get menu detail making this a duplicate - used in testing to make sure things matched
    //  document.getElementById("showText").innerHTML=text1;
    document.getElementById("totalPrice").innerHTML = "<h3>Total: <strong>$"+runningTotal+".00"+"</strong></h3>";
};










// =====  slider script:  =====

jssor_1_slider_init = function() {

var jssor_1_options = {
$AutoPlay: 1, // nothing happens when I change - should change start photo ...
$AutoPlaySteps: 4, // changes number of photos moved
$SlideDuration: 300, // original 160 ... this slows down the rotation
$SlideWidth: 200, // makes the photos super wide
$SlideSpacing: 3, // puts space between images ... 10 actually looks good
$Cols: 5, // nothing happens when I change
$Align: 390,  // makes the images stop in the middle of a photo
$ArrowNavigatorOptions: {
$Class: $JssorArrowNavigator$,
$Steps: 5  // nothing changes when the value is different
},
$BulletNavigatorOptions: {
$Class: $JssorBulletNavigator$
}
};
var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);



/*  =====  responsive code begins  ===== */
var MAX_WIDTH = 2400;  // this makes it wider (and proportionately bigger)

function ScaleSlider() {
	var containerElement = jssor_1_slider.$Elmt.parentNode;
	var containerWidth = containerElement.clientWidth;

if (containerWidth) {
	var expectedWidth = Math.min(MAX_WIDTH || containerWidth, containerWidth);
	jssor_1_slider.$ScaleWidth(expectedWidth);
}
else {
	window.setTimeout(ScaleSlider, 30);
		}
}

ScaleSlider();

$Jssor$.$AddEvent(window, "load", ScaleSlider);
$Jssor$.$AddEvent(window, "resize", ScaleSlider);
$Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
/*  =====  end  responsive   =====  */
       };

