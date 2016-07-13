class Ecosysteme {
    
  ArrayList<Creature> males;
  ArrayList<Creature> females;
  
  Food food;

  float p;
  
  Ecosysteme(int number) {
    
    
    females=new ArrayList<Creature>();
    males=new ArrayList<Creature>();
    food=new Food(number);
    
    
    for (int i=0; i<number; i++) {
      
      Creature b=new Creature(new ADN(), new PVector(random(width), random(height)));
      if (b.getGender()=='M')
        males.add(b);
      else
        females.add(b);
    }
    
   
      
  }
  void run() {
    food.run();

    for (int i=males.size()-1; i>=0; i--) {
      Creature b=males.get(i);
      b.run();
      b.eat(food);
      if (b.dead()) {
        food.addFood(b.location);
        males.remove(i);
      }
      
    }
    for (int i=females.size()-1; i>=0; i--) {
      Creature b=females.get(i);
      b.run();
      b.eat(food);
      if (b.dead()) {
        food.addFood(b.location);
        females.remove(i);
      }
    
    }
  }
  
  void reproduce() {
    int ml=males.size();
    int fl=females.size();
    p=map(ml+fl, 0, 100, 0.1, 0.01);
    
    for (int j=fl-1; j>=0; j--) {
      Creature f=females.get(j);
      
      for (int i=ml-1; i>=0; i--) {
        Creature m=males.get(i);
        
        if (f.intersect(m)) {
          Creature child=f.mate(m, p);
          
          if (child!=null) {
            
            if (child.getGender()=='M')
            
              males.add(child);
              
            else if (child.getGender()=='F')
            
              females.add(child);
              
          }
        }
      }
    }
  }
  
  void birth(float x, float y) {
    
    PVector l=new PVector(x, y);
    ADN adn=new ADN();
    Creature b=new Creature(adn, l);
    
    if (b.getGender()=='F')
      females.add(b);
    else males.add(b);
    
  }
  
}
