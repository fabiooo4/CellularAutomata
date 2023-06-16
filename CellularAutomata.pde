CA ca;

void setup() {
  fullScreen();
  frameRate(60);
  background(255);
  int[] rule222 = {0,1,1,1,1,0,1,1};
  int[] rule190 = {0,1,1,1,1,1,0,1}; 
  int[] rule30 = {0,1,1,1,1,0,0,0};
  int[] rule110 = {0,1,1,1,0,1,1,0};
  
  ca = new CA(rule110);
}

void draw() {
  ca.display();
  ca.generate();
}
