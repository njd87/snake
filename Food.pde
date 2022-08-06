public class Food {
  private int x, y, w, h, x_weight, y_weight;
  
  // generate where the food should be
  public Food(int w_inp, int h_inp) {
    w = w_inp;
    h = h_inp;
    x_weight = w / 50;
    y_weight = h / 50;
    generateFood();
  }
  
  // generate food at random spot on board
  public void generateFood() {
    x = (int) random(0, x_weight) * 50;
    y = (int) random(1, y_weight - 1) * 50; 
  }
  
  public int get_x() {
    return x;
  }
  
  public int get_y() {
    return y;
  }
  
  // draw food
  public void draw() {
    fill(200, 100, 100);
    rect(x, y, 50, 50);
    fill(255, 255, 255);
  }
  
}
