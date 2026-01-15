
int nb_lignes = 50;   //pour varier le nombre de personnes
int nb_colonnes = 50;
int[][] grille = new int[nb_lignes][nb_colonnes];
int pixelsParFrame = 500;  // pour varier la vitesse de déplacement
int x_sortie = nb_lignes - 1;
int y_sortie = nb_colonnes - 1;

void setup() 
{
  size(600, 600);
  background(255);
  
  //initialisation de la salle remplie de monde
  for(int x=0; x<nb_lignes; x++) 
  {
    for(int y=0; y<nb_colonnes; y++) 
    {
      grille[x][y] = 1; 
    }
  }
  
  //définition de la sortie 
  grille[x_sortie][y_sortie] = -1; //-1 pour la différencier des cases libres dans la salle
}


//fonction qui calcule la distance entre un point(x,y) et la sortie
int distance(int x, int y) 
{
  return abs(x - x_sortie) + abs(y - y_sortie);
}

//fonction qui déplace les pixels "humains" de façon à les rapprocher de la sortie 
void deplacement(int x, int y, int nb_lignes, int nb_colonnes) 
{
  int mindist = distance(x, y); //distance actuelle à ne pas dépasser 
  int new_x = x;
  int new_y = y;
  
  for(int i = -1; i<=1; i+=2) //test sur les cases à gauche et à droite de la case actuelle
  {
    if(x+i >= 0 && x+i < nb_lignes &&  //le nouveau x est bien à l'intèrieur du tableau
    distance(x+i, y) < mindist &&  //le pixel se rapproche bien de la sortie
    (grille[x+i][y]==0 || grille[x+i][y]==-1))  //la case est bien disponible 
    {
      new_x = x+i;
      new_y = y;
      mindist = distance(new_x, new_y);
    }
  }

  for(int i = -1; i<=1; i+=2)   //test sur cases en haut et en bas de la case actuelle
  {
    if(y+i >= 0 && y+i < nb_colonnes &&  //le nouveau y est bien à l'intèrieur du tableau
    distance(x, y+i) < mindist &&   //le pixel se rapproche bien de la sortie
    (grille[x][y+i]==0 || grille[x][y+i]==-1)) //la case est bien disponible 
    {
      new_x = x;
      new_y = y+i;
    }
  }
  
  
  if(new_x != x || new_y != y) // Si déplcement
  {
    grille[x][y] = 0;   //ancienne case devient vide
    if(grille[new_x][new_y] != -1) //si la nouvelle case n'est pas la sortie
    {  
      grille[new_x][new_y] = 1;  //nouvelle case remplie
    }
  }
}

void draw() 
{
  int largeur_pixel = width / nb_colonnes;
  int hauteur_pixel = height / nb_lignes;
  
  // Affichage de la grille
  stroke(255);
  for(int x=0; x<nb_lignes; x++) 
  {
    for(int y=0; y<nb_colonnes; y++) 
    {
      if (grille[x][y]==1) //si humain
      { 
        fill(0); 
        circle(y * largeur_pixel, x * hauteur_pixel, largeur_pixel); 
      } 
      else if (grille[x][y]==-1) // si sortie
      {
        fill(255, 0, 0); 
        rect(y * largeur_pixel, x * hauteur_pixel, largeur_pixel, hauteur_pixel); 
      } 
      else // cases vides
      {
        fill(255); 
        circle(y * largeur_pixel, x * hauteur_pixel, largeur_pixel); 
      }
      
    }
  }
  
  //on tire au sort les pixels qui vont bouger en fonction du nombre de pixels souhaités (pour gérer la vitesse de déplacement)
  for(int pixel = 0; pixel < pixelsParFrame; pixel++) 
  {
    int x = int(random(nb_lignes)); 
    int y = int(random(nb_colonnes));
    
    if(grille[x][y] == 1) 
    {
      deplacement(x, y, nb_lignes, nb_colonnes);
    }
  }
}
