//domain expansion moment
// infinite void

ArrayList <Particle> particles = new ArrayList <Particle>(); 

int numOfObjects = 100;
Particle[] particlez = new Particle[numOfObjects];

void setup() {
  frameRate(240);
  size(700, 600);
  background(0);
  for (int i = 0; i < 5000; i++) {
    particles.add(i, new Particle());
  }
}

boolean booleanThing = false;

void draw() {
  background(0);
  for (Particle i : particles) {
    i.show();
    i.move();
  }
  midCircle(booleanThing);
}

class Particle {
  double x, y, rotation, speed;
  Particle() {
    x = 350;
    y = 300;
    rotation = radians((float)Math.random()*360);
    speed = 10;
  }

  void move() {
    y += Math.sin(rotation)*speed;
    x += Math.cos(rotation)*speed;
    if (x < 0 || x > 700) {
      x = width/2; 
      y = height/2;
      speed = Math.random()*5+1;
      booleanThing = true;
    }
  }

  void show() {
    noStroke();
    fill(255);
    ellipse((float)x, (float)y, 5, 5);
  }
}

class Oddball extends Particle {
  Oddball() {
    super();
  }                                     

  void move() {
  }

  void show() {
  }
}

void midCircle(boolean trueFalse) {
  if (trueFalse == true) {
    fill(0);
    stroke(255);
    ellipse(width/2, height/2, 250, 250);
  }
}
