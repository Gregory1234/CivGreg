public class Province {
  public String terrain;
  public int population, owner, fort;
  public Province(int population, int owner, String terrain, int fort) {
    this.population=population;
    this.owner=owner;
    this.terrain=terrain;
    this.fort=fort;
  }
}
Province[][] map = new Province[16][12];

void initMap() {
  for (int x = 0; x<16; x++) {
    for (int y = 0; y<12; y++) {
      String terrain = "Plains";
      if (isWater) {
        if (floor(random(10))==1) {
          terrain = "Water";
        }
      }
      map[x][y]=new Province(0, 0, terrain, 0);
    }
  }

  map[15][11]=new Province(1000, 1, "Plains", 1);
  map[0][0]=new Province(1000, 2, "Plains", 1);
  if (playersNumber>=3) {
    map[0][11]=new Province(1000, 3, "Plains", 1);
  }
  if (playersNumber>=4) {
    map[15][0]=new Province(1000, 4, "Plains", 1);
  }
  if (playersNumber>=5) {
    map[7][5]=new Province(1000, 5, "Plains", 1);
  }
}