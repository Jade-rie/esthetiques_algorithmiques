void setup() 
{
  size(800, 800);
  background(0);
}

ArrayList<PVector> points = new ArrayList<PVector>();  //tableau pour les positions pointées avec le curseur
void draw() 
{
  //remplissage du tableau pendant que le curseur dessine
  if (mousePressed) 
  {
    points.add(new PVector(mouseX, mouseY));
  }

  int points_size= points.size(); 

  //boucle de la fractale 
  for(int k=0; k<points_size; k++)
  {
    pushMatrix(); //nouveau repère
    PVector pk = points.get(k);     //tableau avec coordonnées d'un point
    translate(pk.x, pk.y);          //on se place sur ce point
    scale(0.2);                     // réduit le dessin pour qu’il tienne dans le point
    translate(-width/2, -height/2); //centre le dessin
    
    //même logique
    for(int j=0; j<points_size; j++)
    {
       pushMatrix();
       PVector pj = points.get(j);
       translate(pj.x, pj.y);
       scale(0.2);             
       translate(-width/2, -height/2);
       
       //dessin du point
       for(int i=0; i<points_size; i++)
       {
         PVector pi = points.get(i);
         strokeWeight(3);
         stroke(255);
         point(pi.x, pi.y);
       }

       popMatrix(); // on sort du repère
    }
    popMatrix(); 
  }

//effacer le dessin en cliquant sur une touche
  if(keyPressed)
  {
    background(0);  //écran noir
    points.clear();  //tableau sans points
  }
}
