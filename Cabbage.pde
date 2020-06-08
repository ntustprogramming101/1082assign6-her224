class Cabbage extends Item{
	// Requirement #1: Complete Cabbage Class
  
  void display(){
    if(isAlive) image(cabbage, x, y);
  }
  
  void checkCollision(Player player){
    if(isAlive == true && player.health < player.PLAYER_MAX_HEALTH && isHit(x, y, w, h, player.x, player.y, player.w, player.h)){
        player.health ++;
        isAlive = false;
        //x = y = -1000; // Now that they're objects, toggle isAlive instead of throwing them away from screen
    }
  }
  
  Cabbage(float x, float y){
    super(x, y);
  }
}
