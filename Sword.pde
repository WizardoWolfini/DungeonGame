class Sword extends GameObject {
  private int myDamage;
  private int myDurability;
  private int myLength;
  private int swingStage = 0;
  private int swing = 0;
  private int swingSpeed = 0;
  private boolean startSwing1 = false;
  private boolean startSwing2 = false;
  private boolean startSwing3 = false;
  private int onWCd = 0;
  private int combo = 0;
  private boolean isAttacking = false;
  private boolean dealingDamage = false;
  private boolean SW1 = false;
  private boolean SW2 = false;
  private boolean SC1 = false;
  private String myName;
  private int dash;
  private double dD = 0;
  Sword(int intDamage, int intLength, int intDurability, int sS, int myX, int myY, String name) {
    myName = name;
    swingSpeed = sS;
    myDamage = intDamage;
    myLength = intLength;
    myDurability = intDurability;
    corners = 4;
    int[] xArray = {0, 0, myLength, myLength};
    int[] yArray = {10, 12, 12, 10};
    xCorners = xArray;
    yCorners = yArray;
    myColor = 0;
    myCenterX = myX;
    myCenterY = myY;
  }
  public int getDura() {
    return myDurability;
  }
  public void changeDura(int dura) {
    myDurability = dura;
    myColor = 0;
  }
  public int getSize() {
    return myLength;
  }
  public void changeSwordSize(int intLength) {
    myLength = intLength;
    int[] xArray = {0, 0, myLength, myLength};
    xCorners = xArray;
  }
  public int getDamage() {
    return myDamage;
  }
  public int getSs() {
    return swingSpeed;
  }
  public String getname() {
    return myName;
  }
  public void loseDura() {
    myDurability--;
    if (myDurability <= 0) {
      myDamage = 0;
      myColor = 127;
    }
  }
  public void Swing() {
    if (startSwing3) {
      swingCombo1();
    }
    if (isAttacking == false) {
      if (startSwing1) {
        combo = 3;
        swingStage = 0;
        SW1 = true;
        isAttacking = true;
      } else if (startSwing2) {
        combo = 5;
        swingStage = 0;
        SW2 = true;
        isAttacking = true;
      }
    } else {
      if (SW1 == true) {
        Swing1();
      }
      if (SW2 == true) {
        playerOne.changeSwordWhirlHB(myLength);
        text(comboArr[0], 600, 400);
        text(comboArr[1], 650, 400);
        text(comboArr[2], 700, 400);
        swingWhirlWind();
      }
    }
  }
  public void checkCombo(int[] a) {
    int[] combo1 = {1, 0, 1};
    int[] combo2 = {1, 1, 1};
    if (checkArrs(a, combo1)) {
      startSwing2 = true;
    }
    if (checkArrs(a, combo2)) {
      startSwing3 = true;
      dash = 30;
      dD = playerOne.getPointDirection();
    }
  }
  public boolean checkArrs(int[]a, int[] b) {
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) {
        return false;
      }
    }
    return true;
  }
  public void Swing1() {
    turn(swingStage);
    if (combo == 3) {
      swingStage += swingSpeed/10;
      if (swingStage >= 60) {
        combo = 2;
        dealingDamage = true;
      }
    }
    if (combo == 2) {
      swingStage -= swingSpeed/2;
      if (swingStage <= -50) {
        combo = 1;
        endAttack();
        dealingDamage = false;
      }
    }
    if (combo == 1) {
      swingStage += swingSpeed/10;
      if (swingStage >= 0) {
        swingStage = 0;
        startSwing1 = false;
        SW1 = false;
        isAttacking = false;
      }
    }
  }
  private void swingWhirlWind() {
    turn(swingStage);
    if (combo == 5) {
      swingStage -= 5;
      if (swingStage <= -120) {
        swingStage = -60;
        combo = 4;
        dealingDamage = true;
      }
    }
    if (combo == 4) {
      swingStage += swingSpeed/3;
      if (swingStage >= 360) {
        swingStage = 0;
        combo = 3;
        endAttack();
      }
    }
    if (combo == 3) {
      swingStage += swingSpeed/3;
      if (swingStage >= 360) {
        swingStage = 0;
        combo = 2;
        endAttack();
      }
    }
    if (combo == 2) {
      swingStage += swingSpeed/2;
      if (swingStage >= 360) {
        swingStage = 0;
        combo = 1;
        endAttack();
      }
    }
    if (combo == 1) {
      swingStage += swingSpeed;
      if (swingStage >= 360) {
        swingStage = 0;
        combo = 0;
        endAttack();
        startSwing2 = false;
        SW2 = false;
        isAttacking = false;
        dealingDamage = false;
        playerOne.changeSwordSize(myLength);
      }
    }
  }
  public void swingCombo1() {
    Section currentSection = Sections.get(sectionY).get(sectionX);
    for (GameObject part : playerOne.getParts()) {
      part.setDirectionX((10 + dash/3) *Math.cos(dD * Math.PI/180));
      part.setDirectionY((10 + dash/3) *Math.sin(dD * Math.PI/180));
      part.move();
    }
    for (GameWall wall : currentSection.getWalls()) {
      if (wall.doesIntersect(playerOne.getBody())) {
        double[] newSpeeds = wall.wallSlide(playerOne.getBody());
        for (GameObject playerPart : playerOne.getParts()) {
          playerPart.moveBack();
          playerPart.setDirectionX(newSpeeds[0]);
          playerPart.setDirectionY(newSpeeds[1]);
          playerPart.move();
          dash = 0;
        }
        for (HitArrow arrow : playerOne.getShield().getHitArrows()) {
          arrow.moveBack();
        }
      }
    }
    dash--;
    if (dash <= 0) { 
      dash = 0;
      startSwing3 = false;
    }
  }
  public void StartWhirlWind() {
    //if (onWCd == 0) {
    startSwing2 = true;
    swing = 1;
    onWCd = 180;
    // }
  }
  public int getSwordSize() {
    return myLength;
  }
  public void StartSwing1() {
    if (mouseButton == LEFT) {
      startSwing1 = true;
    }
  }
  public boolean checkSwing() {
    return dealingDamage;
  }
  public boolean checkSwingB() {
    return !isAttacking;
  }
}
