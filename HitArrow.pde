class HitArrow extends GameObject {
  private int myDirection;
  HitArrow(double inCX, double inCY, EnemyArrow arrow, int playerDirection) {
    myDirection = playerDirection;
    myCenterX = inCX;
    myCenterY = inCY;
    double diffX = inCX - arrow.getX();
    double diffY = inCY - arrow.getY();
    corners = 2;
    float angleR = (float)(arrow.getPointDirection()*Math.PI/180);
    int[] xArray = {(int)(15 * cos(angleR)), (int)(cos(angleR) * 25)};
    int[] yArray = {(int)(15 * sin(angleR)), (int)(sin(angleR) * 25)};
    xCorners = xArray;
    yCorners = yArray;
    myColor = 0;
  }
  public void setPointDirection(int angle) {
    super.setPointDirection(angle-myDirection);
  }
}
