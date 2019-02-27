class EnemyBurst extends Enemy {
  private int arrowsReady;
  private int fireTimer2;
  public EnemyBurst(int sPS) {
    super(sPS);
    arrowsReady = 0;
    fireTimer2 = 0;
  }
    public EnemyBurst(int x, int y,int sPS) {
    super(x, y,sPS);
    arrowsReady = 0;
    fireTimer2 = 0;
  }
  public void fireArrow() {
    if (alive) {
      if (fireTimer >= 300/shotsPerSecond) {
        arrowsReady = 5;
        fireTimer = 0;
      } else {
        fireTimer++;
      }
      if(fireTimer2 >3 && arrowsReady > 0){
      double distx = playerOne.getBody().getX() - myCenterX;
      double angleR = 0;
      double angletemp = Math.acos(distx/dist((float)playerOne.getBody().getX(), (float)playerOne.getBody().getY(), (float)myCenterX, (float)myCenterY));
      if (playerOne.getBody().getY() - myCenterY >= 0) {
        angleR = 180 + angletemp *180/Math.PI;
      } else {
        angleR = 180 - angletemp * 180 / Math.PI;
      }
      myArrows.add(new EnemyArrow(angleR + shootangle, (int)myCenterX, (int)myCenterY));
      fireTimer2 = 0;
      arrowsReady--;
      } else{
      fireTimer2++;
      }
    }
  }
}
