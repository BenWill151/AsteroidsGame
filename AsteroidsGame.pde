//spaceship vars
Spaceship sp = new Spaceship();
double f = 0;
double w1=0;
double s1 =0;
innerSP sp2 = new innerSP();
th1 tha = new th1();
th2 thb = new th2();
boolean wisdown = false;
boolean aisdown = false;
boolean disdown = false;


//Floater vars
ArrayList <as> a2 = new ArrayList <as>();
as [] a1 =new as[10];

//Star vars
Star [] nightSky = new Star[300];
planet [] planets = new planet[10];

//Game vars
boolean mouse = false;
boolean GameOver = false;
int lives = 5;
int points = 0;
ArrayList <Bullet> bs = new ArrayList <Bullet>();

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
    a2.add(new as());
    a2.get(i).myCenterX = (int)(Math.random()*width);
    a2.get(i).myCenterY = (int)(Math.random()*height);
  }
}
public void draw()
{
  background(0);
  textSize(15);
  text("Lives = "+lives, width/2, 15);
  text("Points = "+points, width/2+100, 15);
  for (int i = 0; i<nightSky.length; i++) {
    nightSky[i].show(255, 255, 255);
  }
  for (int i = 0; i<planets.length; i++) {
    planets[i].show();
  }
  for (int i = 0; i < bs.size(); i++) {
    bs.get(i).move();
    bs.get(i).show();
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
  if ( wisdown == true ) {//acceleratwdawde func
    sp.ACCEL(.07);
    sp2.ACCEL(.07);
    tha.show();
    tha.ACCEL(.07);
    thb.show();
    thb.ACCEL(.07);
    w1 = w1+.001;
  }
  if ( aisdown == true ) {//LEFT func
    sp.LEFT();
    sp2.LEFT();
    tha.LEFT();
    thb.LEFT();
  }
  if ( disdown == true ) {//RIGHT func
    sp.RIGHT();
    sp2.RIGHT();
    tha.RIGHT();
    thb.RIGHT();
  }
}
public void keyPressed() {
  if (key == ' ') {
    bs.add(new Bullet(sp));
  }
  if (key == 'r' || key == 'R') {
    loop();
    GameOver = false;
    lives = 5;
    
     bs.clear();
    
    
    for (int i = 0; i<10; i++) {
      a2.add(new as());
      a2.get(i).myCenterX = (int)(Math.random()*width);
      a2.get(i).myCenterY = (int)(Math.random()*height);
    }
  }
  if (key == 'h') {
    lives = lives + 999;
  }
  if ( key == 'q'|| key == 'Q') {//hyperdrive func
    int P = (int)(Math.random()*360);
    int MX = (int)(Math.random()*width);
    int MY = (int)(Math.random()*height);
    sp.HYPE(P, MX, MY);
    sp2.HYPE(P, MX, MY);
    tha.HYPE(P, MX, MY);
    thb.HYPE(P, MX, MY);
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

public void asc() {
  for (int i =0; i<a2.size(); i++) {

    a2.get(i).show();
    a2.get(i).move();
    a2.get(i).rand(200, 300, 300);
    if (dist((float)sp.myCenterX,
      (float)sp.myCenterY,
      (float)a2.get(i).getX(),
      (float)a2.get(i).getY())<60) {
      a2.remove(i);
      lives = lives - 1;
      a2.add(new as());
    }
  }
  for (int i = 0; i < bs.size(); i++) {
    for(int j = 0; j < a2.size(); j++){
      if(dist((float)bs.get(i).getX(), (float)bs.get(i).getY(), (float)a2.get(j).getX(), (float)a2.get(j).getY()) < 40)  {
        bs.remove(i);
        a2.remove(j);
        points = points +1;
        a2.add(new as());
        lives = lives +1;
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
