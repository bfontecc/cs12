color sinColor;
color cosColor;
color tanColor;

float cosTheta;
float sinTheta;
float tanTheta;

float angle;
float angleChange;

float diameter;
float radius;
float center;

float x;
float y;

void setup() {
  size(400, 500);
  background(255);
  textSize(18);
  sinColor = color(250, 180, 30);
  cosColor = color(150, 30, 30);
  tanColor = color(64, 70, 121);
  angleChange = 3;
  angle = 0.0;
  
  diameter = width * (3.0/4.0);
  radius = diameter / 2.0;
  center = width / 2;
}

void draw() {
  // blank out the last drawing
  background(255);
  // do some trig
  sinTheta = sin(radians(angle));
  cosTheta = cos(radians(angle));
  tanTheta = tan(radians(angle));
  
  drawCircle();
  drawPoint();
  drawSin();
  drawCos();
  drawText();
}

void drawSin() {
  stroke(sinColor);
  line(x, y, x, center);
}

void drawCos() {
  stroke(cosColor);
  line(x, y, center, y);
}

void drawPoint() {
  x = center + (cosTheta * radius);
  // we always subtract y because we are not on cartesian coordinates but pixels
  y = center - (sinTheta * radius);
  noFill();
  ellipse(x, y, 8, 8);
}

void drawCircle() {
  ellipseMode(CENTER);
  noFill();
  stroke(0);
  // draw circle
  ellipse(center, center, diameter, diameter);
  // draw x axis
  line(0, center, width, center);
  // draw y axis
  line(center, 0, center, width);
  fill(0);
  text("x", 20, center - 20);
  text("y", center - 20, 20);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      angle = abs((angle + angleChange) % 360);
    } else if (keyCode == DOWN) {
      angle = (angle - angleChange) % 360;
    } 
  }
  if (angle < 0) {
    angle = 360;
  }
}

void drawText() {
  println(mouseY);
  fill(sinColor);
  text("sin: " + sinTheta, 10, 410);
  fill(cosColor);
  text("cos: " + cosTheta, 10, 440);
  fill(tanColor);
  text("tan: " + tanTheta, 10, 470);
}
