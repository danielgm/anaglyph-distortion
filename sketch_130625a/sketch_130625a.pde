

PImage left, right;

void setup() {
  size(768, 432);
  noStroke();
  
  left = loadImage("left.jpg");
  right = loadImage("right.jpg");
}

void draw() {
  background(0);
  
  float offset = (width/2 - mouseX) * 0.1;
  
  blendMode(ADD);
  image(left, offset, 0);
  image(right, -offset, 0);
}

