class Block{
  PVector pos=new PVector();
  PVector size=new PVector();
  PVector vel=new PVector();
  PVector prevPos=new PVector();
  color col;
  
  Block(float x,float y,float w,float h,color col){
    pos.set(x,y,0);
    size.set(w,h,0);
    this.col=col;
  }
  
  void update(){
    prevPos.set(pos);
    pos.add(vel);
  }
  
  void draw(){
    fill(col);
    rect(pos.x,pos.y,size.x,size.y);
    
  }
  
  boolean isHit(Block b){
    return abs(pos.x-b.pos.x)<abs(b.size.x) && abs(pos.y - b.pos.y)<size.y&&(pos.x - b.pos.x+size.x)>0;
  }
}
