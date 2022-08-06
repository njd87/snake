// class for drawing and keeping info about snake

public class Snake {
  // x, y -> current position
  // frame -> current frame game is running
  // size -> current size of snake
  // history -> previous positions of snake head
  
  private int x, y, frame, size, w, h;
  private Point vel = new Point(50, 0);
  private ArrayList<Point> history = new ArrayList<Point>();
  
  // constructor function
  public Snake(int x_inp, int y_inp, int w_inp, int h_inp) {
    x = x_inp;
    y = y_inp;
    frame = 0;
    size = 1;
    w = w_inp;
    h = h_inp;
    history.add(new Point(x_inp, y_inp));
    history.add(new Point(0, 0));
  }
  
  // given current velocity, update snake position
  public void update() {
    frame++;
    x += vel.get_x();
    y += vel.get_y();
    // check to make sure snake head is within boundaries
    if (x < 0 || x >= w - 100 || y < 0 || y >= h - 100) {
      exit();
    }
    
    // make sure snake didn't hit itself
    for (int i = size; i > 0; i--) {
      if (history.get(i).get_x() == x && history.get(i).get_y() == y) {
        exit();
      }
      
      // move history
      history.set(i, history.get(i-1));
     
    }
    history.set(0, new Point(x, y));
    println(history.size());
  }
  
  // update velocity
  public void change_velocity(int xvel, int yvel) {
    vel = new Point(xvel, yvel);
  }
  
  
  // eat food if it can
  public void eat(Food f) {
    if (x == f.get_x() && y == f.get_y()) {
      size++;
      history.add(new Point(300, 300));
      f.generateFood();
    }
  }
  
  // draw the snake
  public void draw() {
    for (int i = 0; i < size; i++) {
      rect(history.get(i).get_x(), history.get(i).get_y(), 50, 50);
    }
  }
  
}
