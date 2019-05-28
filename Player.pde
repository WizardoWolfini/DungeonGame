class Player {
  private Shield myShield;
  private Sword mySword;
  private Body myBody;
  private HealthBar hpb;
  private PlayerSwingHitbox myHitHitbox;
  private ArrayList<GameObject> myParts = new ArrayList<GameObject>();
  Player(int myX, int myY) {
    hpb = new HealthBar(myX, myY, 100, 10, 10);
    myBody = new Body(myX, myY);
    mySword = new Sword(1, 25, 250, 50, myX, myY, "Starter Sword");
    myShield = new Shield(1, 10, 0, myX, myY);
    myHitHitbox = new PlayerSwingHitbox(myX, myY);
    myShield.shieldBreak();
    myParts.add(myBody);
    myParts.add(mySword);
    myParts.add(myShield);
    myParts.add(myHitHitbox);
  }
  public void changeSwordWhirlHB(int inLength) {
    myHitHitbox.changeSwordWhirlHB(inLength);
  }
  public boolean getShieldStatus() {
    return myShield.getBroken();
  }
  public boolean doesBodyIntersect(EnemyArrow arrow) {
    return myBody.doesIntersect(arrow);
  }
  public void loseSwDura() {
    mySword.loseDura();
  }
  public void getHitArrow(EnemyArrow arrow) {
    hpb.damage(1);
  }
  public void addArrow(EnemyArrow arrow) {
    myShield.addArrow(arrow);
    for (GameObject part : myParts) {
      part.setDirectionX(part.getDirectionX() + arrow.getDirectionX()/8);
      part.setDirectionY(part.getDirectionY() + arrow.getDirectionY()/8);
    }
  }
  public boolean doesShieldIntersect(EnemyArrow arrow) {
    return myShield.doesIntersect(arrow);
  }
  public void accelerate() {
    double distx = playerOne.getBody().getX() - mouseX;
    double angleR = 0;
    double angletemp = Math.acos(distx/dist((float)playerOne.getBody().getX(), (float)playerOne.getBody().getY(), (float)mouseX, (float)mouseY));
    if (playerOne.getY() - mouseY >= 0) {
      angleR = 180 + angletemp *180/Math.PI;
    } else {
      angleR = 180 - angletemp * 180 / Math.PI;
    }
    double speedPlayer = 2;
    boolean moving = false;
    for (GameObject playerPart : getParts()) {
      playerPart.show();
      double tspeedPlayer = speedPlayer;
      playerPart.setDirectionX(0);
      playerPart.setDirectionY(0);
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
      if ((wKey || aKey || sKey || dKey)) {
        playerPart.move();
      }
    }
    hpb.show();
    hpb.setPos(getX(), getY());
  }
  public void shieldMoveArrows() {
    myShield.moveArrows();
  }
  public void shieldBreak() {
    myShield.shieldBreak();
  }
  public void changeSwordSize(int intLength) {
    myHitHitbox.changeSwordSize(intLength);
    mySword.changeSwordSize(intLength);
  }
  public void changeSwordDura(int dura) {
    mySword.changeDura(dura);
  }
  public void StartSwing1() {
    mySword.StartSwing1();
  }
  public void checkCombo(int [] a) {
    mySword.checkCombo(a);
  }
  public double getPointDirection() {
    return myBody.getPointDirection();
  }
  public void Swing() {
    mySword.Swing();
  }
  public void StartWhirlWind() {
    mySword.StartWhirlWind();
  }
  public boolean checkSwing() {
    return mySword.checkSwing();
  }
  public boolean checkSwingB() {
    return mySword.checkSwingB();
  }
  public Sword getSword() {
    return mySword;
  }
  public Shield getShield() {
    return myShield;
  }
  public Body getBody() {
    return myBody;
  }
  public int getX() {
    return myBody.getX();
  }
  public int getY() {
    return myBody.getY();
  }
  public ArrayList<GameObject> getParts() {
    return myParts;
  }
  public PlayerSwingHitbox getHitHitBox() {
    return myHitHitbox;
  }
  public void changeSword(Sword inSword) {
    double tempX = mySword.getDirectionX();
    double tempY = mySword.getDirectionY();
    mySword = inSword;
    myParts.set(1, mySword);
    mySword.setDirectionX(tempX);
    mySword.setDirectionY(tempY);
    mySword.setX(getX());
    mySword.setY(getY());
    changeSwordSize(mySword.getSize());
    changeSwordDura(mySword.getDura());
  }
  public void changeShield(Shield inShield) {
    double tempX = myShield.getDirectionX();
    double tempY = myShield.getDirectionY();
    myShield = inShield;
    myParts.set(2, myShield);
    myShield.setBroken(false);
    myShield.setDirectionX(tempX);
    myShield.setDirectionY(tempY);
    myShield.setX(getX());
    myShield.setY(getY());
  }
}
