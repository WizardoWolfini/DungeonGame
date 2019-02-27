class Chest extends GameObject {
  private Shield myShield;
  private Sword mySword;
  private boolean opened;
  public Chest(Shield inSh, Sword inSw, int x, int y) {
    corners = 4;
    int[] xArray = {-25, -25, 25, 25};
    int[] yArray = {-10, 10, 10, -10};
    xCorners = xArray;
    yCorners = yArray;
    myShield = inSh;
    mySword = inSw;
    myColor = 0;
    myCenterX = x;
    myCenterY = y;
    opened = false;
  }
  public void show() {
    if (opened ==false) {
      super.show();
    }
  }
  public void changeSword(Player player) {
    player.changeSword(getSword());
  }
  public void changeShield(Player player) {
    player.changeShield(getShield());
  }
  public Sword getSword() {
    return mySword;
  }
  public Shield getShield() {
    return myShield;
  }
  public void setOpened() {
    opened = true;
  }
  public boolean isOpened() {
    return opened;
  }
}
