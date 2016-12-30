// AudioSnippet rebond2;
Bar bar; // Bar du joueur
Bar robot_bar; // Bar du bot
Ball un_joueur_ball;
boolean up = true;
boolean init2 = false;

boolean EcranPrincipal_1 = true; //Au début l'écran principal s'affiche
boolean Jouer_1 = false; //Au début l'écran jouer ne s'affiche pas
boolean Perdu_1 = false; // Au début l'écran Perdu ne s'affiche pas

int milliseconds;
int m_now, s_now;
int vies;


void un_joueur() {
  debut.pause();
  if (!init2) { // On initialise (après que l'écran soit fait)
    EcranPrincipal_1 = true; //Au début l'écran principal s'affiche
    Jouer_1 = false; //Au début l'écran jouer ne s'affiche pas
    Perdu_1 = false; // Au début l'écran Perdu ne s'affiche pas
    bar = new Bar(25, height/2, realBarSize, 25, 25);
    robot_bar = new Bar(width - 50, height/2, realBarSize, 25, 25);
    un_joueur_ball = new Ball(width/2, height/2, -realSpeed, realSpeed, 10);
    init2 = true;
    milliseconds = millis();
    vies = 3;
  }
  if (EcranPrincipal_1) {
    Ecran.play();
    Fond.pause();
    Bravo.pause();
    Bravo.rewind();
    background(FondR, FondV, FondB); // Le fond d'écran est bleu canard (le joueur aura la possibilité de le changer plus tard)
    fill(TexteR, TexteV, TexteB);
    textSize(20); //taille du texte
    textAlign(CENTER, CENTER);
    text("Bonjour et bienvenu sur le jeu Pong en 1 joueur", width/2, 100); //texte et son allignement 
    textSize(15);
    text("Le joueur joue avec haut pour monter et bas pour descendre", width/2, 150);
    textSize(15);
    text("Son but est de battre le robot en 3 points", width/2, 200);
    textSize(20);
    text("Appuyer sur espace pour jouer !", width/2, 400);
  } else if (Jouer_1) {
    Ecran.pause();
    // rebond2 = minim.loadSnippet("// rebond2.mp3"); //on défini que le // rebond fait ce bruit
    Bravo.pause();
    Bravo.rewind();
    // On check les scores quand même!
    
    if (vies <= 0){
      Jouer_1 = false;
      Perdu_1 = true;
    }

    // Mouvement de la barre du joueur vers le haut
    if (upPressed && bar.pos.y > 5) {
      bar.pos.y -= bar.speed;
    } else if (bar.pos.y < 5) {
      bar.pos.y = 5;
    }
    // Mouvement de la barre du joueur vers le bas
    if (downPressed && bar.pos.y < height - bar.dim.y - 5) {
      bar.pos.y += bar.speed;
    } else if (bar.pos.y > height - bar.dim.y - 5) {
      bar.pos.y = height - bar.dim.y - 5;
    }

    robot_bar.pos.y = un_joueur_ball.y - robot_bar.dim.y/2;
    if (robot_bar.pos.y + robot_bar.dim.y > height) {
      robot_bar.pos.y = height - robot_bar.dim.y;
    } else if (robot_bar.pos.y < 0) {
      robot_bar.pos.y = 0;
    }


    // On met à jour la balle :D
    un_joueur_ball.update();

    // On prépare les hitbox avec x, y (le haut de la box) et z (le bas de la box)
    PVector hitboxRobot = new PVector(robot_bar.pos.x - un_joueur_ball.rad, robot_bar.pos.y - un_joueur_ball.rad, robot_bar.pos.y + robot_bar.dim.y + un_joueur_ball.rad);
    PVector hitboxBar = new PVector(bar.pos.x + bar.dim.x + un_joueur_ball.rad, bar.pos.y - un_joueur_ball.rad, bar.pos.y + bar.dim.y + un_joueur_ball.rad);

    // Si la balle entre dans la hitbox du robot ou du joueur
    if (un_joueur_ball.x + un_joueur_ball.x_speed > hitboxRobot.x) {
      // Si elle touche la barre on la rebalance sinon on ajoute un point et on reset
      if (un_joueur_ball.y + un_joueur_ball.y_speed > hitboxRobot.y && un_joueur_ball.y + un_joueur_ball.y_speed < hitboxRobot.z) {
        un_joueur_ball.x_speed *= -1.1;
        // rebond2.play();
      } else {
        vies += 1;
        
        // reset
        bar = new Bar(25, height/2, realBarSize, 25, 25);
        robot_bar = new Bar(width - 50, height/2, realBarSize, 25, 25);
        un_joueur_ball = new Ball(width/2, height/2, -realSpeed, realSpeed, 10);
      }
    } else if (un_joueur_ball.x + un_joueur_ball.x_speed < hitboxBar.x) {
      // Si elle touche la barre on la rebalance sinon on ajoute un point et on reset
      if (un_joueur_ball.y + un_joueur_ball.y_speed > hitboxBar.y && un_joueur_ball.y + un_joueur_ball.y_speed < hitboxBar.z) {
        un_joueur_ball.x_speed *= -1.1;
        // rebond2.play();
      } else {
        vies -= 1;
   
        // reset
        bar = new Bar(25, height/2, realBarSize, 25, 25);
        robot_bar = new Bar(width - 50, height/2, realBarSize, 25, 25);
        un_joueur_ball = new Ball(width/2, height/2, -realSpeed, realSpeed, 10);
      }
    }

    // On dessine tout en blanc (à changer avec le menu personnalisation)
    fill(255);

    // On dessine le terrain
    stroke(TexteR, TexteV, TexteB);
    strokeWeight(5);
    line(0, 0, width, 0);
    line(0, height, width, height);

    // Ligne du milieu
    line(width/2, 0, width/2, height);

    // Timer
    s_now = (millis() - milliseconds)/1000;
    m_now = s_now/60;
    textSize(36);
    text(m_now + " : " + s_now%60, 150, 50);
    textSize(20);
    text("Il vous reste " + vies + " vies", 150, 100);
    

    // On dessine tout
    noStroke();
    fill(RectangleR, RectangleV, RectangleB);
    bar.show();
    robot_bar.show();

    fill(BalleR, BalleV, BalleB);
    un_joueur_ball.show();
  } else if (Perdu_1) { //Si l'un des deux à perdu
    Ecran.pause();
    Fond.pause();
    Bravo.play();
    background(FondR, FondV, FondB);

    //On affiche les scores des joueurs
    fill(TexteR, TexteV, TexteB);
    textSize(36);
    text("Bravo tu as tenu : " + m_now + " min " + s_now%60 + " sec ", width/2, 100);

    fill(TexteR, TexteV, TexteB);
    textSize(18);
    text("Appuyez sur espace pour rejouer", width/2, 400); //On rejoue si on appuie sur espace

    textSize(18);
    text("Appuyez sur m pour revenir au menu", width/2, 450); //On rejoue si on appuie sur m
  }
}