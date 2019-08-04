import java.util.Random;

// Processing has a class for this, but why not?
class Vector2 {
  public float x;
  public float y;
  
  public Vector2(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

// Define constants for screen width, height, and offsets from the edge.
final int SCREEN_WIDTH = 900;
final int SCREEN_HEIGHT = 900;
final int OFFSET = 25;

// Define the vectors that represent the verticies.
final Vector2 leftBottomVertex = new Vector2(OFFSET, SCREEN_HEIGHT - OFFSET);
final Vector2 rightBottomVertex = new Vector2(SCREEN_WIDTH - OFFSET, SCREEN_HEIGHT - OFFSET);
final Vector2 topCenterVertex = new Vector2(SCREEN_WIDTH / 2, OFFSET);

// For programatically generating the triangle and generating random points.
final Vector2[] verticies = {leftBottomVertex, rightBottomVertex, topCenterVertex};

// We'll need to keep a reference to this (no pun intended considering this a reference-type) for the purposes of the midpoint formula.
Vector2 currentPoint;

long iterations = 0;

void settings() {
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
  
  // Starting in the center, although we don't need to.
  currentPoint = new Vector2(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2);
}

// Processing has a class for this too, but, alas, I'm reinventing the wheel. I could probably also use beginShape, endShape, and vertex.
void drawTriangle() {
  for (int i = 0; i < verticies.length; i++) {
    ellipse(verticies[i].x, verticies[i].y, 10, 10);
    
    stroke(255, 255, 255);
    line(verticies[i].x, verticies[i].y, verticies[(i + 1) == verticies.length ? 0 : i + 1].x, verticies[(i + 1) == verticies.length ? 0 : i + 1].y);
  }
}

Vector2 generateRandomPoint() {
  // Generate a random index from which to determine a vertex.
  Random rand = new Random();
  int index = rand.nextInt(3); // inclusive, exclusive [0, 3)
  
  // Determine the target index.
  Vector2 targetVertex = verticies[index];
  
  // Create a new point halfway between the current point and the new one.
  return new Vector2((targetVertex.x + currentPoint.x) / 2, (targetVertex.y + currentPoint.y) / 2);
}

void drawStats() {
  textSize(18);
  
  // Painting a black background over the old text.
  noStroke();
  fill(0, 0, 0);
  rect(0, 0, 300, 50); // It might be better to make an array of rects for optimization purposes.
  
  // Write the statistics.
  fill(255, 255, 255);
  text("Iterations: " + iterations, OFFSET - 5, OFFSET - 5);
  
  // Reset the stroke for the drawing of the points.
  stroke(255, 255, 255);

}

void setup() {
  background(0, 0, 0);
  
  drawTriangle();
}

void draw() {
  // Disolay the current iteration.
  drawStats();
  
  // Generate the new point.
  Vector2 newPoint = generateRandomPoint();
  
  // Draw the new point.
  point(newPoint.x, newPoint.y);
  
  // Set the current point to be this new one.
  currentPoint = newPoint;
  
  iterations++;
}
