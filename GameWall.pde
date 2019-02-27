class GameWall extends GameObject {
  protected boolean isDoor = false;
  protected int myLength;
  protected double originalX;
  protected double originalY;
  GameWall(int inLength, int rotation, int inWidth, double inX, double inY) {
    corners = 4;
    int[] xArray = {-inLength/2, -inLength/2, inLength/2, inLength/2};
    int[] yArray = {-inWidth/2, inWidth/2, inWidth/2, -inWidth/2};
    xCorners = xArray;
    yCorners = yArray;
    myCenterX = inX;
    myCenterY = inY;
    myLength = inLength;
    myPointDirection = rotation;
    originalX = inX;
    originalY = inY;
  }
  public double[] wallSlide(GameObject obj) {
    double[] velocities = new double[2];
    double angleR = myPointDirection/180 * Math.PI;
    double absoluteSpeed = Math.sqrt(obj.getDirectionX() * obj.getDirectionX() + obj.getDirectionY() * obj.getDirectionY());

    //velocities[0] = obj.getSignDirectionY() * obj.getSignDirectionX() * absoluteSpeed * cos((float)angleR);
    //velocities[1] = obj.getSignDirectionY() * obj.getSignDirectionX() * absoluteSpeed * sin((float)angleR);
    velocities[0] = obj.getDirectionX() * -.5;
    velocities[1] = obj.getDirectionY() * -.5;
    return velocities;
  }
  public boolean getIsDoor() {
    return isDoor;
  }
  public double getOX() {
    return originalX;
  }
  public double getOY() {
    return originalY;
  }
}
