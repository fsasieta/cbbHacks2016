$(document).ready(function(){

	document.addEventListener('keyup', doc_keyUp, false);

	$('#selectButtonLeft').click(function(e) {
		console.log("clicked");
		window.location.replace("true_or_false.html");
    });

    $('#selectButtonRight').click(function(e) {
		console.log("click right");
    });
});




function doc_keyUp(e) {

    // this would test for whichever key is 40 and the ctrl key at the same time
    if (e.keyCode == 69) {
        // call your function to do the thing
        console.log("ok");
    }
}
// register the handler 

/*
var newGrid = function(res){

 	$(function(){
 			$('#container').empty();
    });

	var max = res * res;
	var newSize = 960 / res;

	for (var i = 0; i < max; i++){

		var $newSquare = $( "<div class='square'></div>");
		$newSquare.css("width", newSize);
		$newSquare.css("height", newSize);
		$newSquare.css("background-color", "#FAFAFA");
		$newSquare.appendTo( "#container");	
	}

	$('.square').hover(function(){
	
		$(this).css("background-color", "#BDBDBD");
	});
}
*/

var clearGrid = function(){
	$('.square').css("background-color", "FAFAFA");
	
	var res;

	do{
		res = prompt("What would you like the new grid dimensions to be? Please enter 1 - 64", "1");
	} while(isNaN(res) || (res < 1 || res > 64));

	newGrid(res);
}

var defEffect = function(){

	clearGrid();

	$('.square').hover(function(){
		$(this).css("background-color", "#BDBDBD");
		console.log("default");
	});	

}

var randEffect = function(){

	clearGrid();

	$('.square').hover(function(){
		var randomColor = Math.floor(Math.random()*16777215).toString(16);
		$(this).css("opacity", "1");
		$(this).css("background-color", randomColor);
		console.log("random");
	});
	
}

var gradEffect = function(){
	
	clearGrid(); 

	$('.square').hover(function(){
		$(this).css("opacity", "+=0.1");
		console.log("gradient");
	});
}