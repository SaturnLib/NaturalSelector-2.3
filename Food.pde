class Food{
  
  ArrayList<PVector> food;
  
  Food(int num){
    
    food=new ArrayList<PVector>();
    
    for(int i=0; i<num; i++){
      
      food.add(new PVector(random(width), random(height)));
      
    }
  }
  
  void addFood(PVector l){
    food.add(l.get());
  }
  void run(){
    for(PVector f: food){
      
      stroke(0, 0, 0);
      fill(206, 0, 24,95);
      ellipse(f.x, f.y, 15, 15);
    }
    if(random(1)<0.02){
      food.add(new PVector(random(width), random(height)));
    }
  }
  ArrayList getFood(){
    return food;
  }
}

