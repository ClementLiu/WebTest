// ArrayList<Float> pointS;

pointS[] test;

void setup() {
	strokeWeight(4);
	size(900, 900);
  // pointS = new ArrayList<Float>();
  test = new pointS[10];
  for (int i = 0; i < test.length; i++) {
  pointS temp  = new pointS(random(10, width-10), random(10, height-10));
  test[i] =temp;
  }
}

void draw() {
	background(255);
  for (int i = 0; i < test.length; i++) {
    test[i].display();
    test[i].reduce();
  
	}
}

class pointS{
  float radious;
  float x , y;
  pointS(float positionX, float positionY ){
    x = positionX;
    y = positionY;
    radious = 20;
  }
  void display() {
    ellipse(x, y, radious, radious);
  }
  void reduce(){
    
    if (radious >2) {
    	radious -= 1;
    }
  }
}