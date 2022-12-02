class Spaceship extends Floater  
{   
   protected int turnspeed;
   Spaceship(){
     corners = 13;
     turnspeed = 5;
     xCorners = new int[]{20,-22,-35,-35,-28,-30,-28,-35,-35,-22,20,40,20};
     yCorners = new int[]{-10,-22,-21,-14,-10,0,10,14,21,22,10,0,-10};
     myColor = color(80,80,80);
     myCenterX = 400;
     myCenterY = 400;
     myXspeed = 0;
     myYspeed = 0;
     myPointDirection = 0;
   }
   public void HYPE(int P,int MX, int MY){//hyperdrive function
    myPointDirection = P;
    myCenterX = MX;
    myCenterY = MY;
    myXspeed = 0;
    myYspeed = 0;
   }
   public void ACCEL(double s){//accelerate function
     SP.move();
     SP.accelerate(s);
   }
   public void LEFT(){//LEFT function
     SP.turn(-turnspeed);     
   }
   public void RIGHT(){//RIGHT function
     SP.turn(turnspeed);
   }
}

class innerSP extends Spaceship
{  
   innerSP(){
     xCorners = new int[]{18,-20,-15,-20,-25,-21,-25,-20,-15,-20,18,26,18};
     yCorners = new int[]{-5,-15,-10,-6,-7,0,7,6,10,15,5,0,-5};
     myColor = color(4,255,255);
   }
   public void ACCEL(double s){//accelerate function
     SP2.move();
     SP2.accelerate(s);
   }
   public void LEFT(){//LEFT function
     SP2.turn(-turnspeed);     
   }
   public void RIGHT(){//RIGHT function
     SP2.turn(turnspeed);
   }
}
class TH1 extends Spaceship
{ 
   TH1(){     
     xCorners = new int[]{-43,-58,-43,-50,-43,-45,-36,-36,-45,-43,-50,-43,-43};
     yCorners = new int[]{-19,-17,-16,-13,-13,-10,-15,-20,-25,-22,-23,-19,-19};
     myColor = color(232,156,80);  
   }
   public void ACCEL(double s){//accelerate function
     THA.move();
     THA.accelerate(s);
   }
   public void LEFT(){//LEFT function
     THA.turn(-turnspeed);     
   }
   public void RIGHT(){//RIGHT function
     THA.turn(turnspeed);
   }
}
class TH2 extends Spaceship
{  
   TH2(){     
     xCorners = new int[]{-43,-58,-43,-50,-43,-45,-36,-36,-45,-43,-50,-43,-43,-43 };
     yCorners = new int[]{16,17,19,22,21,25,20,15,10,13,12,16,16, };
     myColor = color(232,156,80);     
   }
   public void ACCEL(double s){//accelerate function
     THB.move();
     THB.accelerate(s);
   }
   public void LEFT(){//LEFT function
     THB.turn(-turnspeed);     
   }
   public void RIGHT(){//RIGHT function
     THB.turn(turnspeed);
   }
}
