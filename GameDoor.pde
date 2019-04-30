class GameDoor extends GameWall {
  private int maxOpen;
  private boolean opening;
  private boolean closing;
  GameDoor(int inLength, int rotation, int inWidth, double inX, double inY) {
    super( inLength, rotation, inWidth, inX, inY);
    isDoor = true;
    if (rotation == 90) {
      maxOpen = (int)myCenterY + myLength - 5;
    } else {
      maxOpen = (int)myCenterX + myLength - 5;
    }
  }
  public void OpenDoor() {
    opening = true;
    closing = false;
  }
  public void CloseDoor() {
    closing = true;
    opening = false;
  }
  public boolean checkOpening() {
    return opening;
  }
  public boolean checkClosing() {
    return closing;
  }
  public void OpenUp() {
    if (myPointDirection == 90) {
      if (opening) {
        if (myCenterY < maxOpen) {
          myCenterY += myLength/20;
        } else {
          myCenterY = maxOpen;
        }
      }
    } else {
      if (opening) {
        if (myCenterX < maxOpen) {
          myCenterX += myLength/20;
        } else {
          myCenterX = maxOpen;
        }
      }
    }
  }
  public void CloseUp() {
    if (myPointDirection == 90) {
      if (closing) {
        if (myCenterY > maxOpen - myLength + 5) {
          myCenterY -= myLength/20;
        } else {
          myCenterY = maxOpen - myLength + 5;
        }
      }
    } else {
      if (closing) {
        if (myCenterX > maxOpen - myLength + 5) {
          myCenterX -= myLength/20;
        } else {
          myCenterX = maxOpen - myLength + 5;
        }
      }
    }
  }
}
