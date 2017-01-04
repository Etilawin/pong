void keyPressed() {
  if (state == "deux_joueurs") {
    // Défini toutes les touches pour chaque ecran
    if (EcranPrincipal) { //Dans l'écran principal
      if (key == ' ') { //Si le joueur appuie sur entrer 
        EcranPrincipal = false; // l'écran se ferme
        Jouer = true; //l'écran de jeu se met
      }
    } else if (Jouer) { //si dans le menu jouer
      if (key == CODED) { //key == coded est mit pour voir si le joueur appuie sur une touche, et spécifiquement si se sont les flèches du clavier (ou alt etc...)
        if (keyCode == UP) { //Si le joueur appuie sur la flèche du haut
          upPressed = true; //J1 peut monter
        } else if (keyCode == DOWN) { //Si le joueur appuie sur la flèche du bas
          downPressed = true; //J1 peut descendre
        }
      }
      if (key == 'Z' || key == 'z') { //si le joueur appuie sur z ou sa majuscule
        zPressed = true; //J2 peut monter
      } else if (key == 'S' || key == 's') { //si le joueur appuie sur s ou sa majuscule
        sPressed = true; //J2 peut descendre
      }
    } else if (Perdu) { //si c'est l'écran Perdu
      if (key == ' ') { // si le joueur appuie sur entrer
        Perdu = false; // l'écran perdu se ferme
        EcranPrincipal = true; //l'écran principale s'affiche
        // On remet les rectangles au milieu
        Joueur1rectY = height/2; 
        Joueur2rectY = height/2;
        // On remet la balle au milieu
        balleX = width/2;
        balleY = width/2;
        // On remet les scores à 0
        Joueur1Score = 0;
        Joueur2Score = 0;
      } else if (key == 'm') {
        // On retourne au menu
        init = false;
        state = "menu";
        inite = false;
        Joueur1Score = 0;
        Joueur2Score = 0;
        debut.play();
        debut.loop(2547);
      }
    }
  } else if (state == "menu") {
    // Le curseur va vers le haut ou vers le bas en fonction de ce qui est entré
    if (keyCode == UP) {
      option_selection -= 1;
      if (option_selection < 1) {
        option_selection = 5;
      } // Pas trop haut!
    } else if (keyCode == DOWN) {
      option_selection += 1;
      if (option_selection > 5) {
        option_selection = 1;
      } // Pas trop bas!
    } else if (keyCode == ENTER) {
      if (option_selection == 5) {
        exit();
      } else if (option_selection == 4) {
        state = "personaliser";
      } else if (option_selection == 3) {
        state = "difficulty";        
      } else if (option_selection == 2) {
        state = "deux_joueurs";
      } else if (option_selection == 1) {
        state = "un_joueur";
      }
    }
  } else if (state == "un_joueur") {
    if (EcranPrincipal_1) {
      if (key == ' ') {
        // Si on appuie sur espace et qu'on est sur l'écran d'accueil, on lance
        EcranPrincipal_1 = false;
        Jouer_1 = true;
      } else if (key == 'm') {
        state = "menu";
      }
    } else if (Jouer_1) {
      if (key == CODED) { 
        if (keyCode == UP) {
          upPressed = true;
        }
        if (keyCode == DOWN) {
          downPressed = true;
        }
      }
    } else if (Perdu_1) {
      if (key == ' ') {
        init2 = false;
      } else if (key == 'm') {
        init2 = false;
        state = "menu";
        debut.play();
        debut.loop(2547);
      }
    }
  } else if (state == "difficulty") {
    if (key == 'm') {
      // formule de la forme origine + position de la box par rapport au milieu
      float max_barSize = height/8 + ((sizeBox.max_x) - sizeBox.middle);
      float min_barSize = height/8 + ((sizeBox.min_x) - sizeBox.middle);
      // Map permet de restreindre entre deux valeurs
      realBarSize = map(relativeBarSize, min_barSize, max_barSize, 1, height/2);
      realBarSize = int(realBarSize);
      state = "menu";
    }
  }
   else if (state=="personaliser") {
   if (key == 'm') {
     state = "menu";
   }
   }
}

void keyReleased() {
  if (state == "deux_joueurs") {
    // On fait de même quand les touches ne sont pas pressées
    if (Jouer) { //Dans le menu jouer
      if (key == CODED) { 
        if (keyCode == UP) { // si la flèche du bas n'est pas appuyée 
          upPressed = false; // J1 ne monte pas
        } else if (keyCode == DOWN) { // si la flèche du haut n'est pas appuyée
          downPressed = false; // J1 ne descend pas
        }
      } else if (key == 'Z' || key == 'z') { // si z ou sa masjuscule n'est pas appuyée
        zPressed = false; // J2 ne monte pas
      } else if (key == 'S' || key == 's') { // si s ou sa majuscule n'est pas appuyée
        sPressed = false; // J2 ne descend pas
      }
    }
  }

  if (state == "un_joueur") {
    if (key == CODED) { 
      if (keyCode == UP) { // si la flèche du bas n'est pas appuyée 
        upPressed = false; // J1 ne monte pas
      } else if (keyCode == DOWN) { // si la flèche du haut n'est pas appuyée
        downPressed = false; // J1 ne descend pas
      }
    }
  }
}