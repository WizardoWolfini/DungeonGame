boolean wKey = false;
boolean aKey = false;
boolean dKey = false;
boolean sKey = false;
boolean qKey = false;
boolean spaceKey = false;
boolean ctrlKey = false;
boolean comboing = false;
boolean comboClick = false;
int comboStage = 0;
int[] comboArr = new int[3];
ArrayList<ArrayList<Section>> Sections = new ArrayList<ArrayList<Section>>();
Player playerOne;
int sectionX;
int sectionY;
void setup() {
  sectionX = 0;
  sectionY = 0;
  frameRate(60);
  size(1920, 1080);
  for (int i = 0; i < 10; i++) {
    Sections.add(new ArrayList<Section>());
  }
  Sections.get(0).add(new Section(1));
  Sections.get(1).add(new Section(4));
  Sections.get(2).add(new Section(4));
  Sections.get(3).add(new Section(4));
  Sections.get(4).add(new Section(4));
  Sections.get(0).add(new Section(2));
  Sections.get(0).add(new Section(2));
  Sections.get(1).add(new Section(3));
  Sections.get(1).add(new Section(3));
  Sections.get(2).add(new Section(3));
  Sections.get(2).add(new Section(3));
  Sections.get(3).add(new Section(3));
  Sections.get(3).add(new Section(3));
  Sections.get(4).add(new Section(3));
  Sections.get(4).add(new Section(3));
  playerOne = new Player(100, 100);
}
void draw() {
  Section currentSection = Sections.get(sectionY).get(sectionX);
  background(127);
  double distx = playerOne.getBody().getX() - mouseX;
  double angleR = 0;
  double angletemp = Math.acos(distx/dist((float)playerOne.getBody().getX(), (float)playerOne.getBody().getY(), (float)mouseX, (float)mouseY));
  for (CustomItemDropInterface item : currentSection.getItems()) {
    if (item.isPickedUp() == false) {
      item.show();
      item.rotateItem();
      if (dist(playerOne.getX(), playerOne.getY(), item.getX(), item.getY()) < 600) {
        item.showStats();
      }
    }
  }
  if (spaceKey) {
    playerOne.StartSwing1();
  }
  if (qKey) {
    playerOne.StartWhirlWind();
  }
  if (playerOne.getY() - mouseY >= 0) {
    angleR = 180 + angletemp *180/Math.PI;
  } else {
    angleR = 180 - angletemp * 180 / Math.PI;
  }
  double speedPlayer = .25;
  for (Enemy enemy : currentSection.getEnemies()) {
    enemy.move();
    enemy.accelerate(.01);
    enemy.turn(3);
    enemy.fireArrow();
    playerOne.shieldBreak();
    for (EnemyArrow arrow : enemy.getArrows()) {
      arrow.move();
      if (playerOne.doesShieldIntersect(arrow)) {
        if (arrow.getAlive() && !playerOne.getShieldStatus()) {
          playerOne.addArrow(arrow);
          arrow.kill();
        }
      }
      if (playerOne.doesBodyIntersect(arrow)) {
        if (arrow.getAlive()) {
          arrow.kill();
          playerOne.getHitArrow(arrow);
        }
      }
      for (GameWall wall : currentSection.getWalls()) {
        if (wall.doesIntersect(arrow)) {
          arrow.stopMove();
          arrow.kill();
        }
      }
      arrow.show();
    }
    for (int i = 0; i < enemy.getArrows().size(); i ++) {
      if (enemy.getArrows().get(i).getAlive() == false) {
        enemy.getArrows().remove(i);
      }
    }
  }
  for (Enemy enemy : currentSection.getEnemies()) {
    enemy.show();
  }
  for (GameWall wall : currentSection.getWalls()) {
    wall.show();
    if (wall.getIsDoor() && dist(playerOne.getX(), playerOne.getY(), (float)wall.getOX(), (float)wall.getOY()) < 100) {
      ((GameDoor)wall).OpenDoor();
    } else if (wall.getIsDoor()) {
      ((GameDoor)wall).CloseDoor();
    }
    if (wall.getIsDoor() && ((GameDoor)wall).checkOpening()) {
      ((GameDoor)wall).OpenUp();
    } else if (wall.getIsDoor() && ((GameDoor)wall).checkClosing()) {
      ((GameDoor)wall).CloseUp();
    }
  }
  for (GameObject playerPart : playerOne.getParts()) {
    playerPart.show();
    double tspeedPlayer = speedPlayer;
    if (wKey) {
      playerPart.accelerateangle(tspeedPlayer, 270, ctrlKey);
    }
    if (aKey) {
      playerPart.accelerateangle(tspeedPlayer, 180, ctrlKey);
    }
    if (sKey) {
      playerPart.accelerateangle(tspeedPlayer, 90, ctrlKey);
    }
    if (dKey) {
      playerPart.accelerateangle(tspeedPlayer, 0, ctrlKey);
    }
    playerPart.setPointDirection((int)angleR);
    playerPart.move();
  }
  for (HitArrow arrow : playerOne.getShield().getHitArrows()) {
    arrow.setDirectionX(playerOne.getBody().getDirectionX());
    arrow.setDirectionY(playerOne.getBody().getDirectionY());
    arrow.setX(playerOne.getX());
    arrow.setY(playerOne.getY());
    arrow.setPointDirection((int)angleR);
  }
  playerOne.shieldMoveArrows();
  playerOne.getShield().turn(-15);
  for (GameWall wall : currentSection.getWalls()) {
    if (wall.doesIntersect(playerOne.getBody())) {
      double[] newSpeeds = wall.wallSlide(playerOne.getBody());
      for (GameObject playerPart : playerOne.getParts()) {
        playerPart.moveBack();
        playerPart.setDirectionX(newSpeeds[0]);
        playerPart.setDirectionY(newSpeeds[1]);
        playerPart.move();
      }
      for (HitArrow arrow : playerOne.getShield().getHitArrows()) {
        arrow.moveBack();
      }
    }
  }
  for (GameObject playerPart : playerOne.getParts()) {
    playerPart.slowdown();
  }
  if (playerOne.checkSwing()) {
    for (Enemy enemy : currentSection.getEnemies()) {
      if (enemy.getAlive()) {
        if (playerOne.getHitHitBox().doesIntersect(enemy)&&enemy.checkTakeDamage()) {
          enemy.takeDamage(playerOne.getSword().getDamage());
          playerOne.loseSwDura();
          if (enemy.getAlive() == false) {
            if (Math.random() > .9) {
              currentSection.addItemSh(new Shield(1, 10, 25, 500, 500), enemy.getX(), enemy.getY());
            }
            if (Math.random() > .5) {
              currentSection.addItemS(new Sword(5 + (int)(Math.random() * 3), 25 + (int)(Math.random() * 100), 100+ 10 * (int)(Math.random() * 5), 75 - 25 + (int)(Math.random() * 50), 500, 500), enemy.getX(), enemy.getY());
            }
          }
        }
      }
    }
  }
  for (Enemy enemy : currentSection.getEnemies()) {
    for (GameWall wall : currentSection.getWalls()) {
      if (wall.doesIntersect(enemy)) {
        if (wall.getPointDirection() == 90) {
          enemy.changeDirectionX();
        } else if (wall.getPointDirection() == 0 || wall.getPointDirection() == 180) {
          enemy.changeDirectionY();
        } else {
          enemy.changeDirection();
        }
      }
    }
  }
  for (Chest newchest : currentSection.getChests()) {
    if (dist(playerOne.getX(), playerOne.getY(), newchest.getX(), newchest.getY()) < 50) {
      if (newchest.isOpened() == false) {
        currentSection.addItemS(newchest.getSword(), newchest.getX(), newchest.getY());
        currentSection.addItemSh(newchest.getShield(), newchest.getX(), newchest.getY());
        newchest.setOpened();
      }
    }
  }
  for (Chest newchest : currentSection.getChests()) {
    newchest.show();
  }
  for (CustomMessage message : currentSection.getMessages()) {
    fill(0);
    textSize(20);
    text(message.getMessage(), message.getX(), message.getY());
  }
  if (playerOne.getBody().getDirectionX() + playerOne.getX() > width - 5) {
    for (GameObject part : playerOne.getParts()) {
      part.setX(50);
    }
    sectionX++;
  } else if (playerOne.getBody().getDirectionX() + playerOne.getX() < 5) {
    for (GameObject part : playerOne.getParts()) {
      part.setX(1870);
    }
    sectionX--;
  }
  if (playerOne.getBody().getDirectionY() + playerOne.getY() > height - 5) {
    for (GameObject part : playerOne.getParts()) {
      part.setY(50);
    }
    sectionY--;
  } else if (playerOne.getBody().getDirectionY() + playerOne.getY() < 5) {
    for (GameObject part : playerOne.getParts()) {
      part.setY(1030);
    }
    sectionY++;
  }
  playerOne.Swing();
  fill(0);
  if (comboing) {
    text(comboArr[0], 600, 400);
    text(comboArr[1], 650, 400);
    text(comboArr[2], 700, 400);
  }
  fill(0);
  textSize(20);
  text(sectionX, 100, 100);
}
public void endAttack() {
  Section currentSection = Sections.get(sectionY).get(sectionX);
  for (Enemy enemy : currentSection.getEnemies()) {
    enemy.removeInvunerability();
  }
}
void keyPressed() {
  Section currentSection = Sections.get(sectionY).get(sectionX);
  if (key == 'a' || key == 'A') {
    aKey = true;
  }
  if (key == 's' || key == 'S') {
    sKey = true;
  }
  if (key == 'd' || key == 'D') {
    dKey = true;
  }
  if (key == 'w' || key == 'W') {
    wKey = true;
  }
  if (key == 'q' || key == 'Q') {
    qKey = true;
  }
  if (key == 'e' || key == 'E') {
    boolean swordp = false;
    boolean shieldp = false;
    Sword tempsword = playerOne.getSword();
    Shield tempshield= playerOne.getShield();
    for (CustomItemDropInterface item : currentSection.getItems()) {
      if (dist(playerOne.getX(), playerOne.getY(), item.getX(), item.getY()) < 35) {
        if (item.isPickedUp() == false) {
          if (item.getItemType() == 1) {
            shieldp = true;
            playerOne.changeShield((Shield)item.getItem());
          } else if (item.getItemType() == 2) {
            swordp = true;
            playerOne.changeSword((Sword)item.getItem());
          }
          item.setPickedUp();
        }
      }
    }
    if (shieldp) {
      if (!tempshield.getBroken()) {
        currentSection.addItemSh(tempshield, playerOne.getX()+ 20, playerOne.getY()+50);
      }
    }
    if (swordp) {
      if (!(tempsword.getDura() <=0)) {
        currentSection.addItemS(tempsword, playerOne.getX()+ 50, playerOne.getY()+50);
      }
    }
  }
  if (keyCode == SHIFT) {
    ctrlKey = true;
  }
  if (key == 'x') {
    if (sectionX != 0) {
      sectionX--;
    }
  }
  if (key == ' ') {
    spaceKey = true;
  }
}
void mousePressed() {
  spaceKey = true;
  if (mouseButton == RIGHT && comboing == false) {
    comboArr[0] = -1;
    comboArr[1] = -1;
    comboArr[2] = -1;
    comboing = true;
  }
  if (comboing && comboClick == false) {
    if (mouseButton == RIGHT) {
      comboArr[comboStage] = 1;
    }
    if (mouseButton == LEFT) {
      comboArr[comboStage] = 0;
    }
    comboStage++;
    if (comboStage >= 3) {
      text(comboArr[0], 600, 400);
      text(comboArr[1], 650, 400);
      text(comboArr[2], 700, 400);
      comboing = false;
      comboStage = 0;
      playerOne.checkCombo(comboArr);
    }
    comboClick = true;
  }
}
void mouseReleased() {
  spaceKey = false;
  comboClick = false;
}
void keyReleased() {
  if (key == 'a' || key == 'A') {
    aKey = false;
  }
  if (key == 's' || key == 'S') {
    sKey = false;
  }
  if (key == 'd' || key == 'D') {
    dKey = false;
  }
  if (key == 'w' || key == 'W') {
    wKey = false;
  }
  if (key == 'q' || key == 'Q') {
    qKey = false;
  }
  if (key == ' ') {
    spaceKey = false;
  }
  if (keyCode == SHIFT) {
    ctrlKey = false;
  }
}
