import java.awt.*;


int clickDelay = 20;

void setup() {
  loadImages();
  size(800, 800);
  textSize(32);
  initMap();
}
void draw() {
  if (clickDelay>0) {
    clickDelay--;
  }
  background(255);
  fill(0);
  switch(winnum) {
  case 0:
    drawMenu();
    break;
  case 1:
    if (classicMode) {
      for (int x = 0; x<16; x++) {
        for (int y = 0; y<12; y++) {
          map[x][y].fort = 0;
        }
      }
    }
    drawGame();
    break;
  case 2:
    drawCreatingMenu();
    break;
  }
}

void mouseClicked(MouseEvent e) {
  if (clickDelay == 0) {
    clickDelay = 1;
    if (winnum==0) {
      if (mouseX>300&&mouseY>337&&mouseX<500&&mouseY<337+35) {
        winnum=2;
      } else if (mouseX>300&&mouseY>377&&mouseX<500&&mouseY<377+35) {
        loadGame("Auto");
      }
    } else if (winnum==1) {
      if (mouseY<600&&mouseY>0&&mouseX<800&&mouseX>0) {
        selX=mouseX/50;
        selY=mouseY/50;
      }
      if (mouseY>600) {
        if (playerMoves>0) {
          clickActions();
        }
        if (mouseX>670&&mouseX<800) {
          nextTurn();
        }
      }
    } else if (winnum==2) {
      if (mouseX>300&&mouseY>337&&mouseX<600&&mouseY<337+35) {
        initMap();
        winnum=1;
      } else if (mouseX>300&&mouseY>377&&mouseX<600&&mouseY<377+35) {

        classicMode = true;
        initMap();

        winnum=1;
      }
      if (mouseX>375&&mouseX<395) {
        if (mouseY>685&&mouseY<685+25) {
          if (playersNumber>2) {
            playersNumber--;
          }
        }
      }

      if (mouseX>375+150-20&&mouseX<395+150) {
        if (mouseY>685&&mouseY<685+25) {
          if (playersNumber<5) {
            playersNumber++;
          }
        }
      }

      if (mouseX>375&&mouseX<395+150) {
        if (mouseY>685+30&&mouseY<685+25+30) {
          isWater=!isWater;
        }
      }
    }
  }
  if (e.getCount()==2) {
    mouseDouble();
  }
}
void mouseDragged() {
  if (winnum==1) {
    if (mouseY<600&&mouseY>0&&mouseX<800&&mouseX>0) {
      selX=mouseX/50;
      selY=mouseY/50;
    }
  }
}
void mouseDouble() {
  if (winnum==1&&playerMoves>0&&mouseY<600) {
    attackSelectedAction();
  }
}