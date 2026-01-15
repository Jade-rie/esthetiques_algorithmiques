
//Variables pour pouvoir compter le nombre de fois qu'un mot a été cliqué et changer les phrases en fonction de ce nombre
int nombre_click_mille = 0;  
int nombre_click_million = 0;
int nombre_click_milliard = 0;
int nombre_click_billion = 0;

//Variables couleurs
color couleur_mille = color(204, 204, 255);
color couleur_million = color(150, 131, 236);
color couleur_milliard = color(100, 0, 180);
color couleur_billion = color(46, 0, 108);
color couleur_phrases = color(0);

//Variables épaisseurs
int weight_mille = 1;
int weight_million = 10;
int weight_milliard = 100;
int weight_billion = 1000;

//Variables positions des points
float milieu_x = 520;
float milieu_y = 425;

//Taille du texte
int taille_txt = 30;

//Position des phrases : 
int x_phrases = 100;
int y_phrases = 200;

//création des tableaux contenants les phrases
String[] mille = {
  "L'empreinte carbone en kg d'un habitant par an",
  "Le temps en secondes d'une pause café",
  "Le nombre de pas pour une petite balade",
  "Le nombre de vêtements jetés par minute en France"
};
String[] million = {
  "Le nombre de cristaux de sucre dans une poignée",
  "Le nombre de mots dans les 7 tomes d'Harry Potter",
  "La taille du Soleil en km",
  "Le salaire mensuel d'un influenceur connu"
};
String[] milliard = {
  "Le nombre d'iPhone vendus depuis la création d'Apple",
  "Le prix du Palais de l'Elysée (et des rénovations)",
  "Le nombre de vêtements mis sur le marché en France",
  "La fortune de Taylor Swift"
};

String[] billion = {
  "Le nombre de gouttes pour remplir 20 piscines",
  "Le nombre de bactéries dans le système digestif",
  "Bientôt la fortune d'Elon Musk",
  "La distance en km pour quitter le système solaire de loin"
};

void setup() 
{
  size(1200, 850);
  background(255);
}

void draw() 
{
  
  // Dessine les cercles grisés
  stroke(250);
  strokeWeight(weight_billion);
  point(milieu_x, milieu_y);
  stroke(200);
  strokeWeight(weight_milliard);
  point(milieu_x, milieu_y);
  stroke(150);
  strokeWeight(weight_million);
  point(milieu_x, milieu_y);
  stroke(100);
  strokeWeight(weight_mille);
  point(milieu_x, milieu_y);
  
  // Affichage des boutons
  textSize(taille_txt);
  fill(couleur_mille);
  text("mille", 1050, 250); 
  fill(couleur_million);
  text("un million", 1050, 350);
  fill(couleur_milliard);
  text("un milliard", 1050, 450);
  fill(couleur_billion);
  text("un billion", 1050, 550);
  
  //Si mille est cliqué au moins une fois
  if (nombre_click_mille > 0) 
  {
    //Affichage du point 
    stroke(couleur_mille);
    strokeWeight(weight_mille);
    point(milieu_x, milieu_y); 
    
    //Affichage des phrases
    textSize(taille_txt);
    fill(couleur_phrases);
    text(mille[(nombre_click_mille - 1) % mille.length], x_phrases, y_phrases); //la phrase correspondante au nombre de click
  }
  
  // Si million est cliqué : même logique que précèdemment
  if (nombre_click_million > 0) 
  {
    stroke(couleur_million);
    strokeWeight(weight_million);
    point(milieu_x, milieu_y);
    
    textSize(taille_txt);
    fill(couleur_phrases);
    text(million[(nombre_click_million - 1) % million.length], x_phrases, y_phrases);
  }
  
  // Si milliard est cliqué : même logique 
  if (nombre_click_milliard > 0) 
  {
    stroke(couleur_milliard);
    strokeWeight(weight_milliard);
    point(milieu_x, milieu_y);
    
    textSize(taille_txt);
    fill(couleur_phrases);
    text(milliard[(nombre_click_milliard - 1) % milliard.length], x_phrases, y_phrases);
  }
  
  // Si billion est cliqué : même logique que précèdemment
  if (nombre_click_billion > 0) 
  {
    stroke(couleur_billion);
    strokeWeight(weight_billion);
    point(milieu_x, milieu_y);
    
    textSize(taille_txt);
    fill(255);
    text(billion[(nombre_click_billion - 1) % billion.length], x_phrases, y_phrases);
  }
}

// Implémentation du nombre de clicks de chaque bouton
void mouseClicked() 
{
  
  // Bouton mille
  if (mouseX > 1050 && mouseX < 1150 && mouseY > 200 && mouseY < 300) 
  {
    nombre_click_mille++;
    
    // Réinitialise les autres pour enlever les phrases écrites
    nombre_click_million = 0;
    nombre_click_milliard = 0;
    nombre_click_billion = 0;
  }
  
  // Bouton million (même logique)
  if (mouseX > 1050 && mouseX < 1150 && mouseY > 300 && mouseY < 400) 
  {
    nombre_click_million++;
    nombre_click_mille = 0;
    nombre_click_milliard = 0;
    nombre_click_billion = 0;
  }
  
  // Bouton milliard
  if (mouseX > 1050 && mouseX < 1150 && mouseY > 400 && mouseY < 500) 
  {
    nombre_click_milliard++;
    nombre_click_mille = 0;
    nombre_click_million = 0;
    nombre_click_billion = 0;
  }
  
  // Bouton billion
  if (mouseX > 1050 && mouseX < 1150 && mouseY > 500 && mouseY < 600) 
  {
    nombre_click_billion++;
    nombre_click_mille = 0;
    nombre_click_million = 0;
    nombre_click_milliard = 0;
  }
}
