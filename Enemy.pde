class Enemy{
  PVector ex=new PVector();
  PVector siz=new PVector();
  color c;
  float dx;
  
  Enemy(float x,float y,float w,float h,color c,float dx){
    ex.set(x,y,0);
    siz.set(w,h,0);
    this.c=c;
    this.dx=dx;
  }
  
  void draw(){
    fill(c);
    rect(ex.x,ex.y,siz.x,siz.y);
    ex.sub(dx,0,0);
  }
}
  
  
