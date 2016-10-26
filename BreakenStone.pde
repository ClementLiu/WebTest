//ArrayList<Stone> stones = new ArrayList<Stone>();
int cols;
int rows;
Stone[][] stones ;
Ball ba;
Board board;
int testHit;
//v1 = new PVector(40, 20);




void setup() {
	size(400, 500);
	noStroke();
	ba = new Ball();
	board = new Board(width/2);
	cols = width;
	rows = 150 ;
	stones = new Stone[cols][rows];
	
	rectMode(CENTER);
	colorMode(HSB, cols, rows, 100);
	for (int i=0; i < cols; i++) {
	for (int x=0; x < rows; x++) {

		PVector tempP = new PVector(i, x);

		color tempC = color(i, x, 80);


		// Stone stones[i][x] = new Stone(tempP, tempC);
		stones[i][x] = new Stone(tempP, tempC);


		//stones[i][x].display();
	}}
	//now

}

void draw() {
	background(0);
	ba.ballRun();
	board.workBoard(mouseX);
	colorMode(HSB, cols, rows, 100);
	for (int i=0; i < cols; i++) {
	for (int x=0; x < rows; x++) {
		// fill(stones[i][x].cStone);
		stones[i][x].display();
		// println("stones[i][x].x: "+stones[i][x].x);

		// float tempDistancX = dist(stones[i][x].points.x, stones[i][x].points.y, mouseX, mouseY);
		
// hit
		// float tempDistancX = dist(stones[i][x].points.x, stones[i][x].points.y, ba.position.x, ba.position.y);

		// if (tempDistancX < 2) {
		// 	stones[i][x].move();
		// }

		testHit = hitpoint(stones[i][x].points,ba.position);
		if (testHit == 1) {
			stones[i][x].move();
		}
//hit
		if (stones[i][x].direction == -1) {
			// stones[i][x].x +=1;
			// stones[i][x].points.y +=5;

			stones[i][x].movenow();
			stones[i][x].checkPoint();
			for (int y=0; y < rows; y++) {
				int testHit1 = hitpoint(stones[i][x].points,stones[i][y].points);
			if (testHit1 == 1) {
				if (stones[i][y].direction ==1) {
					stones[i][y].move();
					stones[i][x].directionY =1;
				}
			

		}

			}

			
		}
	}}
	ba.checkPoint();
}


class Stone  {
 	 float x;
 	 float y;
 	 PVector points;
 	 float speed;
 	 float xDest;
 	 float yDest;
 	 int direction;
 	 float dia;
 	 color cStone ;
 	 int directionY;
 	 int directionX;

	 Stone (PVector p, color c) {

		x = p.x;
		points = p;
		y = p.y;
		cStone= c;
		dia = 1;
		directionY = 1;
		direction = 1;


	}
	void display(){
		colorMode(HSB, cols, rows, 100);
		fill(cStone);
		noStroke();
		rect(points.x, points.y, dia, dia);
		// point(x, y, z);
	}

	void move(){
		direction = -1;
	}
	void movenow(){
		points.y += 4*directionY;

	}
	void checkPoint(){
		if (points.x > width) {
			directionX = -1;
			
		}
		if (points.x < 0) {
			directionX = 1;
			
		}

		if (points.y > height && points.x < mouseX+10 && points.x > mouseX -10 ) {
			directionY = -1;
			
		}
		if (points.y < 0) {
			directionY = 1;
			
		}
	}

}


// ball
class Ball {
	PVector position;
	float angle;
	float distance;
	int directionX;
	int directionY;

	 Ball () {
	 	position = new PVector(width/2, height);
		angle = random(-PI/2, 0);
		distance = 4;
		directionX = 1;
		directionY = 1;
	}
	void ballRun(){
		noStroke();
		// colorMode(RGB);
		fill(255);
		position.x += distance * cos(angle) * directionX;
		position.y += distance * sin(angle) * directionY;
		ellipse(position.x, position.y, 2, 2);

	}
	void checkPoint(){
		if (position.x > width) {
			directionX = -1;
			
		}
		if (position.x < 0) {
			directionX = 1;
			
		}
		if (position.y > height) {
			directionY = 1;
			
		}
		if (position.y < 0) {
			directionY = -1;
			
		}
	}

}

class Board {
	int leng;
	int hei;
	float x,y;
	public Board (float xImport) {
		x = xImport;
		y = height;
		leng = 20;
		hei = 10;
		
	}

	void workBoard(float mouse){
		x = mouse;
		rectMode(CENTER);
		// colorMode(RGB);
		fill(255);
		strokeWeight(1);
		stroke(0);
		rect(x, y, leng, hei,1);
	}

}

int hitpoint(PVector bal, PVector sto) {
	float tempDistanc = dist(bal.x, bal.y, sto.x, sto.y);
	int test =0;
		if (tempDistanc < 1) {
			test =1;
			
		}
		return test;
	
}
