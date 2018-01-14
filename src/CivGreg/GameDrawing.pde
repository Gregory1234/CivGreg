void drawGame() {
  try {
    for (int x = 0; x<16; x++) {
      for (int y = 0; y<12; y++) {
        fill(255);
        if (x==selX&&y==selY) {
          fill(205);
        }
        if (map[x][y].owner==1) {
          fill(255, 0, 0);
          if (x==selX&&y==selY&&map[x][y].owner==playernumber) {
            fill(255, 100, 100);
          } else if (map[x][y].owner!=playernumber&&!(x==selX&&y==selY)) {
            fill(205, 0, 0);
          }
        } else if (map[x][y].owner==2) {
          fill(0, 0, 255);
          if (x==selX&&y==selY&&map[x][y].owner==playernumber) {
            fill(100, 100, 255);
          } else if (map[x][y].owner!=playernumber&&!(x==selX&&y==selY)) {
            fill(0, 0, 205);
          }
        } else if (map[x][y].owner==3) {
          fill(0, 255, 0);
          if (x==selX&&y==selY&&map[x][y].owner==playernumber) {
            fill(100, 255, 100);
          } else if (map[x][y].owner!=playernumber&&!(x==selX&&y==selY)) {
            fill(0, 205, 0);
          }
        } else if (map[x][y].owner==4) {
          fill(255, 255, 0);
          if (x==selX&&y==selY&&map[x][y].owner==playernumber) {
            fill(255, 255, 100);
          } else if (map[x][y].owner!=playernumber&&!(x==selX&&y==selY)) {
            fill(205, 205, 0);
          }
        }
        rect(x*50, y*50, 50, 50);
      }
    }
    drawTextures();
    drawActions();
  }
  catch(Exception e) {
  }
}

void drawTextures() {
  for (int x = 0; x<16; x++) {
    for (int y = 0; y<12; y++) {
      switch(map[x][y].terrain) {
      case "Water":
        image(waterTile, x*50, y*50);
        break;
      }
    }
  }
  for (int x = 0; x<16; x++) {
    for (int y = 0; y<12; y++) {
      if (map[x][y].fort>16) {
        switch(map[x][y].fort) {
        case 17:
          image(fort17, x*50-10, y*50-10);
          break;
        default:
          image(fort17, x*50-10, y*50-10);
          break;
        }
      }
    }
  }
  for (int x = 0; x<16; x++) {
    for (int y = 0; y<12; y++) {
      if (map[x][y].fort<17) {
        switch(map[x][y].fort) {
        case 1:
          image(fort1, x*50, y*50);
          break;
        case 2:
          image(fort2, x*50, y*50);
          break;
        case 3:
          image(fort3, x*50, y*50);
          break;
        case 4:
          image(fort3, x*50, y*50);
          break;
        case 5:
          image(fort5, x*50, y*50);
          break;
        case 6:
          image(fort5, x*50, y*50);
          break;
        case 7:
          image(fort7, x*50, y*50);
          break;
        case 8:
          image(fort7, x*50, y*50);
          break;
        case 9:
          image(fort7, x*50, y*50);
          break;
        case 10:
          image(fort7, x*50, y*50);
          break;
        case 11:
          image(fort11, x*50, y*50);
          break;
        case 12:
          image(fort11, x*50, y*50);
          break;
        case 13:
          image(fort13, x*50, y*50);
          break;
        case 14:
          image(fort13, x*50, y*50);
          break;
        case 15:
          image(fort13, x*50, y*50);
          break;
        case 16:
          image(fort13, x*50, y*50);
          break;
        }
      }
      if (map[x][y].owner==playernumber&&map[x][y].population>0) {
        image(blankman, x*50, y*50);
      }
      if (map[x][y].owner!=playernumber&&map[x][y].population>0) {
        image(angryman, x*50, y*50);
      }
    }
  }
}

void drawActions() {
  fill(255);
  rect(10, 625, 350, 30);
  fill(0);
  textSize(25);
  text("Coordinates : "+selX+", "+selY, 15, 650);
  textSize(15);
  text("Population : "+map[selX][selY].population, 10, 670);
  text("Terrain type : "+map[selX][selY].terrain, 10, 690);
  text("Owner : "+players[(map[selX][selY].owner)], 10, 710);


  fill(255);
  rect(375, 625, 150, 25);
  rect(375, 655, 38, 25);
  rect(375+38, 655, 37, 25);
  rect(375+38+37, 655, 38, 25);
  rect(375+38+37+38, 655, 37, 25);
  rect(375, 685, 150, 25);
  rect(375, 685, 20, 25);
  rect(375+150-20, 685, 20, 25);
  fill(0);
  textSize(20);
  text("Attack", 380, 645);
  textSize(10);
  text("left", 378, 675);
  text("down", 378+38, 675);
  text("right", 378+38+37, 675);
  text("up", 378+38+37+38, 675);
  textSize(20);
  text("-", 378, 705);
  text("+", 378+150-20, 705);
  text("Fort :"+map[selX][selY].fort, 378+20, 705);
  fill(255);
  rect(670, 600, 130, 200);
  fill(0);
  textSize(25);
  text("New Turn", 675, 720);
  textSize(20);
  text("Moves :"+playerMoves+"\n"+players[playernumber], 675, 760);
}
void clickActions() {
  buildFortsAction();
  //action attack
  if (mouseX>375&&mouseX<375+150) {
    if (mouseY>625&&mouseY<650) {
      attackSelectedAction();
    }
  }
  //move people action
  if (mouseX>375&&mouseX<375+150) {
    if (mouseY>655&&mouseY<655+25) {
      movePeopleFromSelectedAction();
    }
  }
}