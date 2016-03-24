/** Obsidian ROV Water Generator
 *
 * By Coleman Christy
 *
 * Based on Noise Wave
 * by Daniel Shiffman.  
 * 
 * Using Perlin Noise to generate a virtual swimming pool.
 */

float yoff = 0.0;        // 2nd dimension of perlin noise
void setup() {
  size(1000,90,FX2D);//x,y dimentions of window, you can change these
  fill(#1976d2);
  stroke(#509DE8);
  strokeWeight(1);
}

void draw() {
  background(255);
  // We are going to draw a polygon out of the wave points
  beginShape(); 

  float xoff = 0;       // Option #1: 2D Noise
  // float xoff = yoff; // Option #2: 1D Noise

  // Iterate over horizontal pixels
  for (float x = 0; x <= width + 15; x += 15) {
    // Calculate a y value according to noise, map to 
    float y = map(noise(xoff, yoff), 0, 1, 0, height); // Option #1: 2D Noise
    // float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise

    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff += 0.03;
  }
  // increment y dimension for noise
  yoff += 0.009;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}