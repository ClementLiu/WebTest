float jumpPoint;
float radious;
int account;
float stepSpeed;
float maxSpeed;
int[] colorEllipse;

void setup() {
	size(512, 900);


	maxSpeed = 8;
	jumpPoint = 0;
	radious = 50;
	account = int(width / radious)+1;
	colorEllipse = new int[account];
	println(colorEllipse.length);
	println("account: "+account);
	for (int i = 0; i < account; i++) {
	colorEllipse[i]= int(255/account*i);	
	println("i: "+i);
	}
	println("test: ");
	stepSpeed = maxSpeed;//max speed
}

void draw() {
	for (int i = 0; i < account; i++) {

	fill(colorEllipse[i]);
	ellipse(i*radious, jumpPoint, radious, radious);



}

	jumpPoint+=stepSpeed;
	stepSpeed -= 0.6;
	if (stepSpeed < 2) {
		stepSpeed = maxSpeed;
		colorEllipse = nextArray(colorEllipse);
	}
}

void  keyPressed() {
	stepSpeed=20;
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
