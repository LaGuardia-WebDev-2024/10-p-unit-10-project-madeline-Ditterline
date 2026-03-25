var hayXPos = [];
var hayYPos = [];
var hay = "🌾";
var hayTotal = 270;

var needleXPos = [];
var needleYPos = [];
var needle = "💉";
var needleTotal = 3;
var needleFound = 0;


setup = function() {
   size(600, 450); 

   reset();
}

draw = function(){   

   if(keyPressed){
    if(key == 'r'){
      reset();
    }
  
    
   }

  display();
}


mouseClicked = function(){
  check(mouseX, mouseY);
}

var check = function(xClick, yClick){
  for(var i = 0; i < needleXPos.length; i++){
    if(dist(xClick - 5, yClick - 5, needleXPos[i], needleYPos[i])<15){
      needleXPos.splice(i, 1);
      needleYPos.splice(i, 1);
      needleFound++;
    }
  }
}

var display = function(){
  background(100,100,100,0);
 textSize(50);
 var x = 0;
 
//fencelines
var y = 0;
for(let y = 0; y < 450; y += 20){
line(0,y,600,y);
}
//fence
 while(x<600){
    text("🚧", x, 400);
    x += 50;
    }
  for(var i = 0; i < hayXPos.length; i ++){
    textSize(35);
    text(hay, hayXPos[i], hayYPos[i]);
  }
fill(200,200,0);
  textSize(15);

  for(var i = 0; i < needleXPos.length; i ++){
    text(needle, needleXPos[i], needleYPos[i]);
  }
  fill(0,0,0);
  rect(0,400,600,50);
  fill(255,255,255);
  text("Find The " + needle + "s   |   " + needle + " " + needleFound + "/" + needleTotal, 0, 425);

  if(needleFound == needleTotal){
    fill(255, 1, 1);
    textSize(50);
    text("Press 'r' to restart \nthe game", 50, 200);
  }
}

var reset = function(){
  hayXPos = [];
  hayYPos = [];
  needleXPos = [];
  needleYPos = [];
  needleFound = 0;


  for(var i = 0; i < hayTotal; i++){
    hayXPos.push(random(0,600));
    hayYPos.push(random(0,400));
  }

  for(var i = 0; i < needleTotal; i++){
    needleXPos.push(random(0,600));
    needleYPos.push(random(0,400));
  }
}