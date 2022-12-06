class AS extends Floater{
  protected double rotSpeed;
  int a;
  float ra,r,x,y;
  int myColorRA;
  public AS(){    
    a = 40;
    rotSpeed = (Math.random()*20)-10;
    corners = 12;    
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = a;
    yCorners[0] = 0;
    xCorners[1] = (int)((a+a/2)/2)+(int)((Math.random()*30)-10);//d
    yCorners[1] = (int)((0+(Math.sqrt(3)*a/2))/2)+(int)((Math.random()*30)-10);//d
    xCorners[2] = a/2;
    yCorners[2] = (int)(Math.sqrt(3)*a/2);
    xCorners[3] = (int)((a/2+(-1*a/2))/2)+(int)((Math.random()*30)-10);
    yCorners[3] = (int)(((Math.sqrt(3)*a/2)+(Math.sqrt(3)*a/2))/2)+(int)((Math.random()*30)-10);
    xCorners[4] = (-1*a/2);
    yCorners[4] = (int)(Math.sqrt(3)*a/2);
    xCorners[5] = (int)(((-1*a/2)+(-1*a))/2)+(int)((Math.random()*30)-10);//d
    yCorners[5] = (int)(((Math.sqrt(3)*a/2)+0)/2)+(int)((Math.random()*30)-10);//d
    xCorners[6] = -1*a;
    yCorners[6] = 0;
    xCorners[7] = (int)((-1*a+(-1*a/2))/2)+(int)+(int)((Math.random()*30)-10);//d
    yCorners[7] = (int)((0+(-1*Math.sqrt(3)*a/2))/2)+(int)((Math.random()*30)-10);//d
    xCorners[8] = -1*a/2;
    yCorners[8] = (int)(-1*Math.sqrt(3)*a/2);
    xCorners[9] = (int)((-1*a/2+a/2)/2)+(int)((Math.random()*30)-10);
    yCorners[9] = (int)(((-1*Math.sqrt(3)*a/2)+(-1*Math.sqrt(3)*a/2))/2)+(int)((Math.random()*30)-10);
    xCorners[10] =a/2 ;
    yCorners[10] = (int)(-1*Math.sqrt(3)*a/2);
    xCorners[11] = (int)((a/2+a)/2)+(int)((Math.random()*30)-10) ;//d
    yCorners[11] = (int)(((-1*Math.sqrt(3)*a/2)+0)/2)+(int)((Math.random()*30)-10);//d
    
    
    myColorRA = (int)((Math.random()*120)+105); 
    myColor = color(myColorRA,myColorRA,myColorRA);
    myCenterX = 400;
    myCenterY = 400;
    myXspeed = (int)((Math.random()*10)-5);
    myYspeed = (int)((Math.random()*10)-5);
    myPointDirection = 0;
  }
  void rand(float radius ,float Xcenter,float Ycenter){
   r = random(radius);
   ra = random(TWO_PI);
   x = Xcenter+cos(ra)*r;
   y = Ycenter+sin(ra)*r; 
  }
  void move(){
    turn(rotSpeed);
    super.move();

  }
  public double getX(){
    return myCenterX;
  }
  public double getY(){
    return myCenterY;
  }
  
}
