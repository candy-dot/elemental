import processing.sound.*;
SoundFile music;
PImage img;

int circleSize = 300;
int shrinkOrGrow = 1;
int phase = 4000;  // phase duration        
int startMillis;


void setup() {
    music = new SoundFile(this, "audio.mp3");
    music.play();
    img = loadImage("bg.jpg");
    img.resize(720, 1280);
    
    size(720, 1280);           // canvas
    frameRate(30);             // 
    smooth();                  // smooth edges
    noStroke();                // no border
    
    startMillis = millis();    // record start time
}

void draw() {
    image(img,0,0);

    // concentric circles
    for (int i = 300; i > 0; i -= 45) {
        fill(240, 220, 200, 98); 
        ellipse(width / 2, height / 2, circleSize - i, circleSize - i);
    }

    // timing for circle expanding/shrinking
    if (millis() - startMillis >= phase) { 
        shrinkOrGrow *= -1; 
        startMillis = millis(); // restart timer
    }

    // changing circlesize depending on direction
    circleSize += shrinkOrGrow * 2;

    // limit circlesize
    circleSize = constrain(circleSize, 100, 700); 
    
}
