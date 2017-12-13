


 /*
  ================   SIZE   ================  
  */
function getReceipt() {    
	var text1 = "<h3>You Ordered:</h3>";
    var runningTotal = 0;  
    var sizeTotal = 0;
    var sizeArray = document.getElementsByClassName("size");   
  
  for (var i = 0;   i < sizeArray.length;   i++)  {    
      if (sizeArray[ i ].checked) {    
          var selectedSize = sizeArray[ i ].value;   
          text1 = text1 + ("$" + sizeTotal + ".00 ") +  " &nbsp "  + selectedSize + "<br>";  
// CAREFUL ABOUT WRITING OVER THIS with subsequent concatenations
      }
  }
      
      if (selectedSize === "Personal Pizza") {
          sizeTotal = 6;
      } else if (selectedSize === "Medium Pizza") {
          sizeTotal = 10;
      } else if (selectedSize === "Large Pizza") {
          sizeTotal = 14;
      } else if (selectedSize === "Extra Large Pizza") {
          sizeTotal = 16;
      }
      runningTotal = sizeTotal;  
      
      console.log(selectedSize+" = $"+sizeTotal+".00");
      //  the above line is great but reversed (shows: Large Pizza = $14.00)

      //  prints to screen in right order
      document.getElementById("sizeLineItem").innerHTML=
      (   ("<h3>Your Order Summary</h3>") +  "&nbsp "   +( "$" + sizeTotal + ".00" )  +  "&nbsp "   +  "&nbsp "  + selectedSize   );
     
     
      console.log("size selected (text1): "+text1);
      console.log("(runningTotal cslg in size) Subtotal: $"+runningTotal+".00");  
      

  	getCrust(runningTotal,text1); 
  };	
  
  /*
  ================   end of SIZE option code ================  
  */
  
  
  

 /*
  ================   CRUST   ================  
  */
function getCrust(runningTotal,text1) {    


	var crustTotal = 0;
	var selectedCrust = [ ]
	var crustArray = document.getElementsByClassName("crust");   
	
	for (var i = 0;   i < crustArray.length;   i++)  {    
		if (crustArray[ i ].checked) {    
			var selectedCrust = crustArray[ i ].value;   
			text1 = text1 + selectedCrust + "<br>";  
  // CAREFUL ABOUT WRITING OVER THIS with subsequent concatenations
		}
	}

	    //this determines the money portion of the CRUST (radio) category
		if (selectedCrust === "Plain Crust") {
			crustTotal = 0;
		} else if (selectedCrust === "Garlic Butter Crust") {
			crustTotal = 0;
		} else if (selectedCrust === "Cheese Stuffed Crust") {
			crustTotal = 3;
		} else if (selectedCrust === "Spicy Crust") {
			crustTotal = 0;
		} else if (selectedCrust === "House Special Crust") {
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
  ================   SAUCE   ================  
  */
function getSauce(runningTotal,text1) {    
    
    
var sauceTotal = 0;
var selectedSauce = [ ]
var sauceArray = document.getElementsByClassName("sauce");   
        
for (var i = 0;   i < sauceArray.length;   i++)  {    
    if (sauceArray[ i ].checked) {    
     var selectedSauce = sauceArray[ i ].value;   
       text1 = text1 + selectedSauce + "<br>";  
 // CAREFUL ABOUT WRITING OVER THIS with subsequent concatenations
            }
        }
    
 // this determines the money portion of the SAUCE (radio) category

/*        =====   NOTE   =====   All items are zero - left the code in place in case that should change in the future - AND as a way to show the receipt what was ordered  
----- > Ended up deleteing the "showText" in the html so the total showed but not the line item without the pricing
*/
    if (selectedSauce === "Marinara sauce") {
        sauceTotal = 0;
    } else if (selectedSauce === "White sauce") {
        sauceTotal = 0;
    } else if (selectedSauce  === "Barbeque sauce") {
        sauceTotal = 0;
    } else if (selectedSauce  === "No sauce") {
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
  ================   CHEESE   ================  
  */
function getCheese(runningTotal,text1) {    
    
    
var cheeseTotal = 0;
var selectedCheese = [ ]
var cheeseArray = document.getElementsByClassName("cheese");   
        
for (var i = 0;   i < cheeseArray.length;   i++)  {    
    if (cheeseArray[ i ].checked) {    
     var selectedCheese = cheeseArray[ i ].value;   
       text1 = text1 + selectedCheese + "<br>";  
 // CAREFUL ABOUT WRITING OVER THIS with subsequent concatenations
            }
        }
    
 // this determines the money portion of the CHEESE (radio) category
    if (selectedCheese === "Regular cheese") {
        cheeseTotal  = 0;
    } else if (selectedCheese === "No cheese") {
        cheeseTotal  = 0;
    } else if (selectedCheese  === "Extra cheese") {
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
      
    
 
// trying veg in the middle :-(

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
    
    document.getElementById("veggiesLineItem").innerHTML=(  " + " +  "$" + vegTotal + ".00"  +  "&nbsp "   +  "&nbsp "+  " 'Veggie(s)'  (1st veggfree!):  " +  selectedVeg   );

	console.log("veg text1: "+text1);
	console.log("Purchase Total: "+"$"+runningTotal+".00");

    
    getMeat(runningTotal,text1); // All three of these variables will be passed on to each function
};















     
 /*
        ================   MEATS   ================  
  */
  function getMeat( runningTotal, text1 )  {
      var meatTotal = 0;
      var selectedMeat = [ ];
      var meatArray = document.getElementsByClassName("meats");
      for (var i = 0;  i < meatArray.length;  i++) {
                if (meatArray[ i ].checked) {
                    // added " " to meat array (below) to get spacing ... MAGIC
                     selectedMeat.push(" " + meatArray[ i ].value);
                     console.log("selected meat item: ("+meatArray[ i ].value+")");
                     text1 = text1+meatArray[ i ].value+"<br>";
          }
      }
  
      var meatCount = selectedMeat.length;
      if (meatCount > 1) {
          meatTotal = (meatCount - 1);
      } else {
          meatTotal = 0;
      }
	  runningTotal = (runningTotal + meatTotal);
	  
      console.log ("total meat items: "+meatCount);
            console.log (meatCount+" (meat - 1 free meat) = "+"$"+meatTotal+".00");
            //   the line below is out of the function and errors
            //  console.log("selected meat item: ("+meatArray[mt].value+")");
            //  combination of above twolines:
    console.log ("$" + meatTotal + ".00" +  " meat total:  " +  selectedMeat);
        //  result is:   $2.00 meat total:  Canadian Bacon,Ground Beef,Anchovy


      console.log ("meat list (text1): "+text1);
            //  attempt to add total in above line ...
            console.log("$" + meatTotal + ".00" +  " meat total:  meat list (text1): "+text1);
            //  Result is a fail:   $2.00 meat total:  meat list (text1): <h3>You Ordered:</h3>$0.00  &nbsp Large Pizza<br>Plain Crust<br>Canadian Bacon<br>Ground Beef<br>Anchovy<br>

    //  trying another route ...
    console.log (  "$" + meatTotal + ".00" +  " meat total (1st meat free!):  " +  selectedMeat   );
         //   result YAY:  $2.00 meat total:   Canadian Bacon, Ground Beef, Anchovy 
         document.getElementById("meatLineItem").innerHTML=(  " + " +  "$" + meatTotal + ".00"  +  "&nbsp "   +  "&nbsp "+  " Meat  (1st meat free!):  " +  selectedMeat   );

        console.log("meat selected (text1): "+text1);
        console.log ("(runningTotal cslg in meat) Purchase Total: "+"$"+runningTotal+".00")
        

//  commented out because added in the array with spacing to get menu detail making this a duplicate - used in testing to make sure things matched
    // document.getElementById("showText").innerHTML=text1;
    document.getElementById("totalPrice").innerHTML = "<h3>Total: <strong>$"+runningTotal+".00"+"</strong></h3>";
};
  
  