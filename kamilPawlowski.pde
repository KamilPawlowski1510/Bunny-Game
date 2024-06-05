//variables
int posx;
int posy;
int spd = 5;
int life = 1;
int h = hour();
//images
PImage sword;
PImage bunny;
PImage grass1;
PImage carrot;
PImage grass2;

void setup() {
  size(800, 800);
  frameRate(60);
  surface.setTitle("Bunny's Day Out");
  posx = width / 2;      //setting default values
  posy = height / 2;
  sword = loadImage("sword.png");
  bunny = loadImage("bunny.png");
  grass1 = loadImage("grass1.jpg");
  carrot = loadImage("carrot.png");
  grass2 = loadImage("grass2.jpg");
  //introduction
  println("Play as a little rabbit. Control their movement with WASD. Be careful, they're quite young so they can only handle one cardinal directions at a time or they get confused.");
  println("You can excite them with left click or calm them with right click. If you want to bring them back to normal simply middle click.");
  print("That sword sure looks exciting. Maybe you could use it?");
}

void draw() {
  if (life == 1) {      //gameplay if alive
    //background
    if (h >= 6)
    {
      image(grass1, 0, 0, width, height);
    } else {
      image(grass2, 0, 0, width, height);
    }
    //decorations
    fill(255);
    ellipse(600, 40, 400, 120);
    fill(#FFA500);
    textSize(30);
    textAlign(RIGHT);
    text("The Controls are in the Console", width, 50);
    image(sword, 0, 0, 100, 100);
    image(bunny, posx, posy, 50, 75);    //player
    cursor(carrot, 30, 30);
    fill(0, 255, 0);
    noStroke();
    triangle(50, 120, 0, 170, 100, 170);
    rect(30, 170, 40, 200);

    if (mousePressed == true) {    //speed Controls
      if (mouseButton == LEFT) {    //increase
        spd += 2;
      } else if ((mouseButton == RIGHT) && (spd >= 0)) {    //decrease
        spd--;
        if (spd < 0) {
          spd = 0;
        }
      } else if (mouseButton == CENTER) {    //restore to default
        spd = 5;
      }
    }
    if (keyPressed == true) {      //controls
      if (key == 'd') {    //left
        posx += spd;
      }
      if (key == 'a') {    //right
        posx -= spd;
      }
      if (key == 'w') {    //up
        posy -= spd;
      }
      if (key == 's') {    //down
        posy += spd;
      }
    }
    if ((posx <= 80) && (posy <90)) {    //death trigger
      life = 0;
    }
  } else if (life == 0) {      //gameplay if dead
    background(#8b0000);
    fill(#D21404);
    textSize(50);
    textAlign(CENTER);
    text("You Stabbed Yourself...", width/2, 300);
    textSize(35);
    text("What did you think was gonna happen?", width/2, 350);
    fill(255);
    textSize(40);
    text("Press R to Retry", width/2, 500);
    if (key == 'r') {      //This resets the game
      life = 1;
      posx = width / 2;
      posy = height / 2;
      spd = 5;
    }
  }
}
