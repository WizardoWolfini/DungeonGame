class Shield extends GameObject {
  private double myDamage;
  private int myDurability;
  private int myLength;
  private boolean broken;
  private ArrayList<HitArrow> hitArrows = new ArrayList<HitArrow>();
  Shield(double intDamage, int intLength, int intDurability, int myX, int myY) {
    myLength = intLength;
    myDurability = intDurability;
    broken = false;
    corners = 8;
    int[] xArray = {8, 8, 18, 18, 8, 8, 11, 11};
    int[] yArray = {4+myLength, 6+myLength, myLength, -myLength, -6-myLength, -4-myLength, 2-myLength, myLength - 2};
    xCorners = xArray;
    yCorners = yArray;
    myColor = 0;
    myCenterX = myX;
    myCenterY = myY;
  }
  public int getDura(){
  return myDurability;
  }
  public boolean getBroken(){
  return broken;
  }
  public void addArrow(EnemyArrow arrow) {
    if (arrow.getPointDirection() >= myPointDirection - 90 && arrow.getPointDirection() <= myPointDirection + 30) {
      hitArrows.add(new HitArrow(myCenterX, myCenterY, arrow, (int)playerOne.getBody().getPointDirection()));
    }
  }
  public void shieldBreak() {
    if (hitArrows.size() > myDurability || myDurability == 0) {
      hitArrows = new ArrayList<HitArrow>();
      broken = true;
    }
  }
  public void show() {
    if (broken == false && ctrlKey) {
      super.show();
       //myColor = 0;
    } else {
      //myColor = 80;
    }
  }
  public void moveArrows() {
    for (HitArrow arrow : hitArrows) {
      if(ctrlKey){
      arrow.show();
      }
      arrow.move();

    }
  }
  public void setBroken(boolean b){
  broken = b;
  }
  public ArrayList<HitArrow> getHitArrows() {
    return hitArrows;
  }
}
