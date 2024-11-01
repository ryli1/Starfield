
//use arrays and not ArrayList for better performance

ArrayList <Particle> particles = new ArrayList <Particle>(); 

int numOfObjects = 5000;
//Particle[] particlez = new Particle[numOfObjects];

void setup() {
  size(700, 600);
  background(255);
  for (int i = 0; i < numOfObjects; i++) {
    particles.add(new Particle());
  }
}

boolean booleanThing = false;
int num = 0;

int midCircleSize = 50;

void draw() {
  System.out.println(particles.size());
  if (num >= particles.size()+10000) { //once enough particles has crossed, replace them
    num = 0;
    replaceParticlez();
    booleanThing = true;
  }
  if (booleanThing == false) {
    background(0);
  }
  for (Particle i : particles) {
    i.show();
    i.move();
  }
  if (booleanThing == true) {
    midCircle(midCircleSize);
  }
}

class Particle {
  double x, y, rotation, speed;
  int mySize;
  color myColor;
  Particle() {
    x = width/2;
    y = height/2;
    rotation = radians((float)Math.random()*360);
    speed = 10;
    mySize = 5;
    myColor = color(255);
  }
  void move() {
    y += Math.sin(rotation)*speed;
    x += Math.cos(rotation)*speed;
    if (x < 0 || x > 700) {
      x = width/2; 
      y = height/2;
      mySize = 1;
      speed = speed/(Math.random()*3);
      num++;
    }
  }
  void show() {
    noStroke();
    fill(myColor);
    ellipse((float)x, (float)y, mySize, mySize);
  }
}

class Oddball extends Particle {
  Oddball(color aColor) {
    x = width/2;
    y = height/2;
    rotation = radians((float)Math.random()*360);
    speed = Math.random()*12+1;
    mySize = 1;
    myColor = aColor;
  }                 
  void move() {
    y += Math.sin(rotation)*speed;
    x += Math.cos(rotation)*speed;
    if (x < 0 || x > 700) {
      x = width/2; 
      y = height/2;
      speed = Math.random()*6+1;
    }
  }
}

void midCircle(int thisSize) {
  fill(0);
  ellipse(width/2, height/2, thisSize, thisSize);
  if(midCircleSize >= 50) { //FIX TIHS PART
    midCircleSize--; 
  }
  else if(midCircleSize <= 25) {
    midCircleSize++;
  }
}

void replaceParticlez() {
  for (int i = 0; i < numOfObjects; i++) {
    int ranNum = (int)(Math.random()*6);
    if (ranNum == 0 || ranNum == 1) {
      //particles.set(i, new Oddball(color(255)));
      particles.add(new Oddball(color(255)));
    } else if (ranNum == 2) {
      particles.set(i, new Oddball(color(#F54040)));
      //particles.add(new Oddball(color(#F54040)));
    } else if (ranNum == 3) {
      particles.set(i, new Oddball(color(#405CF5)));
      //particles.add(new Oddball(color(#405CF5)));
    }
    else { //more likely to choose black
      particles.set(i, new Oddball(color(0)));
    }
  }
}
