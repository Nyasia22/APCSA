Ball b; 
PImage img;
int score = 0;
Bar pad; 
void setup() {
 fullScreen();
 b = new Ball(650,100,80,-2,-3);
 pad = new Bar(100,height-height/10, 250, 50);
 img = loadImage("https://upload.wikimedia.org/wikipedia/commons/0/0a/Bisexual_Pride_Flag.png");
 img.resize(width,height);
 

}

void draw(){
 background(img);
 b.Update();
 textSize(150);
 score ++;
 text(score,500,200);
  pad.show();
 
   
  
}

public class Ball {
  private float centerX;
  private float centerY;
  private Float radius;
  private float dx;
  private float dy;
  public Ball( float centerX, float centerY, float radius, float dx, float dy ){
    this.centerX = centerX;
    this.centerY = centerY;
    this.radius = radius;
    this.dx=dx;
    this.dy=dy; 
    
   
  }// ball constructor

 
  public void Update() { 
    circle(centerX,centerY,radius);
    centerX += dx; 
    centerY += dy;
    if( centerX < 0){
      dx = -dx;
    }
    if( centerY < 0){
      dy = -dy;
    }
    if( centerX > width){
      dx = -dx;
    }

     if((centerY > pad.cornerY) && (centerX > pad.cornerX) && (centerX <pad. width + pad.cornerX)){
       dx = -dx;
       dy= -dy;
     }
 }
}
public class Bar{
  private int cornerX;
  private int cornerY;
  private int width;
  private int height;
  Bar(int cornerX,int cornerY,int width,int height){
    this.cornerX = cornerX;
    this.cornerY = cornerY;
    this.width = width;
    this.height = height; 
    
 } // end Bar constructor  
  
  public void show(){
   rect(cornerX,cornerY,width, height); 
   }

}

void mouseMoved()
{
  pad.cornerX=mouseX;  
  
}
