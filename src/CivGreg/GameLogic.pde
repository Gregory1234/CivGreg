

int winnum = 0;
int playernumber = 1;
int playersNumber = 2;
int defPlayerMoves=2;
int playerMoves= 2;


int selX = 0;
int selY = 0;

void nextTurn() {

  if (playernumber==playersNumber) {
    playernumber=1;
  } else {
    playernumber++;
  }
  int PM = 0;
  for (int x = 0; x<16; x++) {
    for (int y = 0; y<12; y++) {
      map[x][y].population+=map[x][y].fort*10;
      //println(map[x][y].fort);
      if ( map[x][y].owner==playernumber) {
        PM+=map[x][y].fort;
      }
    }
  }
  if (PM<defPlayerMoves) {
    PM=defPlayerMoves;
  }

  playerMoves=PM;
  saveGame("Auto");
}

void clickActions() {
  buildFortsAction();
  if (attackButton.check()){
    attackSelectedAction();
  }
  movePeopleFromSelectedAction();
}

void buildFortsAction() {
  int change = fortSel.change();
  if(change==0)
    return;
  if (map[selX][selY].owner==playernumber) {
    if (map[selX][selY].fort>0&&playerMoves>=map[selX][selY].fort+change) {
      map[selX][selY].fort+=change;
      playerMoves-=map[selX][selY].fort+change;
    }
  }
}

void attackSelectedAction() {
  if (map[selX][selY].owner!=playernumber) {
    if (map[selX][selY].terrain!="Water") {
      if (selX>0 && map[selX-1][selY].owner==playernumber&&map[selX-1][selY].population>=100) {
        if (map[selX][selY].owner==0) {
          map[selX][selY].owner=playernumber;
          map[selX-1][selY].population-=100;
          map[selX][selY].population=100;
        } else {
          if (map[selX][selY].population*(1+map[selX][selY].fort/10)<map[selX-1][selY].population) {
            map[selX][selY].population=map[selX-1][selY].population-map[selX][selY].population;
            map[selX-1][selY].population=0;
            map[selX][selY].owner=playernumber;
            map[selX][selY].fort=map[selX][selY].fort==0?0:map[selX][selY].fort-1;
          } else {
            map[selX][selY].population=map[selX][selY].population-map[selX-1][selY].population;
            map[selX-1][selY].population=0;
          }
        }
        playerMoves--;
      } else if (selX<15 && map[selX+1][selY].owner==playernumber&&map[selX+1][selY].population>=100) {
        if (map[selX][selY].owner==0) {
          map[selX][selY].owner=playernumber;
          map[selX+1][selY].population-=100;
          map[selX][selY].population=100;
        } else {
          if (map[selX][selY].population*(1+map[selX][selY].fort/10)<map[selX+1][selY].population) {
            map[selX][selY].population=map[selX+1][selY].population-map[selX][selY].population;
            map[selX+1][selY].population=0;
            map[selX][selY].owner=playernumber;
            map[selX][selY].fort=map[selX][selY].fort==0?0:map[selX][selY].fort-1;
          } else {
            map[selX][selY].population=map[selX][selY].population-map[selX+1][selY].population;
            map[selX+1][selY].population=0;
          }
        }
        playerMoves--;
      } else if (selY>0 && map[selX][selY-1].owner==playernumber&&map[selX][selY-1].population>=100) {
        if (map[selX][selY].owner==0) {
          map[selX][selY].owner=playernumber;
          map[selX][selY-1].population-=100;
          map[selX][selY].population=100;
        } else {
          if (map[selX][selY].population*(1+map[selX][selY].fort/10)<map[selX][selY-1].population) {
            map[selX][selY].population=map[selX][selY-1].population-map[selX][selY].population;
            map[selX][selY-1].population=0;
            map[selX][selY].owner=playernumber;
            map[selX][selY].fort=map[selX][selY].fort==0?0:map[selX][selY].fort-1;
          } else {
            map[selX][selY].population=map[selX][selY].population-map[selX][selY-1].population;
            map[selX][selY-1].population=0;
          }
        }
        playerMoves--;
      } else if (selY<11 && map[selX][selY+1].owner==playernumber&&map[selX][selY+1].population>=100) {
        if (map[selX][selY].owner==0) {
          map[selX][selY].owner=playernumber;
          map[selX][selY+1].population-=100;
          map[selX][selY].population=100;
        } else {
          if (map[selX][selY].population*(1+map[selX][selY].fort/10)<map[selX][selY+1].population) {
            map[selX][selY].population=map[selX][selY+1].population-map[selX][selY].population;
            map[selX][selY+1].population=0;
            map[selX][selY].owner=playernumber;
            map[selX][selY].fort=map[selX][selY].fort==0?0:map[selX][selY].fort-1;
          } else {
            map[selX][selY].population=map[selX][selY].population-map[selX][selY+1].population;
            map[selX][selY+1].population=0;
          }
        }
        playerMoves--;
      }
    }
  }
}
void movePeopleFromSelectedAction() {
  if (map[selX][selY].owner==playernumber&&map[selX][selY].population>=100) {
    if (selX>0 && map[selX-1][selY].owner==playernumber&&moveLeftButton.check()) {
      map[selX-1][selY].population+=100;
      map[selX][selY].population-=100;
      playerMoves--;
    } else if (selY<11 && map[selX][selY+1].owner==playernumber&&moveDownButton.check()) {
      map[selX][selY].population-=100;
      map[selX][selY+1].population+=100;
      playerMoves--;
    } else if (selX<15 && map[selX+1][selY].owner==playernumber&&moveRightButton.check()) {
      map[selX+1][selY].population+=100;
      map[selX][selY].population-=100;
      playerMoves--;
    } else if (selY>0 && map[selX][selY-1].owner==playernumber&&moveUpButton.check()) {
      map[selX][selY-1].population+=100;
      map[selX][selY].population-=100;
      playerMoves--;
    }
  }
}