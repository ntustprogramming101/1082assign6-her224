class Clock extends Item{
	// Requirement #2: Complete Clock Class
  
  void display(){
    if(isAlive) image(clock, x, y);
  }
  
  void checkCollision(Player player){
    if(isAlive == true && isHit(x, y, w, h, player.x, player.y, player.w, player.h)){
        addTime(CLOCK_BONUS_SECONDS);
        isAlive = false;
        //x = y = -1000; // Now that they're objects, toggle isAlive instead of throwing them away from screen
      }
    }
  
  Clock(float x, float y){
    super(x, y);
  }
}
