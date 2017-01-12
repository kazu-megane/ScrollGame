class Game {
  boolean e;
  Player player;
  PVector basePos = new PVector();
  float x;

  Game() {
    blocks.add(player=new Player(50, 400)); 
    blocks.add(new Block(0, 400, 5000, 10, color(147, 84, 6)));

    for (int i=0; i<10; i++) {
      blocks.add(new Block(random(x, x+500), random(100, 300), random(100, 200), 10, color(147, 84, 6)));
      x+=500;
    }
    for(int i=0;i<10;i++){
      blocks.add(new Block(random(x, x+500), random(200, 300), random(100, 200), 10, color(147, 84, 6)));
      x+=200;
    }
      
    blocks.add(new Block(10000, 0, 5, 400, color(255, 226, 0)));
  }

  void draw() {
    basePos.x = basePos.x * 0.98f + (-player.pos.x + width/2) * 0.02f;
    basePos.y = basePos.y * 0.98f + (-player.pos.y + height/2) * 0.02f; 
    translate(basePos.x, 0);
    for (Block b : blocks) {
      if (player.end!=true && player.clear!=true) {
        b.update();
        b.draw();
      } else if (player.end==true) {
        basePos.x=0;

        textSize(50);
        textAlign(CENTER, CENTER);
        text("GAME OVER", width/2, height/2);
        textSize(20);
        text("R key to reset", width/2, height*2/3);
        e=true;
      } else if (player.clear==true) {
        basePos.x=0;
        textSize(50);
        textAlign(CENTER, CENTER);
        text("CLEAR", width/2, height/2);
        textSize(20);
        text("R key to reset", width/2, height*2/3);
        e=true;
      }
    }
  }
}

