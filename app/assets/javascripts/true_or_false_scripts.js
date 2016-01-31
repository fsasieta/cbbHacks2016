var move = 0;


$(document).ready(function(){

	document.addEventListener('keyup', doc_keyUp, false);

//	var welcomeText = "<span>Welcome to True or False! wave LEFT to go back, or RIGHT to go forward</span>";

//	$("#questiontext").append(welcomeText);

	rightKey = false;

});

function highlight(){
	console.log(move);
	if(move == 0){


		var to = document.getElementById('my1');
		to.focus();
		move = move+1;
		//var to = document.getElementById('red');
	}
	else if(move == 1){
	//	from.blur();

		var to = document.getElementById('red');
		to.focus();
		move+=1;

	}
	else if(move == 2){
		var to = document.getElementById('blue');
		to.focus();
		move+=1;

	}
	else if(move == 3){
		var to  = document.getElementById('my2');
		to.focus();
		move=0;
	}




	//Keep track of what is currently hihlight e.g global
	//array id of each key
	//in highlight see what is highlighted,
	//.focus

}


function doc_keyUp(e) {
	var div = document.getElementById('questiontext');

    if (e.keyCode == 37) {
		goBack(div);
    }
    else if(e.keyCode == 40){
    	highlight();
    }
    else if(e.keyCode == 39){
		goForward(div);

    }
}

function goBack(div){
	
	$("#questiontext").fadeOut(function() {
  		$(this).html("Options going left")
	}).fadeIn();


	//div.innerHTML = 'works';

}

function goForward(div){
	if(rightKey == false){
		rightKey = true;
		$("#questiontext").fadeOut(function() {
  			$(this).html("Going right")
		}).fadeIn();

		var $someelement = $('<div class="hot-container"/>').appendTo('#container');

		var $btn1 = $('<a href="#" class="btn" id="my1">A</a>').fadeIn(500).appendTo('.hot-container');
		var $btn2 = $('<a href="#" class="btn" id="red">B</a>').fadeIn(500).appendTo('.hot-container');
		var $btn3 = $('<a href="#" class="btn" id="blue">C</a>').fadeIn(500).appendTo('.hot-container');
		var $btn4 = $('<a href="#" class="btn" id="my2">D</a></p>').fadeIn(500).appendTo('.hot-container');
	}
	else{
		  $("#questiontext").fadeOut(function() {
  				$(this).html("Options going right")
			}).fadeIn();


		/*
		var $newOption = $( "<div class='btn'></div>");
		$newOption.appendTo("#container");
		*/

	}




}
