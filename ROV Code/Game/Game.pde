/**
 * Move Eye. 
 * by Simon Greenwold.
 * 
 * The camera lifts up (controlled by mouseY) while looking at the same point.
 */
float camx = PI;
int camy;
int camz = 220;
int maxy = 4;
float maxx = 0.01;
int maxz = 20;
float xspd;
int yspd = 0;
int zspd = 0;
void setup() {
  size(900, 500, P3D);
  beginCamera();
  
}
void draw() {
  lights();
  background(0);
  println(camx);
  // Change height of the camera with mouseY
  camera(10, camy, camz, // eyeX, eyeY, eyeZ
    camz * tan((camx)), camy, camz - 100, // centerX, centerY, centerZ
    0.0, 1.0, 0.0); // upX, upY, upZ
fill(255);
noStroke();

  box(10);
  translate(500,100,100);
  fill(255,100,100);
 box(90);
 translate(-900,-300,1000);
 fill(50,50,200);
 box(30,80,60);
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == UP) {
        if (abs(zspd) != maxz) {
          zspd += 1;
        }
          camz -= zspd;
        
      } else if (keyCode == DOWN) {
        if (abs(zspd) != maxz) {
          zspd -= 1;
        }
          camz -= zspd;
      }
    }
     else {
      switch(key) {
        case('w'):
        camy -= maxy;
        break;
        case('s'):
        camy += maxy;
        break;
        case('a'):
        if(camx > HALF_PI + 0.1){
          
        camx -= 0.01;
        }
        break;
        case('d'):
        if(camx < HALF_PI + PI - 0.1){
        camx += 0.01;
        }
        break;
      }
    }
  }
  else{
   zspd = 0;
  }
}