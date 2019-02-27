class EnemyArrow extends GameObject {
  protected double myEntryAngle;
  private boolean ifAlive;
  EnemyArrow(double angle, int myX, int myY) {
    corners = 4;
    int[] xArray = {0, 0, 10, 10};
    int[] yArray = {0, 0, 0, 0};
    xCorners = xArray;
    yCorners = yArray;
    myColor = 0;
    myPointDirection = angle;
    accelerate(-5);
    myCenterX = myX;
    myCenterY = myY;
    ifAlive = true;
  }
  public void stopMove() {
    myDirectionX = 0;
    myDirectionY = 0;
    myEntryAngle = myPointDirection;
  }
  public void show(){
  if(ifAlive){
  super.show();
  }
  }
   public void kill(){
  ifAlive = false;
  }
  public boolean getAlive(){
  return ifAlive;
  }
}
