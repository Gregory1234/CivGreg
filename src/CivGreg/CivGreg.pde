import java.awt.*;

int n;
int m;
int i=0;

String version = "Alpha 1.0";

int clickDelay = 20;



int mapselectedX = 0;
int mapselectedY = 0;
void setup() {
  
  loadImages();
  size(800, 800);
  textSize(32);
  
  initMap();
  
}
void draw(){
  if(clickDelay>0){
    clickDelay--;
  }
  background(255);
  fill(0);
  switch(winnum){
    case 0:
    showmenu();
    break;
    case 1:
    if(classicMode){
      for(int x = 0;x<16;x++){
        for(int y = 0;y<12;y++){
          map[x][y].fort = 0;
        }
      }
    }
    showgame();
    break;
    case 2:
    showcreatemenu();
    break;
  }

}


void showmenu(){
  textSize(32);
  fill(255);
  rect(300,337,200,35);
  rect(300,377,200,35);
  fill(0);
  text("GREG CIV v"+version,280,30);
  text("New Game",300,370);
  text("Load Game",300,410);
}


void showcreatemenu(){
  textSize(32);
  fill(255);
  rect(300,337,300,35);
  rect(300,377,300,35);
  
  rect(375,685,150,25);
  rect(375,685,20,25);
  rect(375+150-20,685,20,25);
  if(!isWater){
    fill(205);
  }
  rect(375,685+30,150,25);
  fill(0);
  text("Play Normal Mode",300,370);
  text("Play Classic Mode",300,410);
  textSize(20);
  text("-",378,705);
  text("+",378+150-20,705);
  text("Players :"+playersNumber,378+20,705);
  text("Water",380,705+30);
  textSize(32);
}

void showgame(){
  try{
  for(int x = 0;x<16;x++){
    for(int y = 0;y<12;y++){
      fill(255);
      if(x==mapselectedX&&y==mapselectedY){
        fill(205);
      }
      if(map[x][y].owner==1){
        fill(255,0,0);
        if(x==mapselectedX&&y==mapselectedY){
          fill(205,0,0);
        }
      }
      else if(map[x][y].owner==2){
        fill(0,0,255);
        if(x==mapselectedX&&y==mapselectedY){
          fill(0,0,205);
        }
      }
      else if(map[x][y].owner==3){
        fill(0,255,0);
        if(x==mapselectedX&&y==mapselectedY){
          fill(0,205,0);
        }
      }
      else if(map[x][y].owner==4){
        fill(255,255,0);
        if(x==mapselectedX&&y==mapselectedY){
          fill(205,205,0);
        }
      }
      else if(map[x][y].owner==5){
        fill(200,0,200);
        if(x==mapselectedX&&y==mapselectedY){
          fill(150,0,150);
        }
      }
      rect(x*50,y*50,50,50);
      
      
    }
  }
  drawAds();
  showActions();
}catch(Exception e){ }
}

void drawAds(){
  for(int x = 0;x<16;x++){
    for(int y = 0;y<12;y++){
      switch(map[x][y].terrain){
        case "Water":
        image(waterTile, x*50,y*50);
        break;
      }
    }
  }
  for(int x = 0;x<16;x++){
    for(int y = 0;y<12;y++){
      if(map[x][y].fort>16){
          switch(map[x][y].fort){
            case 17:
            image(fort17, x*50-10,y*50-10);
            break;
            default:
            image(fort17, x*50-10,y*50-10);
            break;
          }
      }
    }
  }
  for(int x = 0;x<16;x++){
    for(int y = 0;y<12;y++){
      if(map[x][y].fort<17){
          switch(map[x][y].fort){
              case 1:
              image(fort1, x*50,y*50);
              break;
              case 2:
              image(fort2, x*50,y*50);
              break;
              case 3:
              image(fort3, x*50,y*50);
              break;
              case 4:
              image(fort3, x*50,y*50);
              break;
              case 5:
              image(fort5, x*50,y*50);
              break;
              case 6:
              image(fort5, x*50,y*50);
              break;
              case 7:
              image(fort7, x*50,y*50);
              break;
              case 8:
              image(fort7, x*50,y*50);
              break;
              case 9:
              image(fort7, x*50,y*50);
              break;
              case 10:
              image(fort7, x*50,y*50);
              break;
              case 11:
              image(fort11, x*50,y*50);
              break;
              case 12:
              image(fort11, x*50,y*50);
              break;
              case 13:
              image(fort13, x*50,y*50);
              break;
              case 14:
              image(fort13, x*50,y*50);
              break;
              case 15:
              image(fort13, x*50,y*50);
              break;
              case 16:
              image(fort13, x*50,y*50);
              break;
            }  
      }
      if(map[x][y].owner==playernumber&&map[x][y].population>0){
        //if(map[x][y].population==100){
          image(blankman, x*50,y*50);
        /*}
        else{
          for(int i = 0; i<map[x][y].population/100;i++){
            //map[x][y].population/100
            int offset = ((-(50/(map[x][y].population/100)))*(map[x][y].population/200)+(50/(map[x][y].population/100))*i);
            image(blankman, x*50+offset,y*50);
          }
        }*/
      }
      if(map[x][y].owner!=playernumber&&map[x][y].population>0){
        image(angryman, x*50,y*50);
      }
    }
  }
}

void showActions(){
  if(actiontab==0){
    fill(255);
    rect(10,625,350,30);
    fill(0);
    textSize(25);
    text(map[mapselectedX][mapselectedY].name,15,650);
    textSize(15);
    text("Population :"+map[mapselectedX][mapselectedY].population,10,670);
    text("Terrain type :"+map[mapselectedX][mapselectedY].terrain,10,690);
    text("Owner :"+players[(map[mapselectedX][mapselectedY].owner)],10,710);
    
    
    fill(255);
    rect(375,625,150,25);
    rect(375,655,38,25);
    rect(375+38,655,37,25);
    rect(375+38+37,655,38,25);
    rect(375+38+37+38,655,37,25);
    if(!classicMode){
      rect(375,685,150,25);
      rect(375,685,20,25);
      rect(375+150-20,685,20,25);
      //rect(375,715,150,25);
    }
    fill(0);
    textSize(20);
    text("Attack",380,645);
    textSize(10);
    text("left",378,675);
    text("down",378+38,675);
    text("right",378+38+37,675);
    text("up",378+38+37+38,675);
    textSize(20);
    if(!classicMode){
      text("-",378,705);
      text("+",378+150-20,705);
      text("Fort :"+map[mapselectedX][mapselectedY].fort,378+20,705);
      //text("Build",380,735);
    }
    
  }
  else if(actiontab==1){
    fill(255);
    rect(520,600,150,25);
    fill(0);
    text("Back",520,620);
  }
  fill(255);
  rect(670,600,130,200);
  fill(0);
  textSize(25);
  text("New Turn",675,720);
  textSize(20);
  text("Moves :"+playerMoves+"\n"+players[playernumber],675,760);
}
void clickActions(){
  //title
  //if(mouseX>10&&mouseX<360){
  //  if(mouseY>625&&mouseY<655){
 //     //TODO changing title
  //  }
  //}
  if(actiontab==0){
    if(!classicMode){
      buildFortsAction();
    }
    //action attack
    if(mouseX>375&&mouseX<375+150){
      if(mouseY>625&&mouseY<650){
        attackSelectedAction();
        //println(mouseX+", "+mouseY);
      }
    }
      //move people action
    if(mouseX>375&&mouseX<375+150){
      if(mouseY>655&&mouseY<655+25){
        movePeopleFromSelectedAction();
        //println(mouseX+", "+mouseY);
      }
    }
    
    if(mouseX>375&&mouseX<375+150){
      if(mouseY>715&&mouseY<715+25){
        actiontab=1;
      }
    }
    
  }
  else if(actiontab==1){
    if(mouseX>520&&mouseX<520+150){
      if(mouseY>600&&mouseY<600+25){
        actiontab=0;
      }
    }
  }
}


void mouseClicked(MouseEvent e){
  if(clickDelay == 0){
    clickDelay = 1;
    if(winnum==0){
      //rect(300,337,200,35);
      //rect(300,377,200,35);
      if(mouseX>300&&mouseY>337&&mouseX<500&&mouseY<337+35){
        winnum=2;
      }
      else if(mouseX>300&&mouseY>377&&mouseX<500&&mouseY<377+35){
        //winnum=2;//loadGame("Auto");
        loadGame("Auto");
      }
    }
    else if(winnum==1){
      if(mouseY<600&&mouseY>0&&mouseX<800&&mouseX>0){
        mapselectedX=mouseX/50;
        mapselectedY=mouseY/50;
      }
      if(mouseY>600){
        if(playerMoves>0){
          clickActions();
        }
        if(mouseX>670&&mouseX<800){
          nextTurn();
        }
      }
    }
    else if(winnum==2){
      //rect(300,337,200,35);
      //rect(300,377,200,35);
      if(mouseX>300&&mouseY>337&&mouseX<600&&mouseY<337+35){
        initMap();
        winnum=1;
      }
      else if(mouseX>300&&mouseY>377&&mouseX<600&&mouseY<377+35){
        
        classicMode = true;
        initMap();
        
        winnum=1;
      }
      if(mouseX>375&&mouseX<395){
        if(mouseY>685&&mouseY<685+25){
          if(playersNumber>2){
            playersNumber--;
          }
        }
      }
        
      if(mouseX>375+150-20&&mouseX<395+150){
        if(mouseY>685&&mouseY<685+25){
          if(playersNumber<5){
            playersNumber++;
          }
        }
      }
      
      if(mouseX>375&&mouseX<395+150){
        if(mouseY>685+30&&mouseY<685+25+30){
          isWater=!isWater;
        }
      }
      
    }
  }
  if(e.getCount()==2){
    mouseDouble();
  }
}
void mouseDragged(){
  if(winnum==1){
    
    if(mouseY<600&&mouseY>0&&mouseX<800&&mouseX>0){
      mapselectedX=mouseX/50;
      mapselectedY=mouseY/50;
    }
  }
}
void mouseDouble(){
  if(winnum==1&&playerMoves>0&&mouseY<600){
    attackSelectedAction();
  }
}