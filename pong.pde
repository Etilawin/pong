// On définit toute les variables globales
import ddf.minim.*;
Minim minim; // création d'un objet de la classe Minim
AudioPlayer Fond;
AudioPlayer Bravo;
AudioPlayer Ecran;
AudioPlayer debut;
PFont font;
int value;
int menuX;
int option_selection = 1; // Par défaut la sélection est "1 joueur"
Ball ball; // Ball du menu
String state;
float realBarSize, relativeBarSize;
float realSpeed, relativeSpeed;
Box sizeBox;
Box speedBox;
// On décompose chaque "couleur" en ces 3 composants RVB
// En fonction de la couleur choisit, ces derniers prendront des valeurs différentes
// Par défaut la couleure sera blanche sauf pour le fond noir
float RectangleR = 255; // le rouge pour le rectangle 
float RectangleV = 255; // le vert pour le rectangle
float RectangleB = 255; // le bleu pour le rectangle
float BalleR = 255; // le rouge pour la balle
float BalleV = 255; // le vert pour la balle
float BalleB = 255; // le bleu pour la balle
float FondR = 0; // le rouge pour le fond
float FondV = 0; // le vert pour le fond
float FondB = 0; // le bleu pour le fond
float TexteR = 255; // le rouge pour le fond
float TexteV = 255; // le vert pour le fond
float TexteB = 255; // le bleu pour le fond

void setup() {
  
  // Son
  minim = new Minim(this);
  Fond = minim.loadFile("Fond.mp3");
  Bravo = minim.loadFile("Bravo.mp3");
  Ecran = minim.loadFile("Ecran.mp3");
  debut = minim.loadFile("debut.mp3");
  debut.play();
  debut.loop(2589);
  Ecran.play();
  Ecran.rewind();
  Ecran.loop();
  Bravo.play();
  Bravo.rewind();
  Bravo.loop();
  Fond.play();
  Fond.rewind();
  Fond.loop();
  // Fin son
  
  fullScreen(); // On fullscreen c'est plus beau
  relativeBarSize = realBarSize = height/8; // Taille de la barre
  realSpeed = relativeSpeed = 5; // Vitesse de la balle
  font = loadFont("StarAvenue-48.vlw"); // Police d'écriture
  menuX = width/2 - 200; // Abscisse du menu
  ball = new Ball(menuX - 45, 100, 1, 0, 5); // Nouvelle balle pour le menu
  speedBox = new Box(width/2 - 200, 500, 20, 20, width/2 - 200, width/2 + 200); // Box pour difficulty_menu
  sizeBox = new Box(width/2, 300, 20, 20, width/2 - 200, width/2 + 200); // Box pour difficulty_menu
  state = "menu"; // On commence par afficher le menu
  ellipseMode(RADIUS); //Met le rayon du cercle au lieu du diamètre
}

void writeText(int x, int y, String text) {
  // Plus rapide pour afficher le texte à l'écran
  // Affiche le texte à la position x, y avec une taille de 32
  textFont(font, 32);
  textAlign(LEFT, TOP);
  text(text, x, y);
}

void draw() {
  // Fond de couleur
  background(FondR, FondV, FondB);

  switch (state)
  {
  case "menu":
    // On affiche le menu
    menu();
    break;
  case "difficulty":
    // On affiche le menu difficulté
    difficulty_menu();
    break;
  case "personaliser":
    // On affiche le menu personnaliser
    personaliser();
    break;
  case "deux_joueurs":
    // On affiche le jeu deux joueurs
    Fond.play();
    deux_joueurs();
    break;
  case "un_joueur":
    // On affiche le jeu un joueur
    Fond.play();
    un_joueur();
    break;
  }
}

void stop() {
  Fond.close();
  Bravo.close();
  // rebond.close();
  Ecran.close();
  minim.stop();
  super.stop();
}