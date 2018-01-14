

void drawMenu() {
  textSize(32);
  fill(255);
  rect(300, 337, 200, 35);
  rect(300, 377, 200, 35);
  fill(0);
  text("GREG CIV "+version, 280, 30);
  text("New Game", 300, 370);
  text("Load Game", 300, 410);
}

void drawCreatingMenu() {
  textSize(32);
  fill(255);
  rect(300, 337, 300, 35);

  rect(375, 685, 150, 25);
  rect(375, 685, 20, 25);
  rect(375+150-20, 685, 20, 25);
  fill(0);
  text("Play", 300, 370);
  textSize(20);
  text("-", 378, 705);
  text("+", 378+150-20, 705);
  text("Players : "+playersNumber, 378+20, 705);
  textSize(32);
}