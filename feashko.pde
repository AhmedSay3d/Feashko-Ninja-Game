// feashko production
import java.util.*;
float angle = 0.0, sun_motion = 0.0;
int screen_width = 1000 ; 
int screen_height = 600 ;
int half_screen = screen_width/2 ; 
int ground_height = 100;
int background_counter = 1;
boolean background_f = true;
int change_backgrond_sec = 30 ; // in 
int time_between_knife = 200 ; 

float img_ratio  = 7.26 ; 

int drop_rate = 8 ;
int jump_rate = 8 ;

int numFrames = 9 ; 
int currentFrame = 0;

int mario_jump_step = 9 ; // this step is * by 5 
int time_between_fireball = 400 ; // this time is in millesec
Mode activeMode;
Tutorial tutorial;



final String robot  = "robot";
final String ninja  = "ninja";
final String zombie = "zombie";
final String coin = "coin";
final String fireb  = "fireb";
final String knifeb = "knifeb";
final String coinb  = "coinb";
final String waterg  = "waterg";
final String spikeg  = "spikeg";
final String movableg = "movableg";


// fire ball 
List<FireBall> fireBalls =new ArrayList<FireBall>();  

List<GameObj> shapes = new ArrayList<GameObj>();
List<GameObj> grounds = new ArrayList<GameObj>();
Hero ninjaHero ;  
Evil[] evils = new Evil[10] ;

PImage fireBallImg ;

PImage[] ninjAttk = new PImage[numFrames] ;
PImage[] ninjClimp = new PImage[numFrames] ;
PImage[] ninjDead = new PImage[numFrames] ;
PImage[] ninjGlide = new PImage[numFrames] ;
PImage[] ninjIdle = new PImage[numFrames] ;
PImage[] ninjJump = new PImage[numFrames] ;
PImage[] ninjJumpAttk = new PImage[numFrames] ;
PImage[] ninjJumpThrow = new PImage[numFrames] ;
PImage[] ninjRun = new PImage[numFrames] ;
PImage[] ninjSlide = new PImage[numFrames] ;
PImage[] ninjThrow = new PImage[numFrames] ;

PImage[][] ninjaImages = new PImage[11][numFrames] ;

PImage[] ground_tiles = new PImage[21];
PImage robot_img ,ninja_img, zombie_img, coin_img,
        special_box_img, coin_box_img, hazard_img,
        saw_img, normalg_img, cliffg_r_img,
        cliffg_l_img, waterg_img, spikeg_img,
        movableg_big_img, movableg_small_img;



// values of keyboard keys 
boolean isShiftPressed = false ,
        isUPPressed = false ,
        isRIGHTPressed = false ,
        isLEFTPressed = false ,
        isDOWNPressed = false ,
        isSpacePressed = false ,
        isCPressed = false ; 
      

void setup(){
  size(1000,600);
  smooth();
  initi_photos() ; 

  ninjaHero = new Hero(ninjaImages , screen_height , drop_rate , jump_rate , 0 , 500 ) ; 
  


  
  
  for(int i=1; i<21; i++) {
        String s = String.format("data/bg/Tiles/%d.png", i);
        ground_tiles[i] = loadImage(s);
        
    }
  robot_img = loadImage("robot/Idle__000.png");
  ninja_img = loadImage("ninja/Idle__000.png");
  zombie_img = loadImage("zombie/Idle__000.png");
  coin_img = loadImage("coin.png");
  special_box_img = loadImage("box_light.png");
  coin_box_img = loadImage("IceBox.png");
  hazard_img = loadImage("Barrel.png");
  saw_img = loadImage("Saw.png");
  normalg_img = ground_tiles[2];
  cliffg_r_img = ground_tiles[3];
  cliffg_l_img = ground_tiles[1];
  waterg_img = ground_tiles[17];
  spikeg_img = ground_tiles[18];
  movableg_big_img = ground_tiles[19];
  movableg_small_img = ground_tiles[20];
  
  

  //ground tiles 
    

  
}



void draw(){
    draw_fire_ball() ;
    move_hero() ; 
    
    ninjaHero.draw( shapes , evils) ;
    
    for(GameObj g: grounds){
      
      
    }
} 


void draw_fire_ball()
{
    for(FireBall ball : fireBalls){
        if(ball != null){
            if(ball.is_intersect(shapes) > 0 ) 
            {

            }
            else
            {
                ball.update_linear();
                ball.draw() ;
            }
    
        }

    }
}


int y(int y ){
    return (screen_height - ground_height) - y ;
}

void keyPressed() {
    if (keyCode == SHIFT ) isShiftPressed = true;
    if (keyCode == UP ) isUPPressed = true;
    if (keyCode == RIGHT ) isRIGHTPressed = true;
    if (keyCode == LEFT ) isLEFTPressed = true;
    if (keyCode == DOWN ) isDOWNPressed = true;
    if ( key == ' ' ) isSpacePressed = true  ;
    if ( key == 'c' ) isCPressed = true  ;
}
void keyReleased() {
    if (keyCode == SHIFT ) isShiftPressed = false;
    if (keyCode == UP ) isUPPressed = false;
    if (keyCode == RIGHT ) isRIGHTPressed = false;
    if (keyCode == LEFT ) isLEFTPressed = false;
    if (keyCode == DOWN ) isDOWNPressed = false;
    if ( key == ' ' ) isSpacePressed = false  ;
    if ( key == 'c' ) isCPressed = false  ;
}


void initi_photos ()
{
     
   

    for (int i = 0; i < numFrames; i++) 
    {
        // ninja photos
        String ninjAttkStr = "ninja/Attack__" + nf(i, 3) + ".png";  ninjAttk[i] = loadImage(ninjAttkStr) ;
        ninjAttk[i].resize(parseInt(ninjAttk[i].width/img_ratio) ,parseInt(ninjAttk[i].height/img_ratio ) ) ;

        String ninjClimpStr = "ninja/Climb_" + nf(i, 3) + ".png"; ninjClimp[i] = loadImage(ninjClimpStr);
        ninjClimp[i].resize(parseInt(ninjClimp[i].width/img_ratio) ,parseInt(ninjClimp[i].height/img_ratio ))  ;

        String ninjIdleStr = "ninja/Idle__" + nf(i, 3) + ".png"; ninjIdle[i] =loadImage(ninjIdleStr) ;
        ninjIdle[i].resize(parseInt(ninjIdle[i].width/img_ratio ),parseInt(ninjIdle[i].height/img_ratio ))  ;

        String ninjJumpStr = "ninja/Jump__" + nf(i, 3) + ".png"; ninjJump[i] = loadImage(ninjJumpStr);
        ninjJump[i].resize(parseInt(ninjJump[i].width/img_ratio ),parseInt(ninjJump[i].height/img_ratio ) ) ;

        String ninjJumpAttkStr = "ninja/Jump_Attack__" + nf(i, 3) + ".png"; ninjJumpAttk[i] =loadImage(ninjJumpAttkStr) ;
        ninjJumpAttk[i].resize(parseInt(ninjJumpAttk[i].width/img_ratio ),parseInt(ninjJumpAttk[i].height/img_ratio ))  ;

        String ninjJumpThrowStr = "ninja/Jump_Throw__" + nf(i, 3) + ".png"; ninjJumpAttk[i] = loadImage(ninjJumpThrowStr);  
        ninjJumpAttk[i].resize(parseInt(ninjJumpAttk[i].width/img_ratio ),parseInt(ninjJumpAttk[i].height/img_ratio ))  ;

        String ninjRunStr = "ninja/Run__" + nf(i, 3) + ".png"; ninjRun[i] =loadImage(ninjRunStr) ;
        ninjRun[i].resize(parseInt(ninjRun[i].width/img_ratio) , parseInt(ninjRun[i].height/img_ratio ))  ;

        String ninjSlideStr = "ninja/Slide__" + nf(i, 3) + ".png"; ninjSlide[i] =loadImage(ninjSlideStr) ;
        ninjSlide[i].resize(parseInt(ninjSlide[i].width/img_ratio) ,parseInt(ninjSlide[i].height/img_ratio ))  ;

        String ninjThrowStr = "ninja/Throw__" + nf(i, 3) + ".png"; ninjThrow[i]= loadImage(ninjThrowStr); 
        ninjThrow[i].resize(parseInt(ninjThrow[i].width/img_ratio ),parseInt(ninjThrow[i].height/img_ratio ))  ;

    }

    ninjaImages[0] = ninjAttk;
    ninjaImages[1] = ninjClimp;
    ninjaImages[2] = ninjDead;
    ninjaImages[3] = ninjGlide;
    ninjaImages[4] = ninjIdle;
    ninjaImages[5] = ninjJump;
    ninjaImages[6] = ninjJumpAttk;
    ninjaImages[7] = ninjJumpThrow;
    ninjaImages[8] = ninjRun;
    ninjaImages[9] = ninjSlide;
    ninjaImages[10] = ninjThrow;

    fireBallImg = loadImage("ninja/Kunai.png") ; fireBallImg.resize(20,20) ;

}


void move_hero()
{
    boolean touch_ground = ninjaHero.is_touch_ground(shapes) ; 
    int obj_intersection =  ninjaHero.is_intersect(shapes)  ; 

    // jump 
    if (isSpacePressed) {
        if(touch_ground){
            ninjaHero.set_jump_status(mario_jump_step) ;
            ninjaHero.jump_up() ;
        }
    }

    // right 
    if (isRIGHTPressed)
    {
        if(obj_intersection != 3)
            ninjaHero.run_right() ;
    }
    // down  
    if (isDOWNPressed) {
        if(!touch_ground){
            ninjaHero.drop_down() ;
        }
    }


    // left 
    if (isLEFTPressed){
        if(obj_intersection != 4)
            ninjaHero.run_left() ;
    }

    if (isCPressed){
        ninjaHero.hit() ;
    }

    if (isShiftPressed){
        if(millis()   > time_between_knife + ninjaHero.last_knife){
            if(ninjaHero.get_knive() > 0 ){
                ninjaHero.last_knife = millis() ;
                fireBalls.add(new FireBall(1 , ninjaHero.get_x() , ninjaHero.get_y() , fireBallImg , ninjaHero.get_dir())) ;
                ninjaHero.throw_arrow() ;
            }
        }
    }

//   println("ok");
//   ninjaHero.draw(ninjaImages , shapes , evils) ;

}
