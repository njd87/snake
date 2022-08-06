int w = 1000;
int h = 1000;
int x = 5;
Snake s = new Snake(w / 4, h / 2, w, h);
Food f = new Food(900, 900);

void setup() {
  size(900, 900);
  frameRate(10);
  background(51);
  f.generateFood();
}

void draw() {
  s.eat(f);
  background(51);
  s.update();
  s.draw();
  f.draw();
}

void keyPressed() {
  if(keyCode==UP){
    s.change_velocity(0, -50);
  }
if(keyCode==DOWN){
    s.change_velocity(0, 50);
  }
if(keyCode==LEFT){
    s.change_velocity(-50, 0);
  }
if(keyCode==RIGHT){
    s.change_velocity(50, 0);
  }
}
