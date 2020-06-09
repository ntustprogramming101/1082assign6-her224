class Robot extends Enemy{
	// Requirement #5: Complete Dinosaur Class

	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
  float speed = 2f;
  int sign = 1; //1 for right and -1 for left.
  int cooldown = 0;
  Laser laser = new Laser();

  void display(){
    pushMatrix();
    translate(x + (sign == -1 ? w : 0), y);
    scale(sign, 1);    
    image(robot, 0, 0);
    popMatrix();
    
    laser.display();
  }
  void update(){
    int myRow = floor(y / SOIL_SIZE);
    int playerRow = floor(player.y / SOIL_SIZE);
    boolean checkX = (sign == 1 && (player.x + w/2) > x) || (sign == -1 && (player.x + w/2) < x);
    boolean checkY = abs(myRow - playerRow) <= PLAYER_DETECT_RANGE_ROW;

    if(checkX && checkY){
      speed = 0; //Stop.
      
      if(cooldown == 0){
        if(sign == 1) laser.fire(x + HAND_OFFSET_X_FORWARD, y + HAND_OFFSET_Y, player.x + w/2, player.y + w/2);
        else laser.fire(x + HAND_OFFSET_X_BACKWARD, y + HAND_OFFSET_Y, player.x + w/2, player.y + w/2);
        cooldown = LASER_COOLDOWN;
      }
    }else{
      speed = 2; // Keep moving!
    }
    
    // Cooldown.
    if(cooldown > 0) cooldown--;

    // Boundary check.
    if(x >= width - w || x <= 0) sign = -sign;
    
    // Update speed.
    x += speed * sign;
    
    // Update laser.
    laser.update();
  }
  
  void checkCollision(Player player){
    if(isHit(x, y, w, h, player.x, player.y, player.w, player.h)) player.hurt();
    laser.checkCollision(player);
  }

  Robot(float x, float y){
    super(x, y);
  }
}
