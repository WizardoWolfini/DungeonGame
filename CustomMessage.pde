class CustomMessage {
  private String message;
  private int myX;
  private int myY;
  public CustomMessage(String inM, int inX, int inY) {
    message = inM;
    myX = inX;
    myY = inY;
  }
  public int getX() {
    return myX;
  }
  public int getY() {
    return myY;
  }
  public String getMessage(){
  return message;
  }
}
