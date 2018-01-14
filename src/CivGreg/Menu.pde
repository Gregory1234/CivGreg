

Button playButton = new Button(300,337,200,35,"Play",GTextModeMenu.CENTER);
Button newGameButton = new Button(300,337,200,35,"New Game");
Button loadGameButton = new Button(300,377,200,35,"Load Game");
NumberSelect playerNumberSel = new NumberSelect(375,685,150,25,"Players : @",20,2,20,2,4);

void drawMenu() {
  textSize(32);
  fill(0);
  text("GREG CIV "+version, 280, 30);
  newGameButton.draw();
  loadGameButton.draw();
}

void drawCreatingMenu() {
  playButton.draw();
  playerNumberSel.draw();
}