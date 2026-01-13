int compteur = 0;
int nb_lignes = 10;
int nb_colonnes = 10;
int[][] grille = new int[nb_lignes][nb_colonnes];
int pixelsParFrame = 10;

void setup() {
  size(500, 500);
  //frameRate(30);
  
  // initialisation de la salle remplie
  for(int x=0; x<nb_lignes; x++) {
    for(int y=0; y<nb_colonnes; y++) {
      grille[x][y] = 1;
    }
  }
  
  // définition des coordonnées de la sortie 
  grille[nb_lignes-1][nb_colonnes-1] = -1; // -1 pour la différencier des cases libres dans la salle
}

//fonction qui calcule la distance entre un point(x,y) et la sortie
int distance(int x, int y, int nb_lignes, int nb_colonnes) {
  int sortieX = nb_lignes - 1;
  int sortieY = nb_colonnes - 1;
  return abs(x - sortieX) + abs(y - sortieY);
}

//fonction qui déplace les pixels noirs de façon à les rapprocher de la sortie 
void deplacement(int x, int y, int nb_lignes, int nb_colonnes) {
  int mindist = distance(x, y, nb_lignes, nb_colonnes);
  int new_x = x;
  int new_y = y;
  
  //test cases horizontales
  for(int i = -1; i<=1; i+=2) {
    if(x+i >= 0 && x+i < nb_lignes && distance(x+i, y, nb_lignes, nb_colonnes) < mindist && (grille[x+i][y]==0 || grille[x+i][y]==-1)) {
      new_x = x+i;
      new_y = y;
      mindist = distance(new_x, new_y, nb_lignes, nb_colonnes);
    }
  }
  //test cases verticales
  for(int i = -1; i<=1; i+=2) {
    if(y+i >= 0 && y+i < nb_colonnes && distance(x, y+i, nb_lignes, nb_colonnes) < mindist && (grille[x][y+i]==0 || grille[x][y+i]==-1)) {
      new_x = x;
      new_y = y+i;
    }
  }
  
  // Si déplcement
  if(new_x != x || new_y != y) {
    grille[x][y] = 0;   //ancienne case vide
    if(grille[new_x][new_y] != -1) {  //si pas sortie
      grille[new_x][new_y] = 1; // nouvelle case remplie
    }
  }
}

void draw() {
  int largeur_pixel = width / nb_colonnes;
  int hauteur_pixel = height / nb_lignes;
  
  // Affichage de la grille
  stroke(255);
  for(int x=0; x<nb_lignes; x++) {
    for(int y=0; y<nb_colonnes; y++) {
      if (grille[x][y]==1) {
        fill(int(random(255))); // humain en noir
      } else if (grille[x][y]==-1) {
        fill(255, 0, 0); // sortie en rouge
      } else {
        fill(255); // case vide en blanc
      }
      rect(y * largeur_pixel, x * hauteur_pixel, largeur_pixel, hauteur_pixel); //dessin pixel
    }
  }
  
  // Ordre aléatoire pour effet de foule
  int pixelsDeplacees = 0;
  for(int tentative = 0; tentative < pixelsParFrame * 3 && pixelsDeplacees < pixelsParFrame; tentative++) {
    int x = int(random(nb_lignes));
    int y = int(random(nb_colonnes));
    
    if(grille[x][y] == 1) {
      deplacement(x, y, nb_lignes, nb_colonnes);
      pixelsDeplacees++;
    }
  }
}
