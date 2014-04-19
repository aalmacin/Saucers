static final int MAIN_WIDTH = 800;
static final int MAIN_HEIGHT = 500;
static final int DRAWING_FRAME_LIMIT = 100;

int frames = 0;
SaucerHolder saucers = new SaucerHolder();

void setup() {
  size(MAIN_WIDTH, MAIN_HEIGHT);
}

void mouseClicked() {
  saucers.reset();
  frames = 0;
}

void draw() {
  if (++frames < DRAWING_FRAME_LIMIT) {
    background(255);
    saucers.draw();
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
  
  public void draw() {
    for (int i=0; i<SAUCER_COUNT; i++) {
      this.get(i).draw();
    }
  }
}

private class Saucer {
  public final color DESIGN_1_OUTSIDE_BORDER_COLOUR = color(213, 22, 152);
  public final color DESIGN_1_INSIDE_BORDER_COLOUR = color(255, 247, 191);
  
  private int currentSize;
  private int growthSize;
  private int x;
  private int y;
  public Saucer() {
    init();
  }
  
  public void init() {
    this.currentSize = 0;
    
    this.growthSize = (int) random(1, 3);
    this.x = (int) random(0, MAIN_WIDTH + this.growthSize);
    this.y = (int) random(0, MAIN_HEIGHT + this.growthSize);
  }
  
  public void draw() {
    this.currentSize += this.growthSize;
    noStroke();
    fill(125, 125, 125, 125);
    ellipse(this.x + 5, this.y + 5, this.currentSize, this.currentSize);
    
    fill(213, 22, 152);
    ellipse(this.x, this.y, this.currentSize, this.currentSize);
    
  }
  
  public void reset() {
    init();
  }
}
