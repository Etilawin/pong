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
  PVector scl = new PVector(width/cols, height/rows);
  // scl * k -> avec k la colonne ou la ligne correspondnte
  PVector[] squares = new PVector[28]; // On suit la trace de tout les carrés

  // Titres
  fill(TexteR, TexteV, TexteB);
  textFont(font, 50); // Titre principal
  textAlign(CENTER, CENTER);
  text(" Tu peux personnaliser les couleurs ton jeu Pong favori ! :) ", width/2, 50);
  textFont(font, 20);
  stroke(255, 255, 255);

  // Couleur rectangle

  //line(0, 160, width, 160); 
  fill(TexteR, TexteV, TexteB);
  text(" Modifie les rectangles ! ", width/2, scl.y + 10);

  // Modifie la balle

  fill(TexteR, TexteV, TexteB);
  // line(0, 360, width, 360);
  text(" Moditife la balle ! ", width/2, scl.y*2 + 10);

  // Le bakground

  // line(0, 560, width, 560);
  fill(TexteR, TexteV, TexteB);
  text("Modifie le fond ! ", width/2, scl.y*3 + 10);

  // Couleur du texte

  fill(TexteR, TexteV, TexteB);
  text("Modifie la couleur du texte !", width/2, scl.y*4 + 10);

  // Menu

  fill(TexteR, TexteV, TexteB);
  text("Appuies sur 'm' pour revenir au menu ! ", width/2, scl.y*5 + 10);

  // On dessine tout les carrés noirs
  for (int i = 1; i < rows-1; i++) {
    fill(0, 0, 0);
    float midx = scl.x/2;
    float midy = scl.y*i + scl.y/2;
    rect(midx - 25, midy - 25, 50, 50);
    squares[i-1] = new PVector(midx - 25, midy - 25);
  }

  // les carrés rouge
  for (int i = 1; i < rows-1; i++) {
    fill(255, 0, 0);
    float midx = scl.x + scl.x/2;
    float midy = scl.y*i + scl.y/2;
    rect(midx - 25, midy - 25, 50, 50);
    squares[4 + (i-1)] = new PVector(midx - 25, midy - 25);
  }

  // les carrés bleu ciel
  for (int i = 1; i < rows-1; i++) {
    fill(0, 128, 255);
    float midx = scl.x*2 + scl.x/2;
    float midy = scl.y*i + scl.y/2;
    rect(midx - 25, midy - 25, 50, 50);
    squares[8 + (i-1)] = new PVector(midx - 25, midy - 25);
  }

  // les carrés vert clair
  for (int i = 1; i < rows-1; i++) {
    fill(128, 255, 0);
    float midx = scl.x*3 + scl.x/2;
    float midy = scl.y*i + scl.y/2;
    rect(midx - 25, midy - 25, 50, 50);
    squares[12 + (i-1)] = new PVector(midx - 25, midy - 25);
  }

  // les carrés gris
  for (int i = 1; i < rows-1; i++) {
    fill(128, 128, 128);
    float midx = scl.x*4 + scl.x/2;
    float midy = scl.y*i + scl.y/2;
    rect(midx - 25, midy - 25, 50, 50);
    squares[16 + (i-1)] = new PVector(midx - 25, midy - 25);
  }

  // les carrés violets
  for (int i = 1; i < rows-1; i++) {
    fill(64, 0, 128);
    float midx = scl.x*5 + scl.x/2;
    float midy = scl.y*i + scl.y/2;
    rect(midx - 25, midy - 25, 50, 50);
    squares[20 + (i-1)] = new PVector(midx - 25, midy - 25);
  }

  // les carrés blancs
  for (int i = 1; i < rows-1; i++) {
    fill(255, 255, 255);
    float midx = scl.x*6 + scl.x/2;
    float midy = scl.y*i + scl.y/2;
    rect(midx - 25, midy - 25, 50, 50);
    squares[24 + (i-1)] = new PVector(midx - 25, midy - 25);
  }

  if (mousePressed && mouseX > squares[0].x && mouseX < squares[0].x + 50 && mouseY > squares[0].y && mouseY < squares[0].y + 50) {
    RectangleR = 0;
    RectangleV = 0;
    RectangleB = 0;
  } else if (mousePressed && mouseX > squares[4].x && mouseX < squares[4].x + 50 && mouseY > squares[4].y && mouseY < squares[4].y + 50) {
    RectangleR = 255;
    RectangleV = 0;
    RectangleB = 0;
  } else if (mousePressed && mouseX > squares[8].x && mouseX < squares[8].x + 50 && mouseY > squares[8].y && mouseY < squares[8].y + 50) {
    RectangleR = 0;
    RectangleV = 128;
    RectangleB=255;
  } else if (mousePressed && mouseX > squares[12].x && mouseX < squares[12].x + 50 && mouseY > squares[12].y && mouseY < squares[12].y + 50) {
    RectangleR = 128;
    RectangleV =255;
    RectangleB=0;
  } else if (mousePressed && mouseX > squares[16].x && mouseX < squares[16].x + 50 && mouseY > squares[16].y && mouseY < squares[16].y + 50) {
    RectangleR = 128;
    RectangleV =128;
    RectangleB=128;
  } else if (mousePressed && mouseX > squares[20].x && mouseX < squares[20].x + 50 && mouseY > squares[20].y && mouseY < squares[20].y + 50) {
    RectangleR = 64;
    RectangleV =0;
    RectangleB=128;
  } else if (mousePressed && mouseX > squares[24].x && mouseX < squares[24].x + 50 && mouseY > squares[24].y && mouseY < squares[24].y + 50) {
    RectangleR = 255;
    RectangleV =255;
    RectangleB=255;
  } else if (mousePressed && mouseX > squares[1].x && mouseX < squares[1].x + 50 && mouseY > squares[1].y && mouseY < squares[1].y + 50) {
    BalleR = 0;
    BalleV =0;
    BalleB=0;
  } else if (mousePressed && mouseX > squares[5].x && mouseX < squares[5].x + 50 && mouseY > squares[5].y && mouseY < squares[5].y + 50) {
    BalleR = 255;
    BalleV =0;
    BalleB=0;
  } else if (mousePressed && mouseX > squares[9].x && mouseX < squares[9].x + 50 && mouseY > squares[9].y && mouseY < squares[9].y + 50) {
    BalleR = 0;
    BalleV =128;
    BalleB=255;
  } else if (mousePressed && mouseX > squares[13].x && mouseX < squares[13].x + 50 && mouseY > squares[13].y && mouseY < squares[13].y + 50) {
    BalleR = 128;
    BalleV =255;
    BalleB=0;
  } else if (mousePressed && mouseX > squares[17].x && mouseX < squares[17].x + 50 && mouseY > squares[17].y && mouseY < squares[17].y + 50) {
    BalleR = 128;
    BalleV =128;
    BalleB=128;
  } else if (mousePressed && mouseX > squares[21].x && mouseX < squares[21].x + 50 && mouseY > squares[21].y && mouseY < squares[21].y + 50) {
    BalleR = 64;
    BalleV =0;
    BalleB=128;
  } else if (mousePressed && mouseX > squares[25].x && mouseX < squares[25].x + 50 && mouseY > squares[25].y && mouseY < squares[25].y + 50) {
    BalleR = 255;
    BalleV =255;
    BalleB=255;
  } else if (mousePressed && mouseX > squares[2].x && mouseX < squares[2].x + 50 && mouseY > squares[2].y && mouseY < squares[2].y + 50) {
    FondR = 0;
    FondV =0;
    FondB=0;
  } else if (mousePressed && mouseX > squares[6].x && mouseX < squares[6].x + 50 && mouseY > squares[6].y && mouseY < squares[6].y + 50) {
    FondR = 255;
    FondV =0;
    FondB=0;
  } else if (mousePressed && mouseX > squares[10].x && mouseX < squares[10].x + 50 && mouseY > squares[10].y && mouseY < squares[10].y + 50) {
    FondR = 0;
    FondV =128;
    FondB=255;
  } else if (mousePressed && mouseX > squares[14].x && mouseX < squares[14].x + 50 && mouseY > squares[14].y && mouseY < squares[14].y + 50) {
    FondR = 128;
    FondV =255;
    FondB=0;
  } else if (mousePressed && mouseX > squares[18].x && mouseX < squares[18].x + 50 && mouseY > squares[18].y && mouseY < squares[18].y + 50) {
    FondR = 128;
    FondV =128;
    FondB=128;
  } else if (mousePressed && mouseX > squares[22].x && mouseX < squares[22].x + 50 && mouseY > squares[22].y && mouseY < squares[22].y + 50) {
    FondR = 64;
    FondV =0;
    FondB=128;
  } else if (mousePressed && mouseX > squares[26].x && mouseX < squares[26].x + 50 && mouseY > squares[26].y && mouseY < squares[26].y + 50) {
    FondR = 255;
    FondV =255;
    FondB=255;
  } else if (mousePressed && mouseX > squares[3].x && mouseX < squares[3].x + 50 && mouseY > squares[3].y && mouseY < squares[3].y + 50) {
    TexteR = 0;
    TexteV =0;
    TexteB=0;
  } else if (mousePressed && mouseX > squares[7].x && mouseX < squares[7].x + 50 && mouseY > squares[7].y && mouseY < squares[7].y + 50) {
    TexteR = 255;
    TexteV =0;
    TexteB=0;
  } else if (mousePressed && mouseX > squares[11].x && mouseX < squares[11].x + 50 && mouseY > squares[11].y && mouseY < squares[11].y + 50) {
    TexteR = 0;
    TexteV =128;
    TexteB=255;
  } else if (mousePressed && mouseX > squares[15].x && mouseX < squares[15].x + 50 && mouseY > squares[15].y && mouseY < squares[15].y + 50) {
    TexteR = 128;
    TexteV =255;
    TexteB=0;
  } else if (mousePressed && mouseX > squares[19].x && mouseX < squares[19].x + 50 && mouseY > squares[19].y && mouseY < squares[19].y + 50) {
    TexteR = 128;
    TexteV =128;
    TexteB=128;
  } else if (mousePressed && mouseX > squares[23].x && mouseX < squares[23].x + 50 && mouseY > squares[23].y && mouseY < squares[23].y + 50) {
    TexteR = 64;
    TexteV =0;
    TexteB=128;
  } else if (mousePressed && mouseX > squares[27].x && mouseX < squares[27].x + 50 && mouseY > squares[27].y && mouseY < squares[27].y + 50) {
    TexteR = 255;
    TexteV =255;
    TexteB=255;
  }
}