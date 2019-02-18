double desp;
PImage img;
ArrayList<Planet> array;
int playerX,playerY,playerZ,playerSpeed,playerRotateX,playerRotateY,playerRotateZ;

void setup(){
  size(1000,700,P3D);
  stroke(170);
  textSize(32);
  desp=0.5;
  imageMode(CENTER);
  img = loadImage("espacio.jpg"); 
  playerX = 0;
  playerY = 0;
  playerZ = 0;
  playerRotateX=0;
  playerRotateY=0;
  playerRotateZ=0;
  playerSpeed=3;
  
  array = new ArrayList<Planet>();
  
  array.add(new Planet(25, 1, 0.25, "Mercurio",true));
  array.add(new Planet(15, 1.2, 0.4, "Venus",false));
  array.add(new Planet(25, 1.6, 0.7, "Tierra",true));
  array.add(new Planet(10, 1.8, 1, "Marte",false));
  array.add(new Planet(30, 0.6, 1.2, "Júpiter",false));
 

}

void draw(){
  background(img);
  textControlPlayer();
  scale(0.5);
  translate(width,height,0);
  rotateX(radians(-20));
  
  pushMatrix();
  rotateY(radians((int)-desp));
  sphere(50);
  popMatrix();
  
  
  for(Planet p: array){
   movePlanet(p); 
  }
  controlPlayer();
  movePlayer();
  
  desp++;
  
}

public void movePlanet(Planet p){
  pushMatrix();
  rotateY(radians((int)(desp * p.speedFactor)));
  translate((float)(-width*p.distFactor),0,0);
  sphere(p.size);
  
  fill(255,255,255);
  rotateY(radians((int)-(desp * p.speedFactor)));
  text(p.name,p.size/2,-p.size,0);
   
  if(p.satelite){
    pushMatrix();
    rotateZ(radians((int)(desp*p.speedFactor)));
    translate((float)(-width*p.distFactor*0.15),0,0);
    box(6);
    popMatrix();
  }
  popMatrix();
}
public void movePlayer(){
  pushMatrix();
  
  translate(0+playerX,0+playerY,0+playerZ);
  rotateX(radians(0+playerRotateX));
  rotateY(radians(0+playerRotateY));
  rotateZ(radians(0+playerRotateZ));
  box(30);
  popMatrix();
}

public void textControlPlayer(){
  fill(255);
  textSize(20);
  text("pulse W para moverse hacia alante.\npulse S para moverse hacia atras.\npulse R para ascender.\npulse F para descender.\npulse A para rotar hacia la izquierda.\npulse D para rotar hacia la derecha.",0,25,0);
  
}

public void controlPlayer(){
  if (keyPressed && key == 'w') {
    playerX+=playerSpeed;
  }else if(keyPressed && key == 's'){
    playerX-=playerSpeed;
  }else if(keyPressed && key == 'f'){
    playerY+=playerSpeed;
  }else if(keyPressed && key == 'r'){
    playerY-=playerSpeed;
  }else if(keyPressed && key == 'a'){
    //playerRotateX+=playerSpeed;
    playerRotateY+=playerSpeed;
    //playerRotateZ+=playerSpeed;
    
  }else if(keyPressed && key == 'd'){
    playerRotateY-=playerSpeed;
    
  }
}

private class Planet{
  boolean satelite;
  String name;
  int size;
  double speedFactor;
  double distFactor;
  
  public Planet(int size, double speed, double dist, String name,boolean satelite){
    this.size = size;
    this.speedFactor=speed;
    this.distFactor=dist;
    this.name = name;
    this.satelite = satelite;
  }
}
