class Sword extends GameObject {
  private int myDamage;
  private int myDurability;
  private int myLength;
  private int swingStage = 0;
  private int swing = 0;
  private float swingSpeed = 0;
  private boolean startSwing = false;
  private boolean startWhirl = false;
  private int onWCd = 0;
  private int combo = 0;
  Sword(int intDamage, int intLength, int intDurability, int sS, int myX, int myY) {
    swingSpeed = sS;
    myDamage = intDamage;
    myLength = intLength;
    corners = 4;
    int[] xArray = {0, 0, myLength, myLength};
    int[] yArray = {10, 12, 12, 10};
    xCorners = xArray;
    yCorners = yArray;
    myColor = 0;
    myCenterX = myX;
    myCenterY = myY;
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
  public void Swing() {
    if (startSwing == false) {
      combo = 0;
    }
    if (startSwing && combo == 2) {
      if (swing == 0) {
        swing = 1;
        for (GameObject part : playerOne.getParts()) {
          //part.accelerate(10);
          part.setDirectionX(part.getDirectionX() + 10 *Math.cos(myPointDirection * Math.PI/180));
          part.setDirectionY(part.getDirectionY() +10 *Math.sin(myPointDirection * Math.PI/180));
        }
      } else if (swing == 1) {
        swingStage -= 10;
        if (swingStage <= -180) {
          swing = 2;
        }
      } else if (swing == 2) {
        for (GameObject part : playerOne.getParts()) {
          part.setDirectionX(5 *Math.cos(myPointDirection * Math.PI/180));
          part.setDirectionY(5 *Math.sin(myPointDirection * Math.PI/180));
        }
        swing = 0;
        swingStage = 0;
        combo = 0;
        startSwing = false;
      }
    } else if (startSwing && combo == 1) {
      turn(swingStage);
      if (swing == 0) {
        swingStage += swingSpeed/2;
        if (swingStage >= 45) {
          for (GameObject part : playerOne.getParts()) {
            part.setDirectionX(part.getDirectionX() + 2 *Math.cos(myPointDirection * Math.PI/180));
            part.setDirectionY(part.getDirectionY() +2 *Math.sin(myPointDirection * Math.PI/180));
          }
          swingStage = 45;
          swing = 1;
        }
      } else if (swing == 1) {
        swingStage -= swingSpeed*3;
        if (swingStage <= -90) {
          swing = 2;
          swingStage = -90;
        }
      } else if (swing == 2) {
        swingStage += swingSpeed;
        if (swingStage >= 0) {
          swing = 0;
          swingStage = 0;
          combo = 2;
          startSwing = false;
        }
      }
    } else if (startSwing) {
      turn(swingStage);
      if (swing == 0) {
        swingStage += swingSpeed/2;
        if (swingStage >= 15) {
          swingStage = 15;
          swing = 1;
          for (GameObject part : playerOne.getParts()) {
            part.setDirectionX(part.getDirectionX() + 2 *Math.cos(myPointDirection * Math.PI/180));
            part.setDirectionY(part.getDirectionY() +2 *Math.sin(myPointDirection * Math.PI/180));
          }
        }
      } else if (swing == 1) {
        swingStage -= swingSpeed*3;
        if (swingStage <= -45) {
          swing = 2;
          swingStage = -45;
        }
      }
      if (swing == 2) {
        swingStage += swingSpeed;
        if (swingStage >= 0) {
          swing = 0;
          swingStage = 0;
          combo = 1;
          startSwing = false;
        }
      }
    }
    if (startWhirl) {
      turn(swingStage);
      if (swing == 1) {
        swingStage -= swingSpeed*3;
        if (swingStage <= -720) {
          swing = 2;
          swingStage = -0;
        }
      } else if (swing == 2) {
        swing = 0;
        swingStage = 0;
        startWhirl = false;
      }
    }
    if (onWCd > 0) {
      onWCd-= swingSpeed;
    }else{
    onWCd = 0;
    }
  }
  public void StartWhirlWind() {
    if (onWCd == 0) {
      startWhirl = true;
      swing = 1;
      onWCd = 180;
    }
  }
  public int getSwordSize() {
    return myLength;
  }
  public void StartSwing() {
    if (swing == 0) {
      startSwing = true;
    }
  }
  public int checkSwing() {
    return swing;
  }
  public boolean checkSwingB() {
    return startSwing;
  }
}
