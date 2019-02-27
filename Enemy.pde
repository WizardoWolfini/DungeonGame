class Enemy extends GameObject {
  protected boolean canTakeDamage = true;
  protected ArrayList<EnemyArrow> myArrows = new ArrayList<EnemyArrow>();
  protected int fireTimer;
  protected boolean alive;
  protected int shootangle;
  protected int shotsPerSecond;
  protected HealthBar myHpBar;
  Enemy(int sPS) {
    shotsPerSecond = sPS;
    shootangle = 0;
    corners = 4;
    int[] xArray = {-15, -15, 15, 15};
    int[] yArray = {-15, 15, 15, -15};
    xCorners = xArray;
    yCorners = yArray;
    alive = true;
    myCenterX = 100+ Math.random() * 1340;
    myCenterY =  100 + Math.random() * 820;
    myColor = 0;
    myDirectionX = 2*(Math.random() * 2 - 1);
    myDirectionY = 2*(Math.random() * 2 - 1);
    fireTimer = (int)(Math.random() * 50);
    myHpBar = new HealthBar((float)myCenterX, (float)myCenterY, 50, 5, 10);
  }
  Enemy(int x, int y,int sPS) {
    shotsPerSecond = sPS;
    shootangle = 0;
    corners = 4;
    int[] xArray = {-15, -15, 15, 15};
    int[] yArray = {-15, 15, 15, -15};
    xCorners = xArray;
    yCorners = yArray;
    alive = true;
    myCenterX = x;
    myCenterY =  y;
    myColor = 0;
    myDirectionX = 2*(Math.random() * 2 - 1);
    myDirectionY = 2*(Math.random() * 2 - 1);
    fireTimer = (int)(Math.random() * 50);
    myHpBar = new HealthBar((float)myCenterX, (float)myCenterY, 50, 5, 10);
  }
  public boolean getAlive(){
  return alive;
  }
  public void takeDamage(int damage) {
    if (canTakeDamage) {
      myHpBar.damage(damage);
      if (myHpBar.getHp() <= 0) {
        alive = false;
      }
      canTakeDamage = false;
    }
  }
  public void move() {
    myHpBar.move((float)myDirectionX, (float)myDirectionY);
    super.move();
  }
  public void changeDirection() {
    myDirectionX *= -1;
    myDirectionY *= -1;
  }
    public void changeDirectionX() {
    myDirectionX *= -1;
  }
    public void changeDirectionY() {
    myDirectionY *= -1;
  }
  public void removeInvunerability() {
    canTakeDamage = true;
  }
  public void show() {
    if (alive) {
      myHpBar.show();
      super.show();
    }
  }
  public void fireArrow() {
    if (alive) {
      if (fireTimer >= 60/shotsPerSecond) {
        double distx = playerOne.getBody().getX() - myCenterX;
        double angleR = 0;
        double angletemp = Math.acos(distx/dist((float)playerOne.getBody().getX(), (float)playerOne.getBody().getY(), (float)myCenterX, (float)myCenterY));
        if (playerOne.getBody().getY() - myCenterY >= 0) {
          angleR = 180 + angletemp *180/Math.PI;
        } else {
          angleR = 180 - angletemp * 180 / Math.PI;
        }
        myArrows.add(new EnemyArrow(angleR + shootangle, (int)myCenterX, (int)myCenterY));
        fireTimer = 0;
      } else {
        fireTimer++;
      }
    }
  }
  public ArrayList<EnemyArrow> getArrows() {
    return myArrows;
  }
}
