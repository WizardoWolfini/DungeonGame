class ShieldItemDrop implements CustomItemDropInterface {
  private Shield myItem;
  private int myX;
  private int myY;
  private int myPointDirection;
  private boolean pickedUp = false;
  ShieldItemDrop(Shield item, int inX, int inY) {
    myItem = item;
    myX = inX;
    myPointDirection = 0;
    myY = inY;
  }
  public void show() {
    translate((float)myX, (float)myY);
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    rotate(dRadians);
    noFill();
    rect(-13, -13, 26, 26);
    fill(0);
   beginShape();
    vertex(-12, 7);
    vertex(0, 11);
    vertex(12, 7);
    vertex(9,-7);
    vertex(0,-12);
    vertex(-9,-7);
    endShape(CLOSE);
    rotate(-1*dRadians);
    translate(-1*(float)myX, -1*(float)myY);
  }
  public Shield getItem() {
    return myItem;
  }
  public void rotateItem() {
    myPointDirection += 1;
  }
  public int getX(){
  return myX;
  }
  public int getY(){
  return myY;
  }
  public int getItemType(){
  return 1;
  }
  public boolean isPickedUp(){
  return pickedUp;
  }
  public void setPickedUp(){
  pickedUp = true;
  }
}
