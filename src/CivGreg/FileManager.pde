
PImage blankman;
PImage angryman;

PImage fort1;
PImage fort2;
PImage fort3;
PImage fort5;
PImage fort7;
PImage fort11;
PImage fort13;
PImage fort17;
PImage fort19;

PImage waterTile;

String respath = "../../res/";

void loadImages() {
  blankman = loadImage(respath+"images/blankman.png");
  angryman = loadImage(respath+"images/angryman.png");

  fort1 = loadImage(respath+"images/fort1.png");
  fort2 = loadImage(respath+"images/fort2.png");
  fort3 = loadImage(respath+"images/fort3.png");
  fort5 = loadImage(respath+"images/fort5.png");
  fort7 = loadImage(respath+"images/fort7.png");
  fort11 = loadImage(respath+"images/fort11.png");
  fort13 = loadImage(respath+"images/fort13.png");
  fort17 = loadImage(respath+"images/fort17.png");

  waterTile = loadImage(respath+"images/water.png");
}

void saveGame(String filename) {
  String[] filetosave = new String[12*16+1];
  filetosave[0]= playernumber+"@nx@"+playerMoves+"@nx@"+(classicMode?"classic":"normal")+"@nx@"+playersNumber;
  for (int x = 0; x<16; x++) {
    for (int y = 0; y<12; y++) {
      filetosave[x*12+y+1]= map[x][y].name+"@nx@"+map[x][y].population+"@nx@"+map[x][y].owner+"@nx@"+map[x][y].terrain+"@nx@"+map[x][y].fort;
    }
  }
  saveStrings("saves/"+filename+".txt", filetosave);
}

void loadGame(String filename) {
  String[] maploaded = loadStrings("saves/"+filename+".txt");
  int[] mainrow = int(maploaded[0].split("@nx@"));
  playernumber = mainrow[0];
  playerMoves = mainrow[1];
  classicMode = (maploaded[0].split("@nx@"))[2].equals("classic");
  playersNumber = mainrow[3];
  for (int i = 1; i<maploaded.length; i++) {
    String[] row = maploaded[i].split("@nx@");
    int x=((i-1)-((i-1)%12))/12;
    int y=((i-1)%12);
    map[x][y].name=row[0];
    map[x][y].population=int(row[1]);
    map[x][y].owner=int(row[2]);
    map[x][y].terrain=row[3];
    map[x][y].fort=int(row[4]);
  }
  winnum = 1;
}