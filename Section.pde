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
      createMessage("Attack to open the chest and 'E' to equip", 50, 400);
      Chest newchest;
      newchest = new Chest(new Shield(1, 10, 25, 500, 500), new Sword(3, 50, 250, 50, 500, 500, "Upgraded Starter Sword"), 100, 450);
      Chests.add(newchest);
      createWall(0, 250, 100, 250);
      createWall(150, 250, 250, 250);
      createWall(250, 0, 250, 250);
      createWall(500, 500, 0, 500);
      createWall(500, 0, 500, 250);
      createWall(500, 350, 500, 500);
      createDoor(500, 250, 500, 350);
      createDoor(100, 250, 150, 250);
      createHouse(1200, 100);
      createHouse2(150, 650);
      // SwordItemDrop item = new SwordItemDrop(new Sword(3, 50, 250, 5, 500, 500),100,300);
      //   ShieldItemDrop item2 = new ShieldItemDrop(new Shield(3, 50, 5, 500, 500),200,300);
      // items.add(item);
      // items.add(item2);
      for (int i = 0; i < 2; i++) {
        Enemies.add(new Enemy(700, 300, 1));
      }
      Enemies.add(new EnemyBurst(1500, 250, 5));
    }
    if (x == 2) {
      createHouse(1200, 100);
      createHouse2(150, 650);
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
      createHouse(1200, 100);
      createHouse2(150, 650);
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
      createHouse(1200, 100);
      createHouse2(150, 650);
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
  public void createHouse(int x, int y) {
    createWall(x, y, x+600, y);
    createWall(x+600, y, x+600, y+300);
    createWall(x, y, x, y+300);
    createWall(x, y+300, x+250, y+300);
    createWall(x+350, y+300, x+600, y+300);
    createDoor(x+250, y+300, x+350, y+300);
    Chest newchest1;
    Chest newchest2;
    newchest1 = new Chest(new Shield(1, 10, 25 + 5*(int)(Math.random()*50), 500, 500), generateRandomSword(), x+ 200 + (int)(Math.random()*100) - 50, y+150+ (int)(Math.random()*100) - 50);
    newchest2 = new Chest(new Shield(1, 10, 25 + 5*(int)(Math.random()*50), 500, 500), generateRandomSword(), x+ 400+ (int)(Math.random()*100) - 50, y+150+ (int)(Math.random()*100) - 50);
    Chests.add(newchest1);
    Chests.add(newchest2);
  }
  public Sword generateRandomSword() {
    if (Math.random() > .5) {
      return  new Sword(2, 50, 500, 180, 500, 500, "Quick Dagger");
    }
    if (Math.random() > .5) {
      return  new Sword(50, 200, 5, 225, 500, 500, "Wukong's Staff");
    }
    if (Math.random() > .5) {
      return  new Sword(5, 100, 100, 100, 500, 500, "Iron BroadSword");
    }
    if (Math.random() > .5) {
      return  new Sword(7, 100, 100, 100, 500, 500, "Superior BroadSword");
    }
    if (Math.random() > .5) {
      return  new Sword(10, 100, 150, 50, 500, 500, "Master BroadSword");
    }
    return  new Sword(50, 200, 5, 225, 500, 500, "Wukong's Staff");
  }
  public void createHouse2(int x, int y) {
    createWall(x, y+300, x+600, y+300);
    createWall(x+600, y, x+600, y+300);
    createWall(x, y, x, y+300);
    createWall(x, y, x+250, y);
    createWall(x+350, y, x+600, y);
    createDoor(x+250, y, x+350, y);
    Chest newchest1;
    Chest newchest2;
    if (Math.random()>.5) {
      newchest1 = new Chest(new Shield(1, 10, 25 + 5*(int)(Math.random()*50), 500, 500), generateRandomSword(), x+ 200 + (int)(Math.random()*100) - 50, y+150+ (int)(Math.random()*100) - 50);
      Chests.add(newchest1);
    }
    if(Math.random() > .5){
    newchest2 = new Chest(new Shield(1, 10, 25 + 5*(int)(Math.random()*50), 500, 500), generateRandomSword(), x+ 400+ (int)(Math.random()*100) - 50, y+150+ (int)(Math.random()*100) - 50);
    Chests.add(newchest2);
    }
  }
  public void createHouse3(int x, int y) {
    createWall(x, y, x+600, y);
    createWall(x+600, y, x+600, y+300);
    createWall(x, y, x, y+300);
    createWall(x, y+300, x+250, y+300);
    createWall(x+350, y+300, x+600, y+300);
    createDoor(x+250, y+300, x+350, y+300);
    Chest newchest1;
    Chest newchest2;
    if (Math.random()>.5) {
      newchest1 = new Chest(new Shield(1, 10, 25 + 5*(int)(Math.random()*50), 500, 500), generateRandomSword(), x+ 200 + (int)(Math.random()*100) - 50, y+150+ (int)(Math.random()*100) - 50);
      Chests.add(newchest1);
    }
    if(Math.random() > .5){
    newchest2 = new Chest(new Shield(1, 10, 25 + 5*(int)(Math.random()*50), 500, 500), generateRandomSword(), x+ 400+ (int)(Math.random()*100) - 50, y+150+ (int)(Math.random()*100) - 50);
    Chests.add(newchest2);
    }
  }
  public void createHouse4(int x, int y) {
    createWall(x, y, x+600, y);
    createWall(x+600, y, x+600, y+300);
    createWall(x, y, x, y+300);
    createWall(x, y+300, x+250, y+300);
    createWall(x+350, y+300, x+600, y+300);
    createDoor(x+250, y+300, x+350, y+300);
    Chest newchest1;
    Chest newchest2;
    if (Math.random()>.5) {
      newchest1 = new Chest(new Shield(1, 10, 25 + 5*(int)(Math.random()*50), 500, 500), generateRandomSword(), x+ 200 + (int)(Math.random()*100) - 50, y+150+ (int)(Math.random()*100) - 50);
      Chests.add(newchest1);
    }
    if(Math.random() > .5){
    newchest2 = new Chest(new Shield(1, 10, 25 + 5*(int)(Math.random()*50), 500, 500), generateRandomSword(), x+ 400+ (int)(Math.random()*100) - 50, y+150+ (int)(Math.random()*100) - 50);
    Chests.add(newchest2);
    }
  }
  public void addItemS(Sword item, int x, int y) {
    SwordItemDrop itemN = new SwordItemDrop(item, x -30, y - 30);
    items.add(itemN);
  }
  public void addItemSh(Shield item, int x, int y) {
    ShieldItemDrop itemN = new ShieldItemDrop(item, x +30, y - 30);
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
