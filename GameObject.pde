class GameObject
{   
  protected int corners; 
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    

  public void setY(int y) {
    myCenterY = y;
  }   
  public int getY() {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) {
    myDirectionX = x;
  }
  public double getDirectionX() {
    return myDirectionX;
  }
  public int getSignDirectionX() {
    if (myDirectionX > 0) {
      return 1;
    } else if (myDirectionX < 0) {
      return -1;
    } else {
      return 1;
    }
  }
  public int getSignDirectionY() {
    if (myDirectionY > 0) {
      return 1;
    } else if (myDirectionY < 0) {
      return -1;
    } else {
      return 1;
    }
  }
  public void setDirectionY(double y) {
    myDirectionY = y;
  }   
  public double getDirectionY() {
    return myDirectionY;
  }   
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }  
  public double getPointDirection() {
    return myPointDirection;
  }
  public void setX(int x) {
    myCenterX = x;
  }
  public int getX() {
    return (int)myCenterX;
  }

  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));
  }
  public void slowdown() {
    if (myDirectionX > 0) {
      myDirectionX -= .1;
    }
    if (myDirectionX < 0) {
      myDirectionX += .1;
    }
    if (myDirectionY > 0) {
      myDirectionY -= .1;
    }
    if (myDirectionY < 0) {
      myDirectionY += .1;
    }
  }
  public void accelerateangle (double dAmount, int degree) {
    double dRadians =(degree)*(Math.PI/180); 
    myDirectionX += ((dAmount) * Math.cos(dRadians));
    myDirectionY += ((dAmount) * Math.sin(dRadians));
    if (myDirectionX > 3) {
      myDirectionX -= .5 + Math.abs((dAmount) * Math.cos(dRadians));
    }
    if (myDirectionX < -3) {
      myDirectionX += .5 + Math.abs((dAmount) * Math.cos(dRadians));
    }
    if (myDirectionY > 3) {
      myDirectionY -= .5 + Math.abs((dAmount) * Math.sin(dRadians));
    }
    if (myDirectionY < -3) {
      myDirectionY += .5 + Math.abs((dAmount) * Math.sin(dRadians));
    }
  }
    public void accelerateangle (double dAmount, int degree,boolean t) {
      if(!t){
    double dRadians =(degree)*(Math.PI/180); 
    myDirectionX += ((dAmount) *  4 * Math.cos(dRadians));
    myDirectionY += ((dAmount) * 4 * Math.sin(dRadians));
    if (myDirectionX > 6) {
      myDirectionX -= .5 + Math.abs((dAmount) * Math.cos(dRadians));
    }
    if (myDirectionX < -6) {
      myDirectionX += .5 + Math.abs((dAmount) * Math.cos(dRadians));
    }
    if (myDirectionY > 6) {
      myDirectionY -= .5 + Math.abs((dAmount) * Math.sin(dRadians));
    }
    if (myDirectionY < -6) {
      myDirectionY += .5 + Math.abs((dAmount) * Math.sin(dRadians));
    }
      }else{
      accelerateangle(dAmount, degree);
      }
  }
  public void turn (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;    
    //wrap around screen    
    if (myCenterX >width)
    {     
      myDirectionX *= -1;
    } else if (myCenterX<0)
    {     
      myDirectionX *= -1;
    }    
    if (myCenterY >height)
    {    
      myDirectionY *= -1;
    } else if (myCenterY < 0)
    {     
      myDirectionY *= -1;
    }
  }
  public void moveBack ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX -= myDirectionX;    
    myCenterY -= myDirectionY;    
    //wrap around screen    
    if (myCenterX >width)
    {     
      myCenterX = 0;
    } else if (myCenterX<0)
    {     
      myCenterX = width;
    }    
    if (myCenterY >height)
    {    
      myCenterY = 0;
    } else if (myCenterY < 0)
    {     
      myCenterY = height;
    }
  }  
  public void show ()  //Draws the floater at the current position  
  { 
    fill(myColor);   
    stroke(myColor);    

    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));

    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);

    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
  public boolean doesIntersect(GameObject gameObj)
  {
    boolean intersection = false;
    for (int k=0; k < gameObj.getXCorners().length; k++)
    {
      if (doesIntersectAtPoint(gameObj.getXCorners()[k] + gameObj.getX(), gameObj.getYCorners()[k] + gameObj.getY()))
      {
        intersection = true;
      }
    }
    return intersection;
  }
  private boolean doesIntersectAtPoint(int x, int y)
  {
    int[] xVertex = new int[corners];
    int[] yVertex = new int[corners];
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    for (int i=0; i < corners; i++)
    {
      xVertex[i] = (int)(xCorners[i]*Math.cos(dRadians) - yCorners[i]*Math.sin(dRadians)) + (int)myCenterX;
      yVertex[i] = (int)(xCorners[i]*Math.sin(dRadians) + yCorners[i]*Math.cos(dRadians)) + (int)myCenterY;
    }

    return pnpoly(corners, xVertex, yVertex, x, y);
  }

  protected boolean pnpoly(int nvert, int[] vertx, int[] verty, int testx, int testy)
  {
    int i, j;
    boolean c = false;
    for (i = 0, j = nvert-1; i < nvert; j = i++) {
      if (((verty[i]>testy) != (verty[j]>testy)) && (testx < (vertx[j]-vertx[i]) * (testy-verty[i]) / (verty[j]-verty[i]) + vertx[i]))
      {
        c = !c;
      }
    }
    return c;
  }
  public int[] getXCorners() {
    return xCorners;
  }
  public int[] getYCorners() {
    return yCorners;
  }
}
