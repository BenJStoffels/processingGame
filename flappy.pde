class Flappy{
  float angle = map(width/2 + start, 0, breed * width, 0, PI);
  float n = map(noise(angle),0,1,-50,50);
  float s = map(sin(angle), -1, 1, 20, height-20);
  float y = s + n + 50;
  PVector pos = new PVector(width/2, y);
  PVector vel = new PVector(0,map(breed,0,2,7.5,2.5));
  float gap = 100;
  void show(){
    rect(pos.x, pos.y, 10, height - pos.y);
    rect(pos.x, -1, 10, pos.y - gap);
    pos.add(vel);
  }
  void move(){
    score++;
    vel.mult(-1);
  }
  boolean dies(){
    float angle = map(pos.x + start, 0, breed * width, 0, PI);
    float n = map(noise(angle),0,1,-50,50);
    float s = map(sin(angle), -1, 1, 20, height-20);
    float y = s + n;
    if(pos.y < y){
      return true;
    }else{
      if(pos.y - gap > y){
        return true;
      }else{
        return false;
      }
    }
  }
}