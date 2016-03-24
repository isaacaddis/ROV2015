float dir;
int camy;
float camx = 10;
float camz = 220;
void setup() {
  size(900, 500, P3D);
  fill(204);
  sphereDetail(14);
  frameRate(75);
  fill(#1A0064);
}

void draw() {

  lights();
  pointLight(255, 255, 255, 10, camy, camz);
  background(#65979B);

  // Change height of the camera with mouseY
  camera(camx, camy, camz, // eyeX, eyeY, eyeZ
  camz * tan(dir) + camx, camy, camz - 100, // centerX, centerY, centerZ
  0.0, 1.0, 0.0); // upX, upY, upZ

  noStroke();
  rect(30, 200, 30, 100);
  box(80, 80, 200);
  translate(200, 200, 200);
  sphere(50);
  beginShape();
  vertex(100, -30, 500);
  vertex(130, -30, 500);
  vertex(130, -60, 500);
  vertex(100, -60, 500);
  endShape(CLOSE);
  translate(0, 0, 0);
  beginShape();
  vertex(-4000, 500, 4000);
  vertex(-4000, 500, -4000);
  vertex(4000, 500, -4000);
  vertex(4000, 500, 4000);
  endShape(CLOSE);
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == UP) {
        camy -= 2;
      }
      else if (keyCode == DOWN) {
        camy += 2;
      }
    }
    else {
      switch(key) {
        case('w'):
        camx += (dir * 5);

        if (1/dir > 30) {
          camz -= 6;
        }
        else {
          camz -= abs((1/(5 * dir)));
        }
        break;
        case('s'):
        camx -= (dir * 5);

        if (1/dir > 30) {
          camz += 6;
        }
        else {
          camz += abs((1/(5 * dir)));
        }
        break;
        case('a'):
        if (dir >= -1) {
          dir -= 0.01;
        }
        break;
        case('d'):
        if (dir <= 1) {
        dir += 0.01;
        }
        break;
      }
    }
  }
}

