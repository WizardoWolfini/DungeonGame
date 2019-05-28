class HealthBar {
  private float myLength;
  private float myWidth;
  private float myX;
  private float myY;
  private int hp;
  private int maxhp;
  public HealthBar(float x, float y, float L, float W, int mhp) {
    hp = mhp;
    maxhp = mhp;
    myX = x;
    myY = y;
    myLength = L;
    myWidth = W;
  }
  public void show() {
    noStroke();
    fill(0);
    rect(myX - myLength/2, myY + 25 + myWidth, myLength, myWidth);
    fill(255);
    rect(myX - myLength/2 + 2, myY + 26 + myWidth, myLength - 4, myWidth - 2);
    fill(255, 0, 0);
    rect(myX - myLength/2 + 2, myY + 26 + myWidth, hp*(myLength - 4)/maxhp, myWidth - 2);
  }
  public void setPos(double x, double y) {
    myX = (float)x;
    myY =  (float)y;
  }
  public void move(float x, float y) {
    myX += x;
    myY += y;
  }
  public void damage(int d) {
    hp-=d;
    if(hp < 0){
    hp = 0;
    }
  }
  public int getHp() {
    return hp;
  }
}
