class ADN{
  
  float[] genes;
  
  ADN(){
    
    genes=new float[3];
    
    for(int i=0; i<genes.length; i++){
      
      genes[i]=random(1);
    }
  }
  
  ADN(float[] newgenes){
    genes=newgenes;
  
  }
  
  void mutate(float m){
    for(int i=0; i<genes.length; i++){
      if(random(1)<m)
      genes[i]=random(1);
    }
  
  }
  
  ADN croisement(ADN partner){
    
    float[] child=new float[genes.length];
    
    for(int i=0; i<genes.length; i++){
      
      int n=floor(random(2));
      
      if(n==0) child[i]=genes[i];
      
      else child[i]=partner.genes[i];
      
    }
    
    return new ADN(child);
  }
  
}

