final int GAME_START = 0;                //state
final int GAME_RUN = 1;
final int GAME_LOSE = 2;
PImage    treasure,HP,enemy,fighter;     //PImage
PImage    bg1,bg2,bg3,start1,start2,end1,end2;
int       bg1x,bg2x,bg3x,tsx,tsy,eny,enx;//int
int       HPx,start,end,startGamex,startGamey,state = GAME_START;
float     x ,y ,speed = 15,T;               //FT control
boolean   upPressed    = false;
boolean   downPressed  = false;
boolean   leftPressed  = false;
boolean   rightPressed = false;
void setup() {
  size(640, 480);
  start1     = loadImage("img/start1.png");   // BG img
  start2     = loadImage("img/start2.png");
  end1       = loadImage("img/end1.png");
  end2       = loadImage("img/end2.png");
  bg1        = loadImage("img/bg1.png");
  bg2        = loadImage("img/bg2.png");
  startGamex = 210;
  startGamey = 385;
  start    = 0 ; 
  end      = 0 ;
  bg1x     = 0 ;
  treasure = loadImage("img/treasure.png");   // treasure
  tsx   = floor(random(15, 340));
  tsy   = floor(random(30, 440));
  HP    = loadImage("img/hp.png");            // HP
  HPx   = 20;
  enemy = loadImage("img/enemy.png");         // em 
  enx   = 0;
  eny   = (int)random(30, 410);
  fighter = loadImage("img/fighter.png");     // fighter  
        x = width-30;
        y = height/2;
}
void draw() {
  background(0);
switch (state){                               // game state
  case GAME_START:                            // First page
     image(start2,start,0);
       if(mouseX>startGamex && mouseX<startGamex +230 && mouseY>startGamey && mouseY<startGamey +30 ){
     image(start1,start,0);
     }
       if(mouseX>startGamex && mouseX<startGamex +230 && mouseY>startGamey && mouseY<startGamey +30 && mouseButton == LEFT ){
       state = GAME_RUN;
     }
  break;
  case  GAME_RUN:                             // SEC page
    T    = (y - eny)/48;
    bg2x = bg1x - 636;                        // RUN background
    bg3x = bg2x - 636;
    bg1x = (bg1x += 5) % 1280;
  image(bg1, bg1x, 0);
  image(bg2, bg2x, 0);
  image(bg1, bg3x, 0);
  image(fighter, x, y);                       // FT move 
  image(enemy, enx + 3, eny); 
  enx = (enx += 10) % width;

  eny = eny += T;
  image(HP, 4, 4);
  image(treasure, tsx, tsy);
  fill(255, 0, 0);                           // now hp
  rect(10, 15, HPx, 10);
  
  if (upPressed) {      
    y -= speed;
  }
  if (downPressed) {
    y += speed;
  }
  if (leftPressed) {
    x -= speed;
  }
  if (rightPressed) {
    x += speed;
  }
  if(y<0){
    y = 0;
  }
  if(y>height-45){
    y = height-45;
  } 
    if(x<0){
    x = 0;
  }
  if(x>width-45){
    x = width-45;
  } 
  
if(enx > x-60 && enx < x+60 && eny > y-60 && eny < y+60){ // en & HP
   enx = 0;
   eny = (int)random(30, 410);
  HPx -=20;    
       }
if(HPx<=4){
   HPx = 20;  
     x = width-30;
     y = height/2;
 state = GAME_LOSE;
       }
  
if(tsx >= x-60 && tsx < x+60 && tsy > y-60 && tsy < y+60){//ts and hp
  tsx = (int)random(15, 340);
  tsy = (int)random(30, 440);
   HPx +=10;    
       }
     if(HPx >= 200){
     HPx = 200;    
       }
 break;
  case  GAME_LOSE:                                        // TH page
    image(end2,end,0);
       if(mouseX>startGamex && mouseX<startGamex +230 && mouseY>startGamey-80 && mouseY<startGamey -50 ){
    image(end1,end,0);
       }
       if(mouseX>startGamex && mouseX<startGamex +230 && mouseY>startGamey-80 && mouseY<startGamey -50 && mouseButton == LEFT ){
         state = GAME_RUN;
       }
  
   break;   
  }
}
void keyPressed() {
    if (key == CODED) {                                   // FT control
      switch (keyCode) {
        case UP:
          upPressed = true;
          break;
        case DOWN:
          downPressed = true;
          break;
        case LEFT:
          leftPressed = true;
          break;
        case RIGHT:
          rightPressed = true;
          break;
      }
    }
 }
void keyReleased(){
 if (key == CODED) {                   //FT control
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
 }
}
