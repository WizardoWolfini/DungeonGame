class PlayerSwingHitbox extends GameObject {
  PlayerSwingHitbox(int myX, int myY) {
    corners = 4;
    int[] xArray = {15, 50, 50, 15};
    int[] yArray = {-30, -30, 30, 30};
    xCorners = xArray;
    yCorners = yArray;
    myColor = 255;
    myCenterX = myX;
    myCenterY = myY;
  }
  public void changeSwordSize(int inLength) {
    int[] xArray = {15, inLength, inLength, 15};
    int[] yArray = {-inLength*2/3, -inLength*2/3, inLength*2/3, inLength*2/3};
    xCorners = xArray;
    yCorners = yArray;
  }
  public void changeSwordWhirlHB(int inLength) {
    int[] xArray = {-inLength, inLength, inLength, -inLength};
    int[] yArray = {-inLength, -inLength, inLength, inLength};
    xCorners = xArray;
    yCorners = yArray;
  }
  public void show(){
  }
}
