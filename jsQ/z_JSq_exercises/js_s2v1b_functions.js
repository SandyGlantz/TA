/*
-demonstrates how to pass in a variable
-around line 25 shows an instantiation (creates an instance)
*/



var lang = "Javascript";

/* like declaring a variable, function gets a declared name */
function myFunction(lang) {

    /* "this" (syntax, a command) means whatever is in the statement belongs to the function (myFunction).  this.lang = myFunction.lang
    ... could also refer to a class, element, etc.  "this"  is common in OOP*/
    this.lang = lang;


/* "alert" (a pop-up window) can change to "console.log" for viewing:
    console.log("Hello, welcome to " +this.lang);
     */
    alert("Hello, welcome to " + this.lang);
};


/* here's the instantiation (an object brought into reality)
identify as new, and can still inherit the myFunction

!!!!!!! NOTE: running everything before this results in nothing being shown - no "instance"
you get the "undefined" response in console.
*/
var Test = new myFunction(lang)
