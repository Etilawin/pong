class Ball {
  float x, y; // Position
  float y_speed, x_speed; // Vitesse x, y
  float R, G, B; // Couleur R, G, B
  float rad; // rayon

  // Constructeur
  Ball(float temp_x, float temp_y, float x_temp_speed, float y_temp_speed, float temp_rad) {
    R = G = B = 255;
    x = temp_x;
    y = temp_y;
    x_speed = x_temp_speed;
    y_speed = y_temp_speed;
    rad = temp_rad;
  }

  void update() {
    // Met à jour la balle
    if (x >= width || x <= 0) {
      x_speed *= -1; // On renvoit si nécessaire
    } else if (y <= rad || y >= height - rad) {
      y_speed *= -1; // On renvoit si nécessaire
    }
    // On met à jour
    x += x_speed;
    y += y_speed;
  }
  void show() {
    // On dessine
    ellipse(x, y, rad, rad);
  }
}

class Bar {
  PVector pos; // pos x et y
  PVector dim; // Dimension x et y
  float speed; // Vitesse x et y
  float R, G, B; // Couleurs RGB
  boolean upPressed = false;
  boolean downPressed = false;

  Bar(float x, float y, float h, float w, float speed_y) {
    pos = new PVector(x, y);
    dim = new PVector(w, h);
    speed = speed_y;
  }

  void show() {
    // On dessine
    rectMode(CORNER);
    rect(pos.x, pos.y, dim.x, dim.y);
  }
}

class Box {
  float x, y; // Position x et y
  float w, h; // Hauteur et largeur
  boolean locked;
  float max_x, min_x, middle;

  // Constructeur
  Box(float temp_x, float temp_y, float temp_w, float temp_h, float minimum_x, float maximum_x) {
    x = temp_x;
    y = temp_y;
    w = temp_w;
    h = temp_h;
    max_x = maximum_x;
    min_x = minimum_x;
    middle = (max_x + min_x) / 2;
    locked = false;
  }
  
  void isMouseOver(){
    // On est bien en rectMode(CENTER)
    if((mouseX >= x - w/2 && mouseX <= x + w/2) &&
       (mouseY >= y - h/2 && mouseY <= y + h/2)){
      locked = true; // Si la souris est dessus on verrouille la box
    }
  }
  
  void update(){
    // Mettre à jour
    if(locked && 
       mouseX > min_x &&
       mouseX < max_x){
      x = mouseX;
    }
  }

  void drawBox() {
    if (locked){
      fill(255, 0, 0); // Rouge en mouseover
    } else {
      fill(255,255,255); // Blanc sinon
    }
    noStroke();
    rectMode(CENTER);
    rect(x, y, w, h);
  }
}