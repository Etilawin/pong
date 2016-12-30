// AudioSnippet rebond;
boolean EcranPrincipal = true; //Au début l'écran principal s'affiche
boolean Jouer = false; //Au début l'écran jouer ne s'affiche pas
boolean Perdu = false; // Au début l'écran Perdu ne s'affiche pas

//on définit le rectangle du joueur de gauche
float Joueur1rectX;
float Joueur1rectY;
float Joueur1largrect;
float Joueur1hautrect;

//on définit le rectangle du joueur de droite
float Joueur2rectX;
float Joueur2rectY;
float Joueur2largrect;
float Joueur2hautrect;

//la vitesse des rectangles
float vitesseRectangle;

//on initialise les commandes de jeu au début
boolean upPressed = false;
boolean downPressed = false;
boolean zPressed = false;
boolean sPressed = false;

//on initialise les scores des joueurs au début de la partie
int Joueur1Score = 0;
int Joueur2Score = 0;

//on définie la balle du jeu
float balleX; //elle démare au milieu en abscisse 
float balleY;//et en ordonnée
float rayon; //le rayon de la balle
float ballePositionX; // la distance à laquelle elle va se décaler sur l'axe des abscisse quand elle bougera
float ballePositionY; //la distance à laquelle elle va se décaler sur l'axe des ordonnées quand elle bougera

boolean init = false;
boolean inite = false;

void deux_joueurs() {
  rectMode(CORNER);
  debut.pause();
  if (!inite) {
    EcranPrincipal = true; //Au début l'écran principal s'affiche
    Jouer = false; //Au début l'écran jouer ne s'affiche pas
    Perdu = false; // Au début l'écran Perdu ne s'affiche pas
    inite = true;
  }
  if (!init) {
    //on définit le rectangle du joueur de gauche
    Joueur1rectX = 25;
    Joueur1rectY = height/2;
    Joueur1largrect = 25;
    Joueur1hautrect = realBarSize;

    //on définit le rectangle du joueur de droite
    Joueur2rectX = width - 50;
    Joueur2rectY = height/2;
    Joueur2largrect = 25;
    Joueur2hautrect = realBarSize;

    //la vitesse des rectangles
    vitesseRectangle = 20;

    balleX = width/2; //elle démare au milieu en abscisse 
    balleY = height/2;//et en ordonnée
    rayon = 10; //le rayon de la balle
    ballePositionX = realSpeed; //elle bougera de 5 en abscisse 
    ballePositionY = realSpeed; //et de -5 en ordonnées

    init = true;
  }
  //On affiche tout en fonction des différents écrans
  if (EcranPrincipal) { // Si on est dans l'écran principal
    Ecran.play();
    Fond.pause();
    Bravo.pause();
    Bravo.rewind();
    background(FondR, FondV, FondB); // Le fond d'écran est bleu canard (le joueur aura la possibilité de le changer plus tard)
    fill(TexteR, TexteV, TexteB);
    textSize(20); //taille du texte
    textAlign(CENTER, CENTER);
    text("Bonjour et bienvenu sur le jeu Pong en 2 joueurs", width/2, 100); //texte et son allignement 
    textSize(15);
    text("Le joueur de droite joue avec Z pour monter et S pour descendre", width/2, 150);
    textSize(15);
    text("Le joueur de gauche joue avec les flèches du clavier (haut et bas)", width/2, 200);
    textSize(20);
    text("Appuyer sur espace pour jouer !", width/2, 400);
  } else if (Jouer) { //Si on est dans le menu Jouer
    Ecran.pause();
    // rebond = minim.loadSnippet("// rebond.mp3"); //on défini que le // rebond fait ce bruit
    Bravo.pause();
    Bravo.rewind();
    background(FondR, FondV, FondB);

    if (upPressed) { //Si la condition flèche du haut est vraie (voir keyPressed et KeyReleased)
      if (Joueur2rectY > 0) { //Si le rectangle du joueur 1 n'est pas tout en haut de l'écran
        Joueur2rectY -= vitesseRectangle; // L'ordonnée du rectangle du joueur 1 diminuera de la vitesse du rectangle (le rectangle montera)
      }
    }
    if (downPressed) { //Si la condition flèche du bas est vraie (voir keyPressed et KeyReleased)
      if (Joueur2rectY + Joueur2hautrect < height) { //Si Ji n'est pas trop bas
        Joueur2rectY +=  vitesseRectangle; //le rectangle de J1 descend (de la vitesste du rectangle)
      }
    }
    if (zPressed) { //Si la condition z appuyée est vraie (voir keyPressed et KeyReleased)
      if (Joueur1rectY > 0) {  //Si le rectangle du J2 n'est pas tout en haut de l'écran
        Joueur1rectY -= vitesseRectangle; //le rectangle de J2 monte (de la vitesste du rectangle)
      }
    }
    if (sPressed) { //Si la condition s appuyée est vraie (voir keyPressed et KeyReleased)
      if (Joueur1rectY + Joueur1hautrect < height ) { //Si J2 n'est pas trop bas
        Joueur1rectY += vitesseRectangle; //le rectangle de J2 descend (de la vitesste du rectangle)
      }
    }

    float BalleGauche = balleX - rayon + ballePositionX; //la balle fera la distance de - son rayon (pour la replacer) + sa vitesse horizontale
    float BalleDroite = balleX + rayon + ballePositionX; //la balle fera la distance de  son rayon (pour la replacer) + sa vitesse horizontale
    float BalleHaut = balleY - rayon + ballePositionY; //la balle fera la distance de - son rayon (pour la replacer) + sa vitesse verticale
    float BalleBas = balleY + rayon + ballePositionY; //la balle fera la distance de son rayon (pour la replacer) + sa vitesse verticale

    float Joueur1Droit = Joueur1rectX + Joueur1largrect; // là où le J1 se situera par rapport à la droite de la fenêtre est égal à son emplacement de base + la largueur du rectangle
    float Joueur1Haut = Joueur1rectY; //la hauteur du joueur 1 est égale à sa position Y
    float Joueur1Bas = Joueur1rectY + Joueur1hautrect; // pas sur

    float Joueur2Gauche = Joueur2rectX; //là où J2 se situera par rapport à la gauche de la fenetre (pas besoin de rajouter sa largeur car son ordonnée est calculer à partir du point en haut à gauche)
    float Joueur2Haut = Joueur2rectY; //La où J2 se situera en haut de l'écran
    float Joueur2Bas = Joueur2rectY + Joueur2hautrect; //La où J2 se situera en bas de l'écran

    //Pour que la balle // rebondisse en haut et en bas de l'écran
    if (BalleHaut < 0 || BalleBas > height) { // si elle touche le haut de l'écran ou qu'elle est plus basse que la taille de la fenêtre
      ballePositionY *= -1; // on inverse sa trajectoire (elle fait demi-tour)
      // rebond.play();
    }

    //Si la balle va à gauche
    if (BalleGauche < Joueur1Droit) {  //Si la balle en direction de la gauche dépasse la position du rectangle du J1
      //Si le J1 ne le rattrape pas
      if (BalleHaut > Joueur1Bas || BalleBas < Joueur1Haut) { //Si la balle et plus haute que J1 ou plus basse que J1
        init = false;
        Joueur2Score ++; //On ajoute 1 point au joueur 2

        if (Joueur2Score == 3) { // Si le joueur 2 à 3 points (fin de la partie)
          Jouer = false; //l'écran de jeu s'enlève
          Perdu = true; // l'écran de fin se met
        }
      } else {
        ballePositionX *= -1; //On inverse sa trajectoire (fait demi-tour)
        ballePositionX +=0.7; //la balle accélère a chaque // rebond
        // rebond.play();
      }
    }

    //Faisons pareille avec le joueur 2
    if (BalleDroite > Joueur2Gauche) { //Si la balle va à droite et est supérieur au J2
      //Si J2 ne la ratrappe pas
      if (BalleHaut > Joueur2Bas || BalleBas < Joueur2Haut) { //Si la balle est plus haute que J2 ou plus basse que J1
        init = false;
        Joueur1Score ++; //Le joueur 1 gagne 1 point

        if (Joueur1Score == 3) { //Si J1 gagne la partie
          Jouer = false; // l'écran de jeu s'arrête
          Perdu = true; //l'écran de fin se met
        }
      } else {
        ballePositionX *= -1; //Sinon, la balle // rebondit (inverse sa trajectoire)
        ballePositionX -=0.7; //la balle accélère à chaque // rebond
        // rebond.play();
      }
    }
    //On initialise les coordonnées de la balle
    balleX += ballePositionX; 
    balleY += ballePositionY;

    //On dessine la ligne qui sépare les deux terrains
    {
      stroke(TexteR, TexteV, TexteB);
      strokeWeight(10);
      fill(TexteR, TexteV, TexteB); // en blanc
      line(width/2, 0, width/2, height);
    }


    //On affiche les scores des joueurs
    textSize(36);
    fill(TexteR, TexteV, TexteB);
    text(Joueur1Score, width/2 - 50, 100);
    text(Joueur2Score, width/2 + 50, 100);

    //On définie les rectangles des deux joueurs
    stroke(RectangleR, RectangleV, RectangleB);
    fill(RectangleR, RectangleV, RectangleB);
    rect(Joueur1rectX, Joueur1rectY, Joueur1largrect, Joueur1hautrect);
    rect(Joueur2rectX, Joueur2rectY, Joueur2largrect, Joueur2hautrect);
    //Puis la balle
    noStroke();
    fill(BalleR, BalleV, BalleB);
    ellipse(balleX, balleY, rayon, rayon);
  } else if (Perdu) { //Si l'écran est perdu
    Ecran.pause();
    Fond.pause();
    Bravo.play();
    background(FondR, FondV, FondB);
    stroke(TexteR, TexteV, TexteB);

    //On affiche les scores des joueurs
    textSize(36);
    fill(TexteR, TexteV, TexteB);
    text(Joueur1Score, width/2 - 150, 100);
    text(Joueur2Score, width/2 + 150, 100);

    //On affiche le gagnant
    textSize(36);
    if (Joueur1Score > Joueur2Score) { //Si le score du joueur 1 est supérieur à celui du joueur 2
      fill(TexteR, TexteV, TexteB);
      text("Le joueur 1 gagne !", width/2, 200); // J1 gagne
    } else { //Sinon
      fill(TexteR, TexteV, TexteB);
      text("Le joueur 2 gagne !", width/2, 200); // J2 gagne
    }
    fill(TexteR, TexteV, TexteB);
    textSize(18);
    text("Appuyez sur espace pour rejouer", width/2, 400); //On rejoue si on appuie sur espace

    fill(TexteR, TexteV, TexteB);
    textSize(18);
    text("Appuyez sur m pour revenir au menu", width/2, 450); //On rejoue si on appuie sur m
  }
}