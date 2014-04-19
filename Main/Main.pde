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
  public final int DESIGN_1 = 1;
  public final color DESIGN_1_OUTSIDE_BORDER_COLOUR = color(213, 22, 152);
  public final color DESIGN_1_INSIDE_BORDER_COLOUR = color(255, 247, 191);
  public final color DESIGN_1_FILL = color(251, 240, 2);
  
  public final int DESIGN_2 = 2;
  public final color DESIGN_2_OUTSIDE_BORDER_COLOUR = color(255, 247, 191);
  public final color DESIGN_2_INSIDE_BORDER_COLOUR = color(251, 240, 2);
  public final color DESIGN_2_FILL = color(0, 204, 67);
  
  public final int DESIGN_3 = 3;
  public final color DESIGN_3_BORDER_COLOUR = color(160, 15, 144);
  public final color DESIGN_3_FILL_1 = color(254, 247, 169);
  public final color DESIGN_3_FILL_2 = color(255, 5, 0);
  public final color DESIGN_3_FILL_3 = color(252, 253, 255);
  public final color DESIGN_3_FILL_4 = color(255, 1, 255);
  
  public final int DESIGN_4 = 4;
  public final int DESIGN_5 = 5;
  
  private int currentSize;
  private int growthSize;
  private int designType;
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
    
    this.designType = (int) random(1, 5);
  }
  
  public void draw() {
    int shadowPosition = this.currentSize / 18;
    
    //noStroke();
    //fill(125, 125, 125, 125);
    //ellipse(this.x + shadowPosition, this.y + shadowPosition, this.currentSize + shadowPosition, this.currentSize + shadowPosition);
    switch (this.designType) {
      case DESIGN_1:
        drawDesign1();
        break;
      case DESIGN_2:
        drawDesign2();
        break;
      case DESIGN_3:
        drawDesign3();
        break;
      case DESIGN_4:
        drawDesign4();
        break;
      case DESIGN_5:
        drawDesign5();
        break;
    }
  }
  
  private void drawDesign1() {
    this.currentSize += this.growthSize;
    int strokeThickness = this.currentSize / 10;
    int fillSize = this.currentSize - (strokeThickness * 3);
    
    stroke(DESIGN_1_OUTSIDE_BORDER_COLOUR);
    strokeWeight(strokeThickness);
    fill(DESIGN_1_INSIDE_BORDER_COLOUR);
    ellipse(this.x, this.y, this.currentSize, this.currentSize);
    
    noStroke();
    fill(DESIGN_1_FILL);
    ellipse(this.x, this.y, fillSize, fillSize);
  }
  
  private void drawDesign2() {
    this.currentSize += this.growthSize;
    int strokeThickness = this.currentSize / 10;
    int fillSize = this.currentSize / 2;
    
    stroke(DESIGN_2_OUTSIDE_BORDER_COLOUR);
    strokeWeight(strokeThickness);
    fill(DESIGN_2_INSIDE_BORDER_COLOUR);
    ellipse(this.x, this.y, this.currentSize, this.currentSize);
    
    noStroke();
    fill(DESIGN_2_FILL);
    ellipse(this.x, this.y, fillSize, fillSize);
  }
  
  private void drawDesign3() {
    this.currentSize += this.growthSize;
    int drawSize = this.currentSize;
    int decreaseSize = (int) drawSize / 6;
    
    noStroke();
    fill(DESIGN_3_BORDER_COLOUR);
    ellipse(this.x, this.y, drawSize, drawSize);
    
    drawSize -= decreaseSize;
    fill(DESIGN_3_FILL_1);
    ellipse(this.x, this.y, drawSize, drawSize);
    
    drawSize -= decreaseSize;
    fill(DESIGN_3_FILL_2);
    ellipse(this.x, this.y, drawSize, drawSize);
    
    drawSize -= decreaseSize;
    fill(DESIGN_3_FILL_3);
    ellipse(this.x, this.y, drawSize, drawSize);
    
    drawSize -= decreaseSize;
    fill(DESIGN_3_FILL_4);
    ellipse(this.x, this.y, drawSize, drawSize);
  }
  
  private void drawDesign4() {
  }
  
  private void drawDesign5() {
  }
  
  public void reset() {
    init();
  }
}
