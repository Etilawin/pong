void menu() {
  Fond.pause();
  Bravo.pause();
  Ecran.pause();
  // On écrit tout les textes du menu
  fill(TexteR, TexteV, TexteB);
  writeText(menuX, 100, "1 Player");
  writeText(menuX, 200, "2 Player");
  writeText(menuX, 300, "Difficulté");
  writeText(menuX, 400, "Personnaliser");
  writeText(menuX, 500, "Quitter");
  drawCursor(option_selection);
}

void difficulty_menu() {
  // Titres
  fill(TexteR, TexteV, TexteB);
  textFont(font, 50); // Titre principal
  textAlign(CENTER, CENTER);
  text("Changer la difficulté", width/2, 50);

  textFont(font, 32); // Titre secondaire
  textAlign(CENTER, CENTER);
  text("Changer la taille de la barre", width/2, 250);
  text("Changer la vitesse de la balle", width/2, 450);

  text("Appuyer sur m pour revenir au menu", width/2, height - 100);


  // Lignes
  stroke(TexteR, TexteV, TexteB);
  line(width/2 - 200, 300, width/2 + 200, 300);
  line(width/2 - 200, 500, width/2 + 200, 500);


  if (sizeBox.locked) {
    relativeBarSize = height/8 + (sizeBox.x - sizeBox.middle);
  } else {
    sizeBox.x = constrain((relativeBarSize - height/8) + sizeBox.middle, sizeBox.min_x, sizeBox.max_x);
  }
  float max_barSize = height/8 + ((sizeBox.max_x) - sizeBox.middle);
  float min_barSize = height/8 + ((sizeBox.min_x) - sizeBox.middle);
  realBarSize = map(relativeBarSize, min_barSize, max_barSize, 1, height/2);
  text(int(realBarSize), width/2 + 300, 250);

  if (speedBox.locked) {
    relativeSpeed = (speedBox.x - speedBox.min_x);
  } else {
    speedBox.x = relativeSpeed + speedBox.min_x;
  }
  realSpeed = map(relativeSpeed, 0, speedBox.max_x  - speedBox.min_x, 1, 100);
  text(int(realSpeed), width/2 + 300, 500);

  sizeBox.update();
  sizeBox.drawBox();

  speedBox.update();
  speedBox.drawBox();
}

void drawCursor(int option) {
  strokeWeight(3);
  stroke(255, 255, 255);
  line(menuX - 50, 100 * option, menuX - 50, 100 * option + 32); // 32 = taille de la police d'écriture 
  bounceBall(100 * option);
  ball.show();
}

void bounceBall(int y) {
  noStroke();
  fill(ball.R, ball.G, ball.B);
  // On update la ball:
  ball.y = y + (32/2); // Taille des caractères /2
  ball.x += ball.x_speed; // On la fait avancer

  // Si la balle va contre la barre ou contre le mot du menu, on la renvoi dans l'autre sens
  if ((ball.x + 5 >= menuX) || (ball.x - 5 <= menuX - 50)) { 
    ball.x_speed = -ball.x_speed;
    ball.R = random(255);
    ball.G = random(255);
    ball.B = random(255);
  }
}
void personaliser() {
  // Grid
  int rows = 6;
  int cols = 7;
  int col, row; // Valeur actuelle

  // Titres
  fill(TexteR, TexteV, TexteB);
  textFont(font, 50); // Titre principal
  textAlign(CENTER, CENTER);
  text(" Tu peux personnaliser les couleurs ton jeu Pong favori ! :) ", width/2, 50);
  textFont(font, 20);
  stroke(255, 255, 255);

  // Couleur rectangle
  
  row = height/rows; // Première ligne

  //line(0, 160, width, 160); 
  fill(TexteR, TexteV, TexteB);
  text(" Modifie les rectangles ! ", width/2, row + 10);
  
  // Modifie la balle

  row = (height/rows)*2;

  fill(TexteR, TexteV, TexteB);
  // line(0, 360, width, 360);
  text(" Moditife la balle ! ", width/2, row + 10);
  
  // Le bakground

  row = (height/rows)*3;

  // line(0, 560, width, 560);
  fill(TexteR, TexteV, TexteB);
  text("Modifie le fond ! ", width/2, row + 10);
 
  // Couleur du texte

  row = (height/rows)*4;

  fill(TexteR, TexteV, TexteB);
  text("Modifie la couleur du texte !", width/2, row + 10);
  
  row = (height/rows)*5;
    
  fill(TexteR, TexteV, TexteB);
  text("Appuies sur 'm' pour revenir au menu ! ", width/2, row + 10);
  
  rectMode(CENTER);
  
  // On dessine tout les carrés noirs
  col = 0;
  for(int i = 1; i < rows-1; i++){
    fill(0, 0, 0);
    int midx = ((width/cols)*col + (width/cols)*(col+1)) / 2;
    int midy = ((height/rows)*i + (height/rows)*(i+1)) / 2;
    rect(midx, midy, 50, 50);
  }
  
  // les carrés rouge
  col = 1;
  for(int i = 1; i < rows-1; i++){
    fill(255, 0, 0);
    int midx = ((width/cols)*col + (width/cols)*(col+1)) / 2;
    int midy = ((height/rows)*i + (height/rows)*(i+1)) / 2;
    rect(midx, midy, 50, 50);
  }
  
  // les carrés bleu ciel
  col = 2;
  for(int i = 1; i < rows-1; i++){
    fill(0, 128, 255);
    int midx = ((width/cols)*col + (width/cols)*(col+1)) / 2;
    int midy = ((height/rows)*i + (height/rows)*(i+1)) / 2;
    rect(midx, midy, 50, 50);
  }
  
  // les carrés vert clair
  col = 3;
  for(int i = 1; i < rows-1; i++){
    fill(128, 255, 0);
    int midx = ((width/cols)*col + (width/cols)*(col+1)) / 2;
    int midy = ((height/rows)*i + (height/rows)*(i+1)) / 2;
    rect(midx, midy, 50, 50);
  }
  
  // les carrés gris
  col = 4;
  for(int i = 1; i < rows-1; i++){
    fill(128, 128, 128);
    int midx = ((width/cols)*col + (width/cols)*(col+1)) / 2;
    int midy = ((height/rows)*i + (height/rows)*(i+1)) / 2;
    rect(midx, midy, 50, 50);
  }

  // les carrés violets
  col = 5;
  for(int i = 1; i < rows-1; i++){
    fill(64, 0, 128);
    int midx = ((width/cols)*col + (width/cols)*(col+1)) / 2;
    int midy = ((height/rows)*i + (height/rows)*(i+1)) / 2;
    rect(midx, midy, 50, 50);
  }

  // les carrés blancs
  col = 6;
  for(int i = 1; i < rows-1; i++){
    fill(255, 255, 255);
    int midx = ((width/cols)*col + (width/cols)*(col+1)) / 2;
    int midy = ((height/rows)*i + (height/rows)*(i+1)) / 2;
    rect(midx, midy, 50, 50);
  }
  //////////////////////////////////////

  //fill(0, 0, 0);
  //rect(width-(width-20), 450, 50, 50);

  //fill(255, 0, 0);
  //rect(width-(width/1.5), 450, 50, 50);

  //fill(0, 128, 255);
  //rect(width-(width/1.2), 450, 50, 50);

  //fill(128, 255, 0);
  //rect(width-(width/3), 450, 50, 50);

  //fill(128, 128, 128);
  //rect(width-(width/2), 450, 50, 50);

  //fill(64, 0, 128);
  //rect(width-(width/6), 450, 50, 50);


  //fill(255, 255, 255);
  //rect(width-70, 450, 50, 50);
  
  /////////////////////////////////////////////////

  //fill(0, 0, 0);
  //rect(width-(width-20), 650, 50, 50);

  //fill(255, 0, 0);
  //rect(width-(width/1.5), 650, 50, 50);

  //fill(0, 128, 255);
  //rect(width-(width/1.2), 650, 50, 50);

  //fill(128, 255, 0);
  //rect(width-(width/3), 650, 50, 50);

  //fill(128, 128, 128);
  //rect(width-(width/2), 650, 50, 50);

  //fill(64, 0, 128);
  //rect(width-(width/6), 650, 50, 50);

  //fill(255, 255, 255);
  //rect(width-70, 650, 50, 50);

  ////////////////////////////////////////////:

  //fill(0, 0, 0);
  //rect(width-(width-20), 850, 50, 50);

  //fill(255, 0, 0);
  //rect(width-(width/1.5), 850, 50, 50);

  //fill(0, 128, 255);
  //rect(width-(width/1.2), 850, 50, 50);

  //fill(128, 255, 0);
  //rect(width-(width/3), 850, 50, 50);

  //fill(128, 128, 128);
  //rect(width-(width/2), 850, 50, 50);

  //fill(64, 0, 128);
  //rect(width-(width/6), 850, 50, 50);

  //fill(255, 255, 255);
  //rect(width-70, 850, 50, 50);

  int x = mouseX;
  int y = mouseY;

  if (mousePressed && x<(width-(width-20)+50) && x>(width-(width-20)) && y<300 && y>250) {
    RectangleR = 0;
    RectangleV =0;
    RectangleB=0;
  } else if (mousePressed && x<(width-(width/1.5)+50) && x>(width-(width/1.5)) && y<300 && y>250) {
    RectangleR = 255;
    RectangleV =0;
    RectangleB=0;
  } else if (mousePressed && x<(width-(width/1.2)+50) && x>(width-(width/1.2)) && y<300 && y>250) {
    RectangleR = 0;
    RectangleV =128;
    RectangleB=255;
  } else if (mousePressed && x<(width-(width/3)+50) && x>(width-(width/3)) && y<300 && y>250) {
    RectangleR = 128;
    RectangleV =255;
    RectangleB=0;
  } else if (mousePressed && x<(width-(width/2)+50) && x>(width-(width/2)) && y<300 && y>250) {
    RectangleR = 128;
    RectangleV =128;
    RectangleB=128;
  } else if (mousePressed && x<(width-(width/6)+50) && x>(width-(width/6)) && y<300 && y>250) {
    RectangleR = 64;
    RectangleV =0;
    RectangleB=128;
  } else if (mousePressed && x<((width-70)+50) && x>(width-70) && y<300 && y>250) {
    RectangleR = 255;
    RectangleV =255;
    RectangleB=255;
  } else if (mousePressed && x<(width-(width-20)+50) && x>(width-(width-20)) && y<500 && y>450) {
    BalleR = 0;
    BalleV =0;
    BalleB=0;
  } else if (mousePressed && x<(width-(width/1.5)+50) && x>(width-(width/1.5)) && y<500 && y>450) {
    BalleR = 255;
    BalleV =0;
    BalleB=0;
  } else if (mousePressed && x<(width-(width/1.2)+50) && x>(width-(width/1.2)) && y<500 && y>450) {
    BalleR = 0;
    BalleV =128;
    BalleB=255;
  } else if (mousePressed && x<(width-(width/3)+50) && x>(width-(width/3)) && y<500 && y>450) {
    BalleR = 128;
    BalleV =255;
    BalleB=0;
  } else if (mousePressed && x<(width-(width/2)+50) && x>(width-(width/2)) && y<500 && y>450) {
    BalleR = 128;
    BalleV =128;
    BalleB=128;
  } else if (mousePressed && x<(width-(width/6)+50) && x>(width-(width/6)) && y<500 && y>450) {
    BalleR = 64;
    BalleV =0;
    BalleB=128;
  } else if (mousePressed && x<((width-70)+50) && x>(width-70) && y<500 && y>450) {
    BalleR = 255;
    BalleV =255;
    BalleB=255;
  } else if (mousePressed && x<(width-(width-20)+50) && x>(width-(width-20)) && y<700 && y>650) {
    FondR = 0;
    FondV =0;
    FondB=0;
  } else if (mousePressed && x<(width-(width/1.5)+50) && x>(width-(width/1.5)) && y<700 && y>650) {
    FondR = 255;
    FondV =0;
    FondB=0;
  } else if (mousePressed && x<(width-(width/1.2)+50) && x>(width-(width/1.2)) && y<700 && y>650) {
    FondR = 0;
    FondV =128;
    FondB=255;
  } else if (mousePressed && x<(width-(width/3)+50) && x>(width-(width/3)) && y<700 && y>650) {
    FondR = 128;
    FondV =255;
    FondB=0;
  } else if (mousePressed && x<(width-(width/2)+50) && x>(width-(width/2)) && y<700 && y>650) {
    FondR = 128;
    FondV =128;
    FondB=128;
  } else if (mousePressed && x<(width-(width/6)+50) && x>(width-(width/6)) && y<700 && y>650) {
    FondR = 64;
    FondV =0;
    FondB=128;
  } else if (mousePressed && x<((width-70)+50) && x>(width-70) && y<700 && y>650) {
    FondR = 255;
    FondV =255;
    FondB=255;
  } else if (mousePressed && x<(width-(width-20)+50) && x>(width-(width-20)) && y<900 && y>850) {
    TexteR = 0;
    TexteV =0;
    TexteB=0;
  } else if (mousePressed && x<(width-(width/1.5)+50) && x>(width-(width/1.5)) && y<900 && y>850) {
    TexteR = 255;
    TexteV =0;
    TexteB=0;
  } else if (mousePressed && x<(width-(width/1.2)+50) && x>(width-(width/1.2)) && y<900 && y>850) {
    TexteR = 0;
    TexteV =128;
    TexteB=255;
  } else if (mousePressed && x<(width-(width/3)+50) && x>(width-(width/3)) && y<900 && y>850) {
    TexteR = 128;
    TexteV =255;
    TexteB=0;
  } else if (mousePressed && x<(width-(width/2)+50) && x>(width-(width/2)) && y<900 && y>850) {
    TexteR = 128;
    TexteV =128;
    TexteB=128;
  } else if (mousePressed && x<(width-(width/6)+50) && x>(width-(width/6)) && y<900 && y>850) {
    TexteR = 64;
    TexteV =0;
    TexteB=128;
  } else if (mousePressed && x<((width-70)+50) && x>(width-70) && y<900 && y>850) {
    TexteR = 255;
    TexteV =255;
    TexteB=255;
  }
}