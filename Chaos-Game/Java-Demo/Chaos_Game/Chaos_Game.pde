// Processing has a class for this, but why not?
class Vector2 {
  public float x;
  public float y;
  
  public Vector2(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

final int SCREEN_WIDTH = 900;
final int SCREEN_HEIGHT = 900;
final int OFFSET = 25;

final Vector2 leftBottomVertex = new Vector2(OFFSET, SCREEN_HEIGHT - OFFSET);
final Vector2 rightBottomVertex = new Vector2(SCREEN_WIDTH - OFFSET, SCREEN_HEIGHT - OFFSET);
final Vector2 topCenterVertex = new Vector2(SCREEN_WIDTH / 2, OFFSET);

final Vector2[] verticies = {leftBottomVertex, rightBottomVertex, topCenterVertex};

void settings() {
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
}

// Processing has a class for this too, but, alas, I'm reinventing the wheel. I could probably also use beginShape, endShape, and vertex.
void drawTriangle() {
  for (int i = 0; i < verticies.length; i++) {
    ellipse(verticies[i].x, verticies[i].y, 10, 10);
    
    stroke(255, 255, 255);
    line(verticies[i].x, verticies[i].y, verticies[(i + 1) == verticies.length ? 0 : i + 1].x, verticies[(i + 1) == verticies.length ? 0 : i + 1].y);
  }
}

void setup() {
  background(0, 0, 0);
  
  drawTriangle();
}

void draw() {
  
}
