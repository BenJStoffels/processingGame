Flappy flappy;
float start = 0;
int score = 0;
float breed = 2;

void setup() {
  size(600, 300);
  flappy = new Flappy();
}

void draw() {
  background(246);
  textSize(32);
  fill(0);
  text(score,50,50);
  fill(0, 58, 245);
  noStroke();
  flappy.show();
  strokeWeight(2);
  stroke(9);
  noFill();
  beginShape();
  for (float x = 0; x <= width; x += 0.01) {
    float angle = map(x + start, 0, breed * width, 0, PI);
    float n = map(noise(angle),0,1,-50,50);
    float s = map(sin(angle), -1, 1, 20, height-20);
    float y = s + n;
    vertex(x, y);
  }
  endShape();
  start += 5;
  if (flappy.dies()){
    noLoop();
  }
}

void mousePressed() {
  flappy.move();
}