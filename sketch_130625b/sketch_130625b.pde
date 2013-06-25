
int radius = 100;
PImage left, right;

void setup() {
  size(768, 432);
  noStroke();
  
  // Load images for left and right eyes and load pixels for reading.
  left = loadImage("left.jpg");
  left.loadPixels();
  
  right = loadImage("right.jpg");
  right.loadPixels();
}

void draw() {
  background(0);
  
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      // Horizontal offset based on distance from mouse.
      int dx = mouseX - x;
      int dy = mouseY - y;
      float d = sqrt(dx * dx + dy * dy);
      int offset = (int)(max(radius - d, 0) * 0.1);
      
      // Add the left and right images with offset sample coordinates.
      pixels[y * width + x] = combineColors(
        left.pixels[y * width + min(x + offset, width - 1)],
        right.pixels[y * width + max(x - offset, 0)]);
    }
  }
  updatePixels();
  
  // Draw circle around affected area.
  noFill();
  stroke(255);
  ellipse(mouseX, mouseY, radius*2, radius*2);
}

color combineColors(color a, color b) {
  // Additive blend.
  return color(
    min(red(a) + red(b), 255),
    min(green(a) + green(b), 255),
    min(blue(a) + blue(b), 255));
}
