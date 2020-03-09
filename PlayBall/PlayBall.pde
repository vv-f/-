float x = 100;
float y = 100;
float xspeed = 2.5;
float yspeed = 2;
float color1=127;
float color2=127;
float color3=127;
ArrayList<Ball> balls;
int ballWidth = 48;
float C1=0;
float C2=255;
float C3=0;
PFont font;
void setup() {
  size(640, 360);
  font = createFont("YuGo-Bold",30); 
  balls = new ArrayList<Ball>(); 
   
}


void draw() {
  background(0);
  textFont(font, 100);
  fill(255,255,0);
  text("玩球", 230,200);
  stroke(255, 0, 255);
  strokeWeight(10);
  fill(color1, color2, color3);
  ellipse(x, y, 48, 48);
  x = x + xspeed;
  y = y + yspeed;
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }
  fill(C1,C2,C3);
  for (int i = balls.size()-1; i >= 0; i--) { 
    Ball ball = balls.get(i);
    ball.move();
    ball.display();
    if (ball.finished()) {
      balls.remove(i);}
    } 
 }
void mousePressed() {
   balls.add(new Ball(mouseX, mouseY, ballWidth));
  
  if (x==0) {
    x=200;} else {
    x=mouseX;
  if (y==0) {
    y=200;} else {
    y=mouseY;}
  }
  if (color1==color2) {
    color1=random(255);
    color2=random(255);
    color3=random(255);
  } else {
    color1=random(255);
    color2=color1;
    color3=color2;}
  if (C2<225){
    C2=255;}else{
      C2=0;
    C1=255;}
    
}
class Ball {

  float x;
  float y;
  float speed;
  float Yspeed;
  float w;
  float life = random(50,300);

  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 3.5;
    Yspeed = 4;
    C1=0;
    C3=0;
  }

  void move() {
    y = y + Yspeed;
    x = x + speed;
    if ((x>width)||(x<0)) {
      speed=speed*-1;
    }
    if ((y>height)||(y<0)) {
      Yspeed=Yspeed*-1;
    }
  }  

  boolean finished() {
    life--;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    ellipse(x, y, w, w);
  }
}
