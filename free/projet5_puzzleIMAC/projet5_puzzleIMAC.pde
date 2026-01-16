
// déclaration des variables
int nb_lignes = 11;   // taille du tableau (carré)
int[][] grille = new int[nb_lignes][nb_lignes];    //tableau
int largeur_pixel;
int hauteur_pixel;
int x_curseur;
int y_curseur;
int couleur;
int bleu= 1;
int rouge = 2;
int vert = 3;
int noir = 4;

void setup() 
{
  size(800, 800);
  background(255);
  
  //mise en place du tableau initial
  
  //définition des bornes du domaine tout autour
  for (int x=0; x<nb_lignes; x++)
  {
    grille[0][x] = noir;
    grille[nb_lignes-1][x] = noir;
    grille[x][0] = noir;
    grille[x][nb_lignes-1] = noir;
  }
    
  //définition des cases rouges mélangées 
  grille[7][5] = rouge;
  grille[3][5] = rouge;
  grille[1][2] = rouge;
  grille[5][9] = rouge;
  grille[6][2] = rouge;
  grille[7][1] = rouge;
  grille[4][4] = rouge;
 
  //définition des cases bleues mélangées
   grille[3][2] = bleu;
   grille[8][4] = bleu;
   grille[5][1] = bleu;
   grille[9][4] = bleu;
   grille[8][5] = bleu;
   
  //définition des cases vertes mélangées
  grille[7][6] = vert;
  grille[3][9] = vert;
  grille[3][8] = vert;
  grille[5][2] = vert;
  grille[6][8] = vert;
  grille[7][4] = vert;
  grille[6][6] = vert;  
}

void draw() 
{
  largeur_pixel = width / nb_lignes;
  hauteur_pixel = height / nb_lignes;
  
  // Affichage de la grille
  for(int x=0; x<nb_lignes; x++) 
  {
    
    for(int y=0; y<nb_lignes; y++) //parcourt tout le tableau
    {
         // cases noires qui délimitent le domaine
         if (grille[x][y]==noir)
         { 
          noStroke();
          fill(0); 
         }
         
         //cases bleues
         else if (grille[x][y]==bleu) //si voiture
         { 
         fill(0,0,255); 
         } 
         
         //cases vertes 
         else if (grille[x][y]==vert) // si sortie
         {
          fill(0, 255, 0); 
         } 
         
         //cases rouges
         else if (grille[x][y]==rouge) // si sortie
         {
          fill(255,0,0); 
         } 
         else // cases blanches
         {
          fill(255); 
         }
         
         rect(y * largeur_pixel, x * hauteur_pixel, largeur_pixel*2, hauteur_pixel*2); //dessine le pixel carré 
    }
  }
  
  //Affiche la consigne en haut de la page
  fill(255); // texte blanc
  textSize(20);
  textAlign(CENTER, TOP);
  text("Veuillez dessiner le logo de la formation IMAC\n Pour déplacer un pixel, cliquez dessus puis dirigez-le avec les flêches de votre clavier", width/2, 5);
  
  //Condition de victoire : logo IMAC bien positionné :
  if( //cases rouges
  grille[2][4] == rouge &&
  grille[3][3] == rouge &&
  grille[4][2] == rouge &&
  grille[5][1] == rouge &&
  grille[6][2] == rouge &&
  grille[7][3] == rouge &&
  grille[8][4] == rouge &&
  
  //cases bleues
   grille[2][2] == bleu &&
   grille[4][4] == bleu &&
   grille[5][5] == bleu &&
   grille[6][4] == bleu &&
   grille[8][2] == bleu &&
   
  //cases vertes
  grille[2][6] == vert &&
  grille[3][7] == vert &&
  grille[4][8] == vert &&
  grille[5][9] == vert &&
  grille[6][8] == vert &&
  grille[7][7] == vert &&
  grille[8][6] == vert)
  {
    //Affichage du texte si victoire
    fill(0);
    textSize(50);
    String txt = "Bravo c'est gagné !!";
    textAlign(CENTER,CENTER);
    text(txt, width/2. , height/2.);
  }
  
}

// Note la position et la couleur du pixel cliqué
void mousePressed()
{
  x_curseur = mouseX / (width / nb_lignes);
  y_curseur = mouseY / (height / nb_lignes);
  couleur = grille[y_curseur][x_curseur];
}

//Déplace le pixel en fonction de la touche cliquée
void keyPressed()
{
    depl(grille, x_curseur, y_curseur, couleur);
}

//Fonction qui renvoie true si la case est libre (case blanche)
boolean libre(int x, int y)
{
    return grille[y][x] == 0 ;
}

//Fonction déplacement
void depl(int grille[][], int x, int y, int couleur) 
{
  if(x>0 && x<nb_lignes-1 && y>0 && y<nb_lignes-1) //si la position est bien dans le domaine
  {  
    switch(keyCode)
  {
    case RIGHT:  //flêche droite
      if(libre(x+1, y))  //si la case à droite est bien libre
      {
         grille[y][x+1] = couleur;  //la case à droite prend la couleur de celle cliquée
         grille[y][x] = 0;          //la case cliquée devient blanche (libre)
         x_curseur = x+1;           // les positions cliquées deviennent la nouvelle case pour pouvoir continuer de la bouger sans recliquer dessus
      }
    break;
   
    //même logique avec flêche de gauche
    case LEFT:
      if(libre(x-1, y))
      {
          grille[y][x-1] = couleur;
          grille[y][x] = 0;
          x_curseur = x-1;
      }
    break;
    
   //même logique avec flêche du haut
    case UP:
      if(libre(x, y-1))
      {
        grille[y-1][x] = couleur;
        grille[y][x] = 0;
        y_curseur = y-1;
      }
    break;
   
    //même logique avec flêche du bas
    case DOWN:
      if(libre(x, y+1))
      {
        grille[y+1][x] = couleur;
        grille[y][x] = 0;
        y_curseur = y+1;
    }
    break;
   }
  }
  // sinon il se passe rien
  else
  {
    return;
  }
  
}
