class Body extends GameObject {
  Body(int myX, int myY) {
    corners = 8;
    int[] xArray = {-5,5,10,10,5,-5,-10,-10};
    int[] yArray = {10,10,5,-5,-10,-10,-5,5};
    xCorners = xArray;
    yCorners = yArray;
    myColor = 0;
    myCenterX = myX;
    myCenterY = myY;
  }
}
