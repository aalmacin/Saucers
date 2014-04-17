// Constants
final int STARS_COUNT = 500;
final int MAIN_WIDTH = 800;
final int MAIN_HEIGHT = 500;

// Variables
Star[] stars = new Star[STARS_COUNT];

void setup() {
  background(0);
  size(MAIN_WIDTH, MAIN_HEIGHT);
  
  for (int i=0; i < STARS_COUNT; i++) {
    int x = (int)random(MAIN_WIDTH);
    int y = (int)random(MAIN_HEIGHT);
    stars[i] = new Star(x, y, (int)random(Star.SIZE));
  }
}

void draw() {
  if (millis() % 9 == 0) {
    fill(0);
    rect(0, 0, MAIN_WIDTH, MAIN_HEIGHT);
    for (int i=0; i < STARS_COUNT; i++) {
      stars[i].updateCurrentSize();
      fill(255);
      noStroke();
      ellipse(stars[i].getX(), stars[i].getY(), stars[i].getCurrentSize(), stars[i].getCurrentSize());
    }
  }
}

private class Star {
  public static final int SIZE = 5;
  private int x;
  private int y;
  private int currentSize;
  public Star(int x, int y, int startingSize) {
    this.x = x;
    this.y = y;
    this.currentSize = startingSize;
  }
  
  public int getX() {
    return this.x;
  }
  
  public int getY() {
    return this.y;
  }
  
  public int getCurrentSize() {
    return this.currentSize;
  }
  
  public void updateCurrentSize() {
    if (++this.currentSize == Star.SIZE) {
        setCurrentSize(0);
      }
  }
  
  public void setCurrentSize(int currentSize) {
    this.currentSize = currentSize;
  }
}
