static final int MAIN_WIDTH = 800;
static final int MAIN_HEIGHT = 500;

SaucerHolder saucers = new SaucerHolder();

void setup() {
  size(MAIN_WIDTH, MAIN_HEIGHT);
  
  
}

void mouseClicked() {
  saucers.reset();
}

int frames = 0;
void draw() {
  background(255);
  if (++frames < 4) {
    
  }
}

private class SaucerHolder extends ArrayList<Saucer> {
  static final int SAUCER_COUNT = 20;
  public SaucerHolder() {
    for (int i=0; i<SAUCER_COUNT; i++) {
      this.add(new Saucer());
    }
  }
  
  public void reset() {
    for (int i=0; i<SAUCER_COUNT; i++) {
      this.get(i).reset();
    }
  }
}

private class Saucer {
  private final int MAX_SIZE;
  
  public final color DESIGN_1_OUTSIDE_BORDER_COLOUR = color(213, 22, 152);
  public final color DESIGN_1_INSIDE_BORDER_COLOUR = color(255, 247, 191);
  
  public Saucer() {
    MAX_SIZE = (int) random(50, 400);
  }
  
  public void draw() {
  }
  
  public void reset() {
    println("HERE" + second());
  }
}
