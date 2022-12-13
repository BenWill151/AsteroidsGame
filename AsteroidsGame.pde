//spaceship vars
Spaceship sp = new Spaceship(); //outer/main spaceship
double f = 0;
double w1=0;
double s1 =0; 
innerSP sp2 = new innerSP(); //inner spaceship
th1 tha = new th1(); // thruster 1
th2 thb = new th2(); // thruster 2
boolean wIsDown = false;
boolean aIsDown = false;
boolean dIsDown = false;


//Floater vars
ArrayList <as> asteroids1 = new ArrayList <as>(); //asteroids


//Star vars
Star [] nightSky = new Star[300];
planet [] planets = new planet[10];

//Game vars
boolean mouse = false;
boolean GameOver = false;
double lives = 5;
int points = 0;
ArrayList <Bullet> shots = new ArrayList <Bullet>(); // bullets

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

  for (int i = 0; i<10; i++) {
    asteroids1.add(new as());
    asteroids1.get(i).myCenterX = (int)(Math.random()*width);
    asteroids1.get(i).myCenterY = (int)(Math.random()*height);
  }
}
public void draw()
{
  background(0);
  textSize(15);
  text("Lives = "+(int)lives, width/2, 15); //lives counter increases by .1 for every asteroid shot micro increses hidden by (int)
  text("Points = "+points, width/2+100, 15); //points counter
  for (int i = 0; i<nightSky.length; i++) {
    nightSky[i].show(255, 255, 255);
  }
  for (int i = 0; i<planets.length; i++) {
    planets[i].show();
  }
  for (int i = 0; i < shots.size(); i++) {
    shots.get(i).move();
    shots.get(i).show();
  }
  
  sp.show();
  sp.ACCEL(f);
  sp2.show();
  sp2.ACCEL(f);
  tha.ACCEL(f);
  thb.ACCEL(f);
  fill(255, 255, 255);
  ans();
  asc();
  gameOver();
}
public void ans() {
  if ( wIsDown == true ) {//accelerate wdawde func
    sp.ACCEL(.07);
    sp2.ACCEL(.07);
    tha.show();
    tha.ACCEL(.07);
    thb.show();
    thb.ACCEL(.07);
    w1 = w1+.001;
  }
  if ( aIsDown == true ) {//LEFT func
    sp.LEFT();
    sp2.LEFT();
    tha.LEFT();
    thb.LEFT();
  }
  if ( dIsDown == true ) {//RIGHT func
    sp.RIGHT();
    sp2.RIGHT();
    tha.RIGHT();
    thb.RIGHT();
  }
}
public void keyPressed() {
  if (key == ' ') {
    shots.add(new Bullet(sp));
  }
  if (key == 'r' || key == 'R') {
    loop();
    GameOver = false;
    lives = 5;
    
     shots.clear();
    
    
    for (int i = 0; i<10; i++) {
      asteroids1.add(new as());
      asteroids1.get(i).myCenterX = (int)(Math.random()*width);
      asteroids1.get(i).myCenterY = (int)(Math.random()*height);
    }
  }
  if (key == 'h') {
    lives = lives + 999;
  }
  if ( key == 'q'|| key == 'Q') {//hyperdrive func
    int randomMyPointDirection = (int)(Math.random()*360);
    int randomMyX = (int)(Math.random()*width);
    int randomMyY = (int)(Math.random()*height);
    sp.HYPE(randomMyPointDirection, randomMyX, randomMyY); 
    sp2.HYPE(randomMyPointDirection, randomMyX, randomMyY);
    tha.HYPE(randomMyPointDirection, randomMyX, randomMyY);
    thb.HYPE(randomMyPointDirection, randomMyX, randomMyY);
  }
  if (key == 'w'|| key == 'W') {//acceleratwdawde func
    wIsDown = true;
  }
  if ( key == 'a'|| key == 'A') {//LEFT func
    aIsDown = true;
  }
  if ( key == 'd'|| key == 'D') {//RIGHT func
    dIsDown = true;
  }
}
public void keyReleased() {
  if (key == 'w'|| key == 'W') {//acceleratwdawde func
    wIsDown = false;
  }
  if ( key == 'a'|| key == 'A') {//LEFT func
    aIsDown = false;
  }
  if ( key == 'd'|| key == 'D') {//RIGHT func
    dIsDown = false;
  }
}

public void asc() {
  for (int i =0; i<asteroids1.size(); i++) {

    asteroids1.get(i).show();
    asteroids1.get(i).move();
    asteroids1.get(i).rand(200, 300, 300);
    if (dist((float)sp.myCenterX,
      (float)sp.myCenterY,
      (float)asteroids1.get(i).getX(),
      (float)asteroids1.get(i).getY())<60) {
      asteroids1.remove(i);
      lives = lives - 1.0;
      asteroids1.add(new as());
    }
  }
  for (int i = 0; i < shots.size(); i++) {
    for(int j = 0; j < asteroids1.size(); j++){
      if(dist((float)shots.get(i).getX(), (float)shots.get(i).getY(), (float)asteroids1.get(j).getX(), (float)asteroids1.get(j).getY()) < 40)  {
        shots.remove(i);
        asteroids1.remove(j);
        points = points +1;
        asteroids1.add(new as());
        lives = lives + 0.1;
        break;
      }
    }
  }
}
public void gameOver() {
  if (lives <= 0) {
    GameOver = true;
  }
  if (GameOver == true) {
    textSize(50);
    text("GAME OVER", width/2, height/2);
    noLoop();
  }
}
