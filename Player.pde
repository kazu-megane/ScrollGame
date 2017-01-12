class Player extends Block {
  boolean isLanding;
  int jumpingFrames;
  boolean end;
  boolean clear;
  boolean big;
  int j;
  float x=500;
  float xx;


  Player(float x, float y) {
    
    super(x, y, 50, 50, color(255, 0, 0));
    xx=500;
    
    for(int i=0;i<200;i++){
    enemys.add(new Enemy(random(xx,xx+500),350,50,50,color((int)random(255),(int)random(255),(int)random(255)),random(0.2,1.0)));
    xx+=500;
    }
    for(int i=0;i<20;i++){
    enemys.add(new Enemy(random(500,10000),random(100,300),random(50,100),random(50,00),color(0),random(0.2,1.0)));
    }
    for(int i=0;i<20;i++){
      item.add(new Enemy(random(500,10000),random(100,300),50,50,color(0),random(0.2,1.0)));
    }
    j=20;
    
  }

  void draw() {
    if(big==false){
   image(p,pos.x,pos.y,50,50);
    }else if(big==true){
   image(p,pos.x,pos.y-50,100,100);
    }
   }

  void update() {
    super.update();
    for (Enemy e : enemys) {
      e.draw();
      if(big==false){
      if (pos.x+size.x>=e.ex.x && pos.x<=e.ex.x+e.siz.x && pos.y+size.y>=e.ex.y && pos.y<=e.ex.y+e.siz.y) {
        end=true;
      }
      }else if(big==true){
        if(pos.x+size.x+50>=e.ex.x && pos.x<=e.ex.x+e.siz.x && pos.y+size.y>=e.ex.y && pos.y<=e.ex.y+e.siz.y){
          end=true;
        }
      }
    }
    
    for(Enemy e: item){
      e.draw();
      image(i,e.ex.x,e.ex.y);
      if (pos.x+size.x>=e.ex.x && pos.x<=e.ex.x+e.siz.x && pos.y+size.y>=e.ex.y && pos.y<=e.ex.y+e.siz.y ) {
        if(big==false && j>=1000){
          big=true;
          j=0;
        }else if(big==true && j>=1000){
          big=false;
          j=0;
        }
      }
      j++;
    }
    float x=0;


    if (keyPressed) {
      if (key==CODED) {
        if (keyCode==LEFT) {
          x=-51;
        } else if (keyCode==RIGHT) {
          x=51;
        }
      }
    }

    if (abs(x)>size.x) {
      vel.x += x< 0? -0.2f : 0.2f;
    }

    vel.y+=0.2f;
    if (mousePressed) {
      if (isLanding) {
        vel.y -= 2.0f;
        jumpingFrames=12;
      }
      if (jumpingFrames-->0) {
        vel.y -= 1.0f;
      }
    } else {
      jumpingFrames=0;
    }

    vel.mult(0.98f);
    vel.limit(10.0f);

    if (pos.y>height) {
      end=true;
    }
    
    if(pos.x>10000){
      clear=true;
    }

    isLanding = false;
    for (Block b : blocks) {
      if (b==this) {
        continue;
      }
      if (isHit(b)) {
        if (pos.y + size.y >= b.pos.y) {
          pos.y=-size.y + b.pos.y;
          isLanding=true;
        } else if (prevPos.y > b.pos.y && pos.y<= b.pos.y + b.size.y) {
          pos.y =b.pos.y + b.size.y;
        }
      }
    }
  }
}

