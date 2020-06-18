import controlP5.*;

ControlP5 cp5;
float angle = PI / 4;
float branch1 = 0.75;
float branch2 = 0.75;
int branch_count = 6;


void setup() {
  size(800, 600);  
  stroke(255);
  cp5 = new ControlP5(this);
  cp5.addSlider("angle").setPosition(40, 40).setRange(PI, PI/48);
  cp5.addSlider("branch1").setPosition(40, 55).setRange(0.1, 1);
  cp5.addSlider("branch2").setPosition(40, 70).setRange(0.1, 1);
  cp5.addSlider("branch_count").setPosition(40, 85).setRange(0, 11);
}

void draw() {
  background(52);
  pushMatrix();
  translate(width/2, height-100);
  line(0, 0, 0, 200);
  branch(50, 0);
  popMatrix();
}

void branch(float len, int order) {
  if (order > branch_count)
    return;
  pushMatrix();
  rotate(angle);
  line(0, 0, 0, -len);
  translate(0, -len);
  branch(len * branch1, order + 1);
  popMatrix();

  pushMatrix();
  rotate(-angle);
  line(0, 0, 0, -len);
  translate(0, -len);
  branch(len * branch2, order + 1);
  popMatrix();
}
