class Star //note that this class does NOT extend Floater
{
  private int myX,myY,mySize;
  public Star()
  {
     myX = (int)(Math.random()*800);
     myY = (int)(Math.random()*800);
     mySize = (int)(Math.random()*5);
  }
  public void show(int r,int g,int b){
    fill(r,g,b);
    stroke(255,255,255);
    ellipse(myX,myY,mySize,mySize);
  }
}
class planet extends Star //note that this class does NOT extend Floater
{
  private int myX,myY,mySize,r,g,b,r1,g1,b1;
  public planet()
  {
     myX = (int)(Math.random()*800);
     myY = (int)(Math.random()*800);
     mySize = (int)(Math.random()*5)+10;
     r = (int)(Math.random()*2);
     g = (int)(Math.random()*2);
     b = (int)(Math.random()*2);
     
     
     
  }
  public void show(){
    if(r == 0){
      r1 = 0;
    }else{
      r1 = 255;
      g1=0;
      b1=0;
    }
    if(b == 0){
      b1 = 0;
    }else {
      b1 = 255;
      r1 = 0;
      g1=0;
    }
    if(g == 0){
      g1 = 0;
    }else{
      g1 = 255;
      b1=0;
      r1=0;
    }
    fill(r1,g1,b1);
    stroke(r1,g1,b1);
    ellipse(myX,myY,mySize,mySize);
  }
}
