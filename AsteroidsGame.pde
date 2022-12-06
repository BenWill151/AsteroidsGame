//Spaceship vars
Spaceship SP = new Spaceship();
double f = 0;
double w1=0;
double s1 =0;
innerSP SP2 = new innerSP();
TH1 THA = new TH1();
TH2 THB = new TH2();
boolean wisdown = false;
boolean aisdown = false;
boolean disdown = false;


//Floater vars
ArrayList <AS> A2 = new ArrayList <AS>();
AS [] A1 =new AS[10];

//Star vars
Star [] nightSky = new Star[300];
planet [] planets = new planet[10];

//Game vars
boolean mouse = false;
boolean GameOver = false;
int lives = 5;

public void setup()
{
  size(1000, 1000);
  textAlign(CENTER);
  for (int i = 0; i<nightSky.length; i++) {

    nightSky[i] = new Star();
  }
  for (int i = 0; i<planets.length; i++) {

    planets[i] = new planet();
  }
  
  for(int i = 0; i<10;i++){
    A2.add(new AS());
    A2.get(i).myCenterX = (int)(Math.random()*width);
    A2.get(i).myCenterY = (int)(Math.random()*height);
  }
}
public void draw()
{
  background(0);
  textSize(15);
  text("Lives = "+lives,width/2,15);
  for (int i = 0; i<nightSky.length; i++) {
    nightSky[i].show(255, 255, 255);
  }
  for (int i = 0; i<planets.length; i++) {
    planets[i].show();
  }  
  SP.show();
  SP.ACCEL(f);
  SP2.show();
  SP2.ACCEL(f);
  THA.ACCEL(f);
  THB.ACCEL(f);
  fill(255, 255, 255);
  //textSize(7);
  //text((float)SP.myCenterX+" = myCenterX", 50, 10);
  //text((float)SP.myCenterY+" = myCenterY", 50, 30);
  //text((float)SP.myXspeed+" = myXspeed", 50, 50);
  //text((float)SP.myYspeed+" = myYspeed", 50, 70);
  //text((float)SP.myPointDirection+" = myPointDirection", 50, 90);
  ans();
  asc();
  gameOver();
}
public void ans() {
  if ( wisdown == true ) {//acceleratwdawde func
    SP.ACCEL(.07);
    SP2.ACCEL(.07);
    THA.show();
    THA.ACCEL(.07);
    THB.show();
    THB.ACCEL(.07);
    w1 = w1+.001;
  }
  if ( aisdown == true ) {//LEFT func
    SP.LEFT();
    SP2.LEFT();
    THA.LEFT();
    THB.LEFT();
  }
  if ( disdown == true ) {//RIGHT func
    SP.RIGHT();
    SP2.RIGHT();
    THA.RIGHT();
    THB.RIGHT();
  }
}
public void keyPressed() {
  if ( key == 'q'|| key == 'Q') {//hyperdrive func
    int p = (int)(Math.random()*360);
    int mx = (int)(Math.random()*width);
    int my = (int)(Math.random()*height);
    SP.HYPE(p, mx, my);
    SP2.HYPE(p, mx, my);
    THA.HYPE(p, mx, my);
    THB.HYPE(p, mx, my);
  }
  if (key == 'w'|| key == 'W') {//acceleratwdawde func
    wisdown = true;
  }
  if ( key == 'a'|| key == 'A') {//LEFT func
    aisdown = true;
  }
  if ( key == 'd'|| key == 'D') {//RIGHT func
    disdown = true;
  }
}
public void keyReleased() {
  if (key == 'w'|| key == 'W') {//acceleratwdawde func
    wisdown = false;
  }
  if ( key == 'a'|| key == 'A') {//LEFT func
    aisdown = false;
  }
  if ( key == 'd'|| key == 'D') {//RIGHT func
    disdown = false;
  }
}

public void asc(){
  for(int i =0; i<A2.size();i++){
    
    A2.get(i).show();
    A2.get(i).move();
    A2.get(i).rand(200, 300, 300);
    if(dist((float)SP.myCenterX,
            (float)SP.myCenterY, 
            (float)A2.get(i).getX(),
            (float)A2.get(i).getY())<60){
        A2.remove(i);
        lives = lives - 1;
      }
  }
}
public void gameOver(){
  if(lives <= 0){
    GameOver = true;
  }
  if(GameOver == true){
    textSize(50);
    text("GAME OVER",width/2,height/2);
    noLoop();
  }
  
}







