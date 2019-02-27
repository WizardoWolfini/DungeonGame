class EnemySprinkler extends Enemy {
  public EnemySprinkler(int sPS) {
    super(sPS);
    fireTimer = (int)(Math.random() *150) * -1;
  }
  public EnemySprinkler(int x, int y,int sPS) {
    super(x, y, sPS);
    fireTimer =  (int)(Math.random() *150) * -1;
  }
  public void fireArrow() {
    if (alive) {
      if (fireTimer >= 10/shotsPerSecond) {
        double distx = playerOne.getBody().getX() - myCenterX;
        double angleR = 0;
        double angletemp = Math.acos(distx/dist((float)playerOne.getBody().getX(), (float)playerOne.getBody().getY(), (float)myCenterX, (float)myCenterY));
        if (playerOne.getBody().getY() - myCenterY >= 0) {
          angleR = 180 + angletemp *180/Math.PI;
        } else {
          angleR = 180 - angletemp * 180 / Math.PI;
        }
        myArrows.add(new EnemyArrow(shootangle, (int)myCenterX, (int)myCenterY));
        shootangle += 15;
        fireTimer = 0;
        if (shootangle > 360) {
          fireTimer = -50;
          shootangle = 0;
        }
      } else {
        fireTimer++;
      }
    }
  }
}
