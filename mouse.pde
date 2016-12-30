void mousePressed() {
  if (state == "difficulty") {
    sizeBox.isMouseOver();
    speedBox.isMouseOver();
  }
}

void mouseReleased() {
  if (state == "difficulty") {
    sizeBox.locked = false;
    speedBox.locked = false;
  }
}