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


//Star vars
Star [] nightSky = new Star[300];
planet [] planets = new planet[10];

//Game vars
boolean mouse = false;


public void setup() 
{
  size(800,800);
  for(int i = 0; i<nightSky.length; i++){
   
    nightSky[i] = new Star();
  }
  for(int i = 0; i<planets.length; i++){
   
    planets[i] = new planet();
  }
}
public void draw() 
{
  background(0);
  for(int i = 0; i<nightSky.length; i++){
    nightSky[i].show(255,255,255);
  }
  for(int i = 0; i<planets.length; i++){
   
    planets[i].show();
  }
  
  SP.show();
  SP.ACCEL(f);
  SP2.show();
  SP2.ACCEL(f);
  THA.ACCEL(f);
  THB.ACCEL(f);
  fill(255,255,255);
  text((float)SP.myCenterX+" = myCenterX",50,10);
  text((float)SP.myCenterY+" = myCenterY",50,30);
  text((float)SP.myXspeed+" = myXspeed",50,50);
  text((float)SP.myYspeed+" = myYspeed",50,70);
  text((float)SP.myPointDirection+" = myPointDirection",50,90);
  Inputs();
}
public void Inputs(){
  if( wisdown == true ){//acceleratwdawde func    
    SP.ACCEL(.05);
    SP2.ACCEL(.05);
    THA.show();
    THA.ACCEL(.05);
    THB.show();
    THB.ACCEL(.05);
    w1 = w1+.001;
    //fill(232,156,80);
    //stroke(245,73,10);
    //ellipse((float)SP.myCenterX-50,(float)SP.myCenterY,50,50);
  }      
  if( aisdown == true ){//LEFT func
    SP.LEFT();
    SP2.LEFT();
    THA.LEFT();
    THB.LEFT();
  }
  if( disdown == true ){//RIGHT func
    SP.RIGHT();
    SP2.RIGHT();
    THA.RIGHT();
    THB.RIGHT();
    }  
}
public void keyPressed(){ 
  if( key == 'q'|| key == 'Q'){//hyperdrive func
    int P = (int)(Math.random()*360); 
    int MX = (int)(Math.random()*width); 
    int MY = (int)(Math.random()*height);
    SP.HYPE(P,MX,MY);
    SP2.HYPE(P,MX,MY);
    THA.HYPE(P,MX,MY);
    THB.HYPE(P,MX,MY);
  }
  if(key == 'w'|| key == 'W'){//acceleratwdawde func    
    wisdown = true;
  }      
  if( key == 'a'|| key == 'A'){//LEFT func
    aisdown = true;
  }
  if( key == 'd'|| key == 'D'){//RIGHT func
    disdown = true;     
  }
  
}
public void keyReleased(){
  if(key == 'w'|| key == 'W'){//acceleratwdawde func    
    wisdown = false;
  }      
  if( key == 'a'|| key == 'A'){//LEFT func
    aisdown = false;
  }
  if( key == 'd'|| key == 'D'){//RIGHT func
    disdown = false;     
  }
  
}
