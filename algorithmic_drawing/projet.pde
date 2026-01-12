void setup() 
{
  size(800, 800);

  
}

float angle_i = 0;  
float angle_j = 0; 

void draw() 
{
  background(253, 233, 224); 
  translate(width/2, height/2);  // place le repère au centre
  fill(10,15,20);
  
  //cercle au centre
  fill(253,108,158);
  noStroke();
  circle(0,0,20);

  //cercles autour
  fill(200,100,150);
  for (int i = 0; i < 12; i++) 
  { 
    pushMatrix();
    rotate(angle_i + i * PI/6.0); 
    translate(30, 30); 
    for (int j = 0; j < 24; j++) 
    {  
      pushMatrix();
      rotate( angle_j+ j * PI/12.0); 
      circle(65, 0, 13);
       angle_i += 0.00001; 
       angle_j += 0.00001;
       popMatrix();
    }
    popMatrix();
  }
 
  //triangles
  fill(108,2,100);
  for (int i = 0; i < 24; i++) 
  { 
    pushMatrix();
    rotate( angle_i +i * PI/12.0); 
    translate(170, 170);
    for (int j = 0; j < 12; j++) 
    { 
      pushMatrix(); 
      rotate(angle_j+j * PI/6.0); 
      strokeWeight(1);
      triangle(100, 70, 50,100, 60, 70);
      popMatrix();
    }
    popMatrix();
  }
  
  //lignes
  stroke(253,108,158);
  for (int i = 0; i < 24; i++) 
  {  
    pushMatrix();
    rotate(i * PI/12.0); 
    translate(320, 320); 
    for (int j = 0; j < 240; j++) 
    {  
      pushMatrix();
      rotate(angle_j+j * PI/120.0); 
      line(0, 0, 70, 70);
      popMatrix();
    }
    
    popMatrix();
  }
}
