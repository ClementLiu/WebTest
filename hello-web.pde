int account;
float radious;
CircleMove[] array;
boolean press;

void setup() {
  size(512, 512);
  radious=10;
  account = int(width/radious);
  array = new CircleMove[account];
  press = false;
  noFill();
  ellipseMode(CORNER);
  for (int i = 0; i < account; ++i) {
  array[i]=new CircleMove(i,radious);
  }
}

void draw() {
  background(200);
    
      
      for (int i = 0; i < account; ++i) {
        // ellipse(radious*i, radious/2, radious, radious);
        // array[i]=new CircleMove(i,radious);
        // CircleMove a = new CircleMove(i,radious);
        array[i].print();
        array[i].bottom();
        if (press == true) {
        array[i].drop();
      }
      
    }

}

class CircleMove  {
    int numbers;
    float f, fall, speed;
   CircleMove (int i , float radiou ) {
    numbers = i;
    f = radiou;
    speed = 0;
    fall = random(0, 1);
    }
   void print(){
     ellipse(f*numbers, f/2, f, f);
   }
   void bottom (){
      for (int i = 0; i < numbers; ++i) {
        ellipse(f*numbers, f/2+i*f+speed+f, f, f);
      }
   
   }
   void drop(){
      speed += fall*numbers;

   }

}

void mousePressed() {
  press = ! press;
}
