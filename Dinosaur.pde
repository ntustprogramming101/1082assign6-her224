class Dinosaur extends Enemy{
	// Requirement #4: Complete Dinosaur Class

	final float TRIGGERED_SPEED_MULTIPLIER = 5;
  float speed = 2f;
  float currentSpeed = speed;
  int sign = 1; //right for true
  boolean isSpeedUp = false; 

  void display(){
    pushMatrix();
    translate(x + (sign == -1 ? w : 0), y);
    scale(sign, 1);    
    image(dinosaur, 0, 0);
    popMatrix();
  }
  
  void update(){
    int myRow = floor(y / SOIL_SIZE);
    int playerRow = floor(player.y / SOIL_SIZE);
    
    // Check direction and modify speed.
    if(myRow == playerRow && ((sign == 1 && player.x > x) || (sign == -1 && player.x < x))){
      if(isSpeedUp != true){
        currentSpeed *= TRIGGERED_SPEED_MULTIPLIER;
        isSpeedUp = true;
      }
    }else{
      currentSpeed = speed;
      isSpeedUp = false;
    }
    
    // Boundary check.
    if(x >= width - w || x <= 0) sign = -sign;

    // Update speed.
    x += currentSpeed * sign;
  }

  Dinosaur(float x, float y){
    super(x, y);
  }
}
