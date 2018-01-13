
int winnum = 0;
int playernumber = 1;
int playersNumber = 2;
int actiontab = 0;
int defPlayerMoves=2;
int playerMoves= 2;
boolean classicMode = false;
boolean isWater = true;

public class Province{
  public String name,terrain;
  public int population,owner,fort;
  public Province(String name,int population,int owner,String terrain,int fort){
    this.name=name;
    this.population=population;
    this.owner=owner;
    this.terrain=terrain;
    this.fort=fort;
  }
}

String[] players = {"No Owner","Red","Blue","Green","Yellow","Purple"};

Province[][] map = new Province[16][12];

void initMap(){
  for(int x = 0;x<16;x++){
    for(int y = 0;y<12;y++){
      String terrain = "Plains";
      if(isWater){
        if(floor(random(10))==1){
          terrain = "Water";
        }
      }
      map[x][y]=new Province("Province "+x+" ,"+y,0,0,terrain,0);
    }
  }
  
  map[15][11]=new Province("Red's first province",1000,1,"Plains",1);
  map[0][0]=new Province("Blue's first province",1000,2,"Plains",1);
  if(playersNumber>=3){
    map[0][11]=new Province("Green's first province",1000,3,"Plains",1);
  }
  if(playersNumber>=4){
    map[15][0]=new Province("Yellow's first province",1000,4,"Plains",1);
  }
  if(playersNumber>=5){
    map[7][5]=new Province("Purple's first province",1000,5,"Plains",1);  
  }
}

void nextTurn(){
  
  if(playernumber==playersNumber){
    playernumber=1;
  }
  else{
    playernumber++;
  }
  int PM = 0;
  for(int x = 0;x<16;x++){
    for(int y = 0;y<12;y++){
      map[x][y].population+=map[x][y].fort*10;
      //println(map[x][y].fort);
      if( map[x][y].owner==playernumber){
        PM+=map[x][y].fort;
      }
    }
  }
  if(PM<defPlayerMoves){
    PM=defPlayerMoves;
  }
  
  playerMoves=PM;
  saveGame("Auto");
}

void buildFortsAction(){
  if(mouseX>375&&mouseX<395){
    if(mouseY>685&&mouseY<685+25){
      if(map[mapselectedX][mapselectedY].owner==playernumber){
        if(map[mapselectedX][mapselectedY].fort>0&&playerMoves>=map[mapselectedX][mapselectedY].fort-1){
          map[mapselectedX][mapselectedY].fort--;
          playerMoves-=map[mapselectedX][mapselectedY].fort;
        }
      }
    }
  }
  
  if(mouseX>375+150-20&&mouseX<395+150){
    if(mouseY>685&&mouseY<685+25){
      if(map[mapselectedX][mapselectedY].owner==playernumber){
          if(playerMoves>=map[mapselectedX][mapselectedY].fort+1){
            map[mapselectedX][mapselectedY].fort++;
            playerMoves-=map[mapselectedX][mapselectedY].fort;
          }
      }
    }
  }
}

void attackSelectedAction(){
  if(map[mapselectedX][mapselectedY].owner!=playernumber){
    if(classicMode){
      if(map[mapselectedX][mapselectedY].terrain!="Water"){
        if(mapselectedX>0 && map[mapselectedX-1][mapselectedY].owner==playernumber&&map[mapselectedX-1][mapselectedY].population>=100){
          map[mapselectedX][mapselectedY].owner=playernumber;
          map[mapselectedX-1][mapselectedY].population-=100;
          map[mapselectedX][mapselectedY].population+=100;
          playerMoves--;
        }
        else if(mapselectedX<15 && map[mapselectedX+1][mapselectedY].owner==playernumber&&map[mapselectedX+1][mapselectedY].population>=100){
          map[mapselectedX][mapselectedY].owner=playernumber;
          map[mapselectedX+1][mapselectedY].population-=100;
          map[mapselectedX][mapselectedY].population+=100;
          playerMoves--;
        }
        else if(mapselectedY>0 && map[mapselectedX][mapselectedY-1].owner==playernumber&&map[mapselectedX][mapselectedY-1].population>=100){
          map[mapselectedX][mapselectedY].owner=playernumber;
          map[mapselectedX][mapselectedY-1].population-=100;
          map[mapselectedX][mapselectedY].population+=100;
          playerMoves--;
        }
        else if(mapselectedY<11 && map[mapselectedX][mapselectedY+1].owner==playernumber&&map[mapselectedX][mapselectedY+1].population>=100){
          map[mapselectedX][mapselectedY].owner=playernumber;
          map[mapselectedX][mapselectedY].population+=100;
          map[mapselectedX][mapselectedY+1].population-=100;
          playerMoves--;
        }
      }
    }
    else{
      if(map[mapselectedX][mapselectedY].terrain!="Water"){
        if(mapselectedX>0 && map[mapselectedX-1][mapselectedY].owner==playernumber&&map[mapselectedX-1][mapselectedY].population>=100){
          if(map[mapselectedX][mapselectedY].owner==0){
            map[mapselectedX][mapselectedY].owner=playernumber;
            map[mapselectedX-1][mapselectedY].population-=100;
            map[mapselectedX][mapselectedY].population=100;
          }
          else{
            if(map[mapselectedX][mapselectedY].population*(1+map[mapselectedX][mapselectedY].fort/10)<map[mapselectedX-1][mapselectedY].population){
              map[mapselectedX][mapselectedY].population=map[mapselectedX-1][mapselectedY].population-map[mapselectedX][mapselectedY].population;
              map[mapselectedX-1][mapselectedY].population=0;
              map[mapselectedX][mapselectedY].owner=playernumber;
              map[mapselectedX][mapselectedY].fort=map[mapselectedX][mapselectedY].fort==0?0:map[mapselectedX][mapselectedY].fort-1;
            }
            else{
              map[mapselectedX][mapselectedY].population=map[mapselectedX][mapselectedY].population-map[mapselectedX-1][mapselectedY].population;
              map[mapselectedX-1][mapselectedY].population=0;
            }
          }
          playerMoves--;
        }
        else if(mapselectedX<15 && map[mapselectedX+1][mapselectedY].owner==playernumber&&map[mapselectedX+1][mapselectedY].population>=100){
          if(map[mapselectedX][mapselectedY].owner==0){
            map[mapselectedX][mapselectedY].owner=playernumber;
            map[mapselectedX+1][mapselectedY].population-=100;
            map[mapselectedX][mapselectedY].population=100;
          }
          else{
            if(map[mapselectedX][mapselectedY].population*(1+map[mapselectedX][mapselectedY].fort/10)<map[mapselectedX+1][mapselectedY].population){
              map[mapselectedX][mapselectedY].population=map[mapselectedX+1][mapselectedY].population-map[mapselectedX][mapselectedY].population;
              map[mapselectedX+1][mapselectedY].population=0;
              map[mapselectedX][mapselectedY].owner=playernumber;
              map[mapselectedX][mapselectedY].fort=map[mapselectedX][mapselectedY].fort==0?0:map[mapselectedX][mapselectedY].fort-1;
            }
            else{
              map[mapselectedX][mapselectedY].population=map[mapselectedX][mapselectedY].population-map[mapselectedX+1][mapselectedY].population;
              map[mapselectedX+1][mapselectedY].population=0;
            }
          }
          playerMoves--;
        }
        else if(mapselectedY>0 && map[mapselectedX][mapselectedY-1].owner==playernumber&&map[mapselectedX][mapselectedY-1].population>=100){
          if(map[mapselectedX][mapselectedY].owner==0){
            map[mapselectedX][mapselectedY].owner=playernumber;
            map[mapselectedX][mapselectedY-1].population-=100;
            map[mapselectedX][mapselectedY].population=100;
          }
          else{
            if(map[mapselectedX][mapselectedY].population*(1+map[mapselectedX][mapselectedY].fort/10)<map[mapselectedX][mapselectedY-1].population){
              map[mapselectedX][mapselectedY].population=map[mapselectedX][mapselectedY-1].population-map[mapselectedX][mapselectedY].population;
              map[mapselectedX][mapselectedY-1].population=0;
              map[mapselectedX][mapselectedY].owner=playernumber;
              map[mapselectedX][mapselectedY].fort=map[mapselectedX][mapselectedY].fort==0?0:map[mapselectedX][mapselectedY].fort-1;
            }
            else{
              map[mapselectedX][mapselectedY].population=map[mapselectedX][mapselectedY].population-map[mapselectedX][mapselectedY-1].population;
              map[mapselectedX][mapselectedY-1].population=0;
            }
          }
          playerMoves--;
        }
        else if(mapselectedY<11 && map[mapselectedX][mapselectedY+1].owner==playernumber&&map[mapselectedX][mapselectedY+1].population>=100){
          if(map[mapselectedX][mapselectedY].owner==0){
            map[mapselectedX][mapselectedY].owner=playernumber;
            map[mapselectedX][mapselectedY+1].population-=100;
            map[mapselectedX][mapselectedY].population=100;
          }
          else{
            if(map[mapselectedX][mapselectedY].population*(1+map[mapselectedX][mapselectedY].fort/10)<map[mapselectedX][mapselectedY+1].population){
              map[mapselectedX][mapselectedY].population=map[mapselectedX][mapselectedY+1].population-map[mapselectedX][mapselectedY].population;
              map[mapselectedX][mapselectedY+1].population=0;
              map[mapselectedX][mapselectedY].owner=playernumber;
              map[mapselectedX][mapselectedY].fort=map[mapselectedX][mapselectedY].fort==0?0:map[mapselectedX][mapselectedY].fort-1;
            }
            else{
              map[mapselectedX][mapselectedY].population=map[mapselectedX][mapselectedY].population-map[mapselectedX][mapselectedY+1].population;
              map[mapselectedX][mapselectedY+1].population=0;
            }
          }
          playerMoves--;
        }
      }
    }
  }
}
void movePeopleFromSelectedAction(){
  if(map[mapselectedX][mapselectedY].owner==playernumber&&map[mapselectedX][mapselectedY].population>=100){
    if(mapselectedX>0 && map[mapselectedX-1][mapselectedY].owner==playernumber&&mouseX<375+38){
      map[mapselectedX-1][mapselectedY].population+=100;
      map[mapselectedX][mapselectedY].population-=100;
      playerMoves--;
    }
    else if(mapselectedY<11 && map[mapselectedX][mapselectedY+1].owner==playernumber&&mouseX<375+38+37&&mouseX>375+38){
      map[mapselectedX][mapselectedY].population-=100;
      map[mapselectedX][mapselectedY+1].population+=100;
      playerMoves--;
    }
    else if(mapselectedX<15 && map[mapselectedX+1][mapselectedY].owner==playernumber&&mouseX<375+38+37+38&&mouseX>375+38+37){
      map[mapselectedX+1][mapselectedY].population+=100;
      map[mapselectedX][mapselectedY].population-=100;
      playerMoves--;
    }
    else if(mapselectedY>0 && map[mapselectedX][mapselectedY-1].owner==playernumber&&mouseX>375+38+37+38){
      map[mapselectedX][mapselectedY-1].population+=100;
      map[mapselectedX][mapselectedY].population-=100;
      playerMoves--;
    }
  }
}