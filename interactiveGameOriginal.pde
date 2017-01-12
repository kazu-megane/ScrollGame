/*
横スクロールアクションゲーム
プレイヤー操作方法
右：→キー　左：←キー
ジャンプ：マウスクリック

動いてくるカラフルなボックスを避けて進んでいく。
黄色のバーのゴールまで到達出来たらクリアとなる。
ボックスに当たる、または床から落ちるとゲームオーバーとなる。
木目状のボックスに当たるとプレイヤーが拡大・縮小する。
*/


ArrayList<Block> blocks=new ArrayList<Block>();
ArrayList<Enemy> enemys=new ArrayList<Enemy>();
ArrayList<Enemy> item=new ArrayList<Enemy>();
Game game;
PImage img;
PImage p;
PImage i;

int[] xx;

void setup(){
  img=loadImage("cloud2.jpg");
  p=loadImage("mario.png");
  i=loadImage("item.png");
  size(1000,500);
  background(255);
  noStroke();
  game=new Game();
}

void draw(){
  background(img);
  game.draw();
}

void keyPressed(){
  if(game.e==true){
    if(key=='r'){
      blocks=new ArrayList<Block>();
      enemys=new ArrayList<Enemy>();
      item=new ArrayList<Enemy>();
      game=new Game();
    }
  }
}
