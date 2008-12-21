// this draws a line whenever a key is pressed
// rotation/colour is based on the letter
// based on a poster by Boris Müller

PFont theFont;
float textDim = 10;
int currentLine = 1;

QVector2D lastVector;
QVector2D newVector;
QVector2D modVector;
color colour;

void setup()
{
  size(400, 400);
  smooth();
  background(255);
  
  fill(0);
  theFont = loadFont("Ziggurat-HTF-Black-32.vlw");
  textFont(theFont, 32);
  
  lastVector = new QVector2D(width/2, height/2);
  newVector = new QVector2D(lastVector.x, lastVector.y);
  modVector = new QVector2D(0, 3);
  colour = color(0);
    
  noLoop();
}

void draw()
{
  char character = Character.toLowerCase(key);
  if (character == 'a') modVector.rotate(10);
  if (character == 'b') modVector.rotate(350);
  if (character == 'd') modVector.mult(1.2);
  if (character == 'e') {
    modVector.normalize();
    modVector.mult(3);
  }
  if (character == 'f') modVector.rotate(20);
  if (character == 'g') modVector.rotate(30);
  if (character == 'h') modVector.rotate(315);
  if (character == 'i') modVector.mult(1.2);
  if (character == 'j') modVector.rotate(25);
  if (character == 'l') modVector.mult(1.5);
  if (character == 'n') {
    modVector.normalize();
    modVector.mult(3);
  }
  if (character == 'o') modVector.rotate(220);
  if (character == 'p') modVector.mult(1.1);
  if (character == 'q') modVector.mult(.9);
  if (character == 'r') modVector.mult(.7);
  if (character == 's') modVector.rotate(170);
  if (character == 't') modVector.mult(.8);
  if (character == 'u') modVector.rotate(190);
  if (character == 'v') modVector.rotate(135);
  if (character == 'w') modVector.rotate(225);
  if (character == 'x') modVector.rotate(90);
  if (character == 'z') modVector.mult(2);

  if (character == 'c') colour = color(0, 255, 255);
  if (character == 'm') colour = color(255, 0, 255);
  if (character == 'y') colour = color(255, 255, 0);
  if (character == 'k') colour = color(0);
  
  if ((textDim + textWidth(key)) > (width - 10)) {
    textDim = 10;
    currentLine++;
  }
  fill(colour);
  text(key, textDim, currentLine*32);
  textDim += textWidth(key);
  
  newVector.add(modVector);

  stroke(colour);
  line(lastVector.x, lastVector.y, newVector.x, newVector.y);
  lastVector.set(newVector.x, newVector.y);
}

void keyPressed()
{
  redraw();
}