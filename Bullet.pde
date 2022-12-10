class Bullet extends Floater{
  public Bullet (Spaceship sp){
    myCenterX = sp.getX();
    myCenterY = sp.getY();
    myPointDirection = sp.getP();
    accelerate(5);
  }
  public void show(){
    noStroke();
    fill(255,0,0);
    ellipse((float)myCenterX,(float)myCenterY,10,10);
  }
  public double getX(){
    return myCenterX;
  }
  public double getY(){
    return myCenterY;
  }
}
