class SwordItemDrop implements CustomItemDropInterface {
  private Sword myItem;
  private int myX;
  private int myY;
  private int myPointDirection;
  private boolean pickedUp = false;
  SwordItemDrop(Sword item, int inX, int inY) {
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
    //rect(-13, -13, 26, 26);
    fill(0);
    beginShape();
    vertex(-13, -11);
    vertex(-9, -5);
    vertex(-13, -1);
    vertex(-11, 1);
    vertex(-7, -3);
    vertex(5, 9);
    vertex(13, 13);
    vertex(9, 5);
    vertex(-3, -7);
    vertex(1, -11);
    vertex(-1, -13);
    vertex(-5, -9);
    vertex(-11, -13);
    endShape(CLOSE);
    rotate(-1*dRadians);
    translate(-1*(float)myX, -1*(float)myY);
  }
  public void showStats() {
    fill(255,150,80);
    textSize(10);
    text("Durability: " + myItem.getDura() + " +" + (myItem.getDura() - playerOne.getSword().getDura()), myX-40, myY + 25);
    text("Attack: " + myItem.getDamage() + " +" + (myItem.getDamage() - playerOne.getSword().getDamage()), myX-40, myY + 35);
    text("SwingSpeed: " + myItem.getSs() + " +" + (myItem.getSs() - playerOne.getSword().getSs()), myX-40, myY + 45);
    text("SwordLength: " + myItem.getSize() + " +" + (myItem.getSize() - playerOne.getSword().getSize()), myX-40, myY + 55);
    textSize(10);
    text(myItem.getname(), myX-45, myY - 25);
  }
  public Sword getItem() {
    return myItem;
  }
  public void rotateItem() {
    myPointDirection += 1;
  }
  public int getX() {
    return myX;
  }
  public int getY() {
    return myY;
  }
  public int getItemType() {
    return 2;
  }
  public boolean isPickedUp() {
    return pickedUp;
  }
  public void setPickedUp() {
    pickedUp = true;
  }
}
