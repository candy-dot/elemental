import processing.sound.*;    // import processing sound library (McCaffrey, 2020, 1:30-5:20) 
SoundFile music;              // declare soundfile object to use for background music (McCaffrey, 2020, 1:30-5:20) 
PImage img;                   // declare image object to use for background image (Rachel Menzies, 2020, 0:44-3:42)

int circleSize = 300;         // declare variable for size of the circles, assigning initial value of 300
int shrinkOrGrow = 1;         // declare variable for growth of the circles, assigning value of 1 (Vantomme, 2007, 'The full code' section)
int phase = 4000;             // declare variable for duration of each phase, assigning value of 4000 milliseconds (4 seconds)   
int startMillis;              // declare variable to record start time for each phase


void setup() {                
    music = new SoundFile(this, "audio.mp3"); // load audio file for background music (McCaffrey, 2020, 1:30-5:20) 
    music.play();                             // play audio (McCaffrey, 2020, 1:30-5:20) 
    img = loadImage("bg.jpg");                // load image for background
    img.resize(720, 1280);                    // resize image to match canvas size 
    
    size(720, 1280);           // set canvas dimensions: 720px width, 1290 px height
    frameRate(30);             // set 30 fps
    smooth();                  // smoothen edges for shapes
    noStroke();                // no border for shapes
    
    startMillis = millis();    // record start time for phases (UKHeliBob, 2017)
}

void draw() {
    image(img,0,0);            // draw background image on canvas (Rachel Menzies, 2020, 0:44-3:42)

    // concentric circles
    for (int i = 300; i > 0; i -= 45) {                                    // for loop: setting an initial size of 300, as the counter approaches 0, the circles decrease by 45 in size
        fill(240, 220, 200, 98);                                           // fill circles with transparent, warm white colour
        ellipse(width / 2, height / 2, circleSize - i, circleSize - i);    // position circles in the centre of the canvas, and let the circle diameters decrease each time the loop runs
    }

    // check whether the phase has passed
    if (millis() - startMillis >= phase) {                                 // if statement: if the elapsed time is equal to or greater than 4 seconds (UKHeliBob, 2017);
        shrinkOrGrow *= -1;                                                // then the circle will reverse its current direction (i.e. shrinking or growing), and;
        startMillis = millis();                                            // timer restarts (UKHeliBob, 2017)
    }

    // changing the circle size depending on direction
    circleSize += shrinkOrGrow * 2;                                        // scales the circle size up or down, depending on whether its shrinking of growing

    circleSize = constrain(circleSize, 100, 700);                          // constrains the circle size to stay within 100-700
    
}
