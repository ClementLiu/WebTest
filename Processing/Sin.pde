float r;
float distance;
float angle;
float radious;
int pointNumber = 400;
int[] xPoint;
int[] yPoint;
int[] colorP;

void setup() {
  size(512, 512);
  noStroke();

  //array
  xPoint = new int[pointNumber];
  yPoint = new int[pointNumber];
  colorP = new int[pointNumber];


  r=0.5;
  distance = 80;
  radious=40;
  angle = 0;
  smooth();
  translate(width/2, height/2);
  for (int i = 0; i < pointNumber;i++) {
      distance +=10*sin(angle*6);
      angle += PI /180*3;
      // point(distance*cos(angle)*r,distance*sin(angle)*r);
      // point(distance*cos(angle), distance*sin(angle));

      //array attribute
      colorP[i]= int(random(0, 255));
      // println("colorP[i]: "+colorP[i]);
      fill(colorP[i]);
      xPoint[i]=int(distance*cos(angle));
      yPoint[i]=int(distance*sin(angle));

      // original
      // ellipse(distance*cos(angle), distance*sin(angle), radious,radious);
      ellipse(xPoint[i], yPoint[i], radious,radious);
      // point(cos(angle)*10, sin(angle)*10);
      // ellipse(distance*cos(angle)*r, distance*sin(angle)*r, radious, radious);
      }


     //made it array function!!!!
   // nextArray(xPoint);
}
void draw(){
  background(255);
  println("angle: "+angle);
  translate(width/2, height/2);
  angle += PI /180;
  rotate(angle);
  for (int i = 0; i < pointNumber;i++) {
  fill(colorP[i]);
  ellipse(xPoint[i], yPoint[i], radious,radious);

}
  xPoint = nextArray(xPoint);
  yPoint = nextArray(yPoint);
  // colorP = nextArray(colorP);
}
void keyPressed() {
  for (int o : xPoint) {
    println("o: "+o);
  }
  }

int[] nextArray(int[] nextArray){
  int first = nextArray[0];

  for (int i = 0; i < nextArray.length-1; i++) {
    // println("nextArray[i]: "+nextArray[i]);
    nextArray[i]=nextArray[i+1];
    // println("nextArray: "+i+"dengyu"+nextArray[i]);
  }
  nextArray[nextArray.length-1] = first;
  return nextArray;
}

// void draw()