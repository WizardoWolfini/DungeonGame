class Section {
  ArrayList<Chest> Chests = new ArrayList<Chest>();
  ArrayList<GameWall> Walls = new ArrayList<GameWall>();
  ArrayList<Enemy> Enemies = new ArrayList<Enemy>();
  ArrayList<CustomMessage> sText = new ArrayList<CustomMessage>();
  ArrayList<CustomItemDropInterface> items = new ArrayList<CustomItemDropInterface>();
  public Section(int x) {
    if (x == 1) {
      createWall(0, 1075, 1920, 1075);
      createWall(5, 5, 5, 1080);
      createWall(1915, 5, 1915, 460);
      createWall(1915, 620, 1915, 1080);
      createWall(0, 5, 860, 5);
      createWall(1040, 5, 1920, 5);
      createMessage("Press 'E' to open the chest", 50, 400);
      Chest newchest;
      newchest = new Chest(new Shield(1, 10, 25, 500, 500), new Sword(3, 50, 250, 5, 500, 500), 100, 450);
      Chests.add(newchest);
      createWall(0, 250, 100, 250);
      createWall(150, 250, 250, 250);
      createWall(250, 0, 250, 250);
      createWall(500, 500, 0, 500);
      createWall(500, 0, 500, 250);
      createWall(500, 350, 500, 500);
      createDoor(500, 250, 500, 350);
      createDoor(100, 250, 150, 250);
     // SwordItemDrop item = new SwordItemDrop(new Sword(3, 50, 250, 5, 500, 500),100,300);
   //   ShieldItemDrop item2 = new ShieldItemDrop(new Shield(3, 50, 5, 500, 500),200,300);
     // items.add(item);
     // items.add(item2);
      for (int i = 0; i < 2; i++) {
        Enemies.add(new Enemy(700, 300, 1));
      }
      Enemies.add(new EnemyBurst(600, 300, 5));
    }
    if (x == 2) {
      createWall(0, 1075, 1920, 1075);
      createWall(1915, 5, 1915, 460);
      createWall(1915, 620, 1915, 1080);
      createWall(5, 5, 5, 460);
      createWall(5, 620, 5, 1080);
      createWall(0, 5, 860, 5);
      createWall(1040, 5, 1920, 5);
      for (int i = 0; i < 2; i++) {
        Enemies.add(new Enemy(700, 300, 1));
      }
    }
    if (x == 3) {
      createWall(0, 1075, 860, 1075);
      createWall(1040, 1075, 1920, 1075);
      createWall(1915, 5, 1915, 460);
      createWall(1915, 620, 1915, 1080);
      createWall(5, 5, 5, 460);
      createWall(5, 620, 5, 1080);
      createWall(0, 5, 860, 5);
      createWall(1040, 5, 1920, 5);
      for (int i = 0; i < 2; i++) {
        Enemies.add(new Enemy(700, 300, 1));
      }
    }
    if (x==4) {
      createWall(0, 1075, 860, 1075);
      createWall(1040, 1075, 1920, 1075);
      createWall(1915, 5, 1915, 460);
      createWall(1915, 620, 1915, 1080);
      createWall(5, 5, 5, 1080);
      createWall(0, 5, 860, 5);
      createWall(1040, 5, 1920, 5);
      for (int i = 0; i < 2; i++) {
        Enemies.add(new Enemy(700, 300, 1));
      }
    }
    if (x==5) {
      for (int i = 0; i < 500; i++) {
        //    Enemies.add(new EnemyBurst());
      }
    }
  }
  public void addItemS(Sword item,int x, int y){
    SwordItemDrop itemN = new SwordItemDrop(item,x -30,y - 30);
  items.add(itemN);
  }
    public void addItemSh(Shield item,int x, int y){
    ShieldItemDrop itemN = new ShieldItemDrop(item,x +30,y - 30);
  items.add(itemN);
  }
  public ArrayList<CustomMessage> getMessages() {
    return sText;
  }
    public ArrayList<CustomItemDropInterface> getItems() {
    return items;
  }
  private void createMessage(String m, int x, int y) {
    sText.add(new CustomMessage(m, x, y));
  }
  private void createWall(int x1, int y1, int x2, int y2) {
    if (x1-x2 == 0) {
      Walls.add(new GameWall((int)dist(x1, y1, x2, y2), 90, 10, (x1+x2)/2, (y1 + y2)/2));
    } else {
      Walls.add(new GameWall((int)dist(x1, y1, x2, y2), (int)(atan((y1-y2)/(x1-x2)) * 180 / Math.PI), 10, (x1+x2)/2, (y1 + y2)/2));
    }
  }
  private void createDoor(int x1, int y1, int x2, int y2) {
    if (x1-x2 == 0) {
      Walls.add(new GameDoor((int)dist(x1, y1, x2, y2), 90, 7, (x1+x2)/2, (y1 + y2)/2));
    } else {
      Walls.add(new GameDoor((int)dist(x1, y1, x2, y2), (int)(atan((y1-y2)/(x1-x2)) * 180 / Math.PI), 7, (x1+x2)/2, (y1 + y2)/2));
    }
  }
  public ArrayList<GameWall> getWalls() {
    return Walls;
  }
  public ArrayList<Enemy> getEnemies() {
    return Enemies;
  }
  public ArrayList<Chest> getChests() {
    return Chests;
  }
}
