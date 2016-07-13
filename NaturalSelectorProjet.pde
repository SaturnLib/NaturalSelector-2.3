Ecosysteme eco;

void setup() {
  size(800, 600);
  eco=new Ecosysteme(0);

  }
  
  void draw() {
  background(138, 255, 141);
  
  eco.run();
  eco.reproduce();
  


  }

  void mousePressed() {
    eco.birth(mouseX, mouseY);
    
  }


  
