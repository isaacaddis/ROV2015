/**
 * Move Eye. 
 * by Simon Greenwold.
 * 
 * The camera lifts up (controlled by mouseY) while looking at the same point.
 */
int camx;
int camy;
int camz;
int pointx;
void setup() {
  fullScreen(P3D);
  fill(0, 0, 255);
}

void draw() {
  lights();
  background(255);

  // Change height of the camera with mouseY
  camera(camx, camy, camz, // eyeX, eyeY, eyeZ
    0.0 ,mouseY ,200.0, // centerX, centerY, centerZ
    0.0, 0.0,0.0); // upX, upY, upZ

  noStroke();
  box(90);
  stroke(200, 0, 0);
  line(-100, 0, 0, 100, 0, 0);
  line(0, -100, 0, 0, 100, 0);
  line(0, 0, -100, 0, 0, 100);
  if (keyPressed) {
    if (key == CODED){
     if(keyCode == UP){
      camz += 1;
     }
      if(keyCode == DOWN){
      camz -= 1;
      }
     }
    
    switch(key) {
      case('w'):
      camy += 1;
      break;
      case('s'):
      camy -= 1;
      break;
      case('a'):
      camx += 1;
      break;
      case('d'):
      camx -= 1;
      break;
    }
  }
}