class Creature {
  
  PVector location;
  PVector vel;
  float r, maxacc;
  float xoff, yoff;
  float vie;
  color c;
  char gender;
  ADN adn;
  Creature(ADN adn_, PVector l) {
    
    adn=adn_;
    location=l.get();
    vel=new PVector(0 ,0);
    r=map(adn.genes[0], 0, 1, 20, 69);
    maxacc=map(adn.genes[0], 0, 1, 15, 2);
    xoff=random(500);
    yoff=random(500, 1500);
    vie=200;
    
    //définition du sexe (=genre) de la créature
    
    if (adn.genes[1]<0.5) gender='F';
    
    else if (adn.genes[1]>=0.5) gender='M';
    
    float g=0;
    
    if (gender=='F') {
      
      g=map(adn.genes[2], 0, 1, 20, 80);
      
      c=color(230, g, 130);
    }
    
    else if (gender=='M') {
      
      g=map(adn.genes[2], 0, 1, 50, 130);
      
      c=color(60, g, 230);
      
    }
  }
  
  void update() {
    
    float ax=map(noise(xoff), 0, 1, -maxacc, maxacc);
    float ay=map(noise(yoff), 0, 1, -maxacc, maxacc);
    PVector vel=new PVector(ax, ay);
    xoff+=0.01;
    yoff+=0.01;
    location.add(vel);
    vie--;
    
  }
  void display() {
    
    stroke(c, vie);
    fill(c, vie);
    ellipse(location.x, location.y, r, r);
    
  }
  
  boolean dead() {
    if (vie<=0)
      return true;
    else return false;
    
  }
  
  void eat(Food f) {
    
    ArrayList<PVector> food=f.getFood();
    
    for (int i=food.size()-1; i>=0; i--) {
      PVector foodLocation=food.get(i);
      float d=PVector.dist(location, foodLocation);
      
      if (d<r/2 + 5) {
        vie+=50;
        food.remove(i);
        
      }
    }
  }
  
  Creature mate(Creature partner, float p) {
    
    if (gender!=partner.gender && vie<150 && partner.vie<150) {
      if (random(1)<p) {
        
        ADN childGender=adn.croisement(partner.adn);
        childGender.mutate(0.01);
       
        return new Creature(childGender, location);
        
      }
      else if(random(1)<p+0.2){
        
        vie+=10;
        partner.vie+=10;
        return null;
        
      }
      else return null;
    }
    else {
      return null;
    }
  }
  void CheckEdges() {
    if (location.x<-r) 
    location.x=width+r;
    
    if (location.x>width+r) 
    location.x=-r;
    
    if (location.y<-r) 
    location.y=height+r;
    
    if (location.y>height+r) 
    location.y=-r;
    
  }
  
  void run() {
    update();
    display();
    CheckEdges();
    
  }
  
  boolean intersect(Creature other) {
    
    float d=PVector.dist(location, other.location);
    
    if (d>0 && d<r+other.r)
      return true;
    else return false;
    
  }
  
  char getGender(){
    
    return gender;
    
  }
  
}
