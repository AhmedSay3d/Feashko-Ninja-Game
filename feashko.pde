
// feashko production
import java.util.*;
import processing.sound.*;

float angle = 0.0, saw_angle=0;
int screen_width = 1000 ; 
int screen_height = 600 ;
int half_screen = screen_width/2 ; 
int change_backgrond_sec = 30 ; // in 
int time_between_knife = 200 ; 
int saw_motion = 0, saw_draw_back = 1;
float img_ratio  = 7.26 ; 

int drop_rate = 8 ;
int jump_rate = 8 ;

int numFrames = 9 ; 
int currentFrame = 0;

int mario_jump_step = 25 ; // this step is * by 5 
int time_between_fireball = 400 ; // this time is in milleseb

boolean inc_coin = false;
boolean inc_knive = false;

boolean scene_0_drawn = false;
boolean scene_1_drawn = false;
boolean scene_2_drawn = false;
boolean scene_3_drawn = false;
boolean scene_4_drawn = false;
boolean scene_5_drawn = false;
Mode activeMode;



final String robot  = "robot";
final String ninja  = "ninja";
final String zombie = "zombie";
final String coin = "coin";
final String fireb  = "fireb";
final String knifeb = "knifeb";
final String coinb  = "coinb";
final String fixedb = "fixedb";
final String waterg  = "waterg";
final String normalg = "normalg";
final String floatg = "floatg";
final String spikeg  = "spikeg";
final String movableg = "movableg";
final String saw = "saw";
final String hazard = "hazard";
final String fball = "fireball";
final String arrow = "arrow";


// fire ball 
List<FireBall> fireBalls =new ArrayList<FireBall>();  

List<GameObj> shapes = new ArrayList<GameObj>();
List<GameObj> coins = new ArrayList<GameObj>();
List<GameObj> grounds = new ArrayList<GameObj>();
Hero ninjaHero ;  
List<Evil> evils = new ArrayList<Evil>();

PImage fireBallImg, moon, background_g ;   

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

// zombie img 
PImage[] zombieAttack = new PImage[8] ;
PImage[] zombieDead = new PImage[12] ;
PImage[] zombieIdle = new PImage[15] ;
PImage[] zombieWalk = new PImage[10] ;

PImage[][] zombieImages =   new PImage[4][15] ;


PImage[] robotDead = new PImage[11] ; 
PImage[] robotRun = new PImage[9] ; 
PImage[] robotIdle = new PImage[11] ; 
PImage[] robotAttack = new PImage[9] ; 

PImage[][] robotImage = new PImage[4][10] ;  


PImage[] ground_tiles = new PImage[21];
PImage robot_img ,ninja_img, zombie_img, coin_img,
        special_box_img, coin_box_img, hazard_img,
        saw_img, normalg_img, cliffg_r_img,
        cliffg_l_img, waterg_img, spikeg_img,
        movableg_big_img, movableg_small_img,
        fixed_box_img,floating_big_img,
        floating_small_img, knive_img;



// values of keyboard keys 
boolean isShiftPressed = false ,
        isUPPressed = false ,
        isRIGHTPressed = false ,
        isLEFTPressed = false ,
        isDOWNPressed = false ,
        isSpacePressed = false ,
        isEnterPressed = false,
        isCPressed = false ;
boolean gameEnded = false;
PFont pfont;

PImage intro, sound_box_on, sound_box_off;

SoundFile music, sword_hit, knife_hit;

void setup(){
    size(1000,600);
    smooth();
    frameRate(45);
    initi_photos() ;
    
    //intro font
    intro_font = loadFont("data/Ravie-48.vlw");
    textFont(intro_font);
    
    pfont = loadFont("data/Ravie-48.vlw");
    textFont(pfont);
    ninjaHero = new Hero(ninjaImages , screen_height , drop_rate , jump_rate , 0 , y(g_height + 50 )-100) ; 
    //ninjaHero.highlight=true;
    //(int _x , int _y , PImage[][] img , int _h , int _w , int _sh , int _step )
    // evils[0] = new Evil( 500 , y(g_height + 60 ) ,zombieImages , -1 , -1 ,screen_height  , 1 ) ;
    // evils.add( new Evil( initial + 230 , y(g_height + 60 ) ,zombieImages , -1 , -1 ,screen_height  , 1 )) ;
    //intro
    intro = loadImage("data/intro.jpg");
    intro.resize(1000, 600);
    sound_box_on = loadImage("data/Button1.png");
    sound_box_on.resize(100, 100);
    
    sound_box_off = loadImage("data/Button2.png");
    sound_box_off.resize(100, 100);
    //music
    music = new SoundFile(this, "data/Ninja_back.mp3");
    music.loop();
  //background
  background_g = loadImage("data/bg/BG/BG.png");
  moon = loadImage("moon.png");
  background_g.resize(1000, 600);
  moon.resize(100, 100);   
  
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
  fixed_box_img = loadImage("fixed_box.png");
  hazard_img = loadImage("Barrel.png");
  saw_img = loadImage("Saw.png");
  knive_img = loadImage("data/ninja/Kunai.png");
  normalg_img = ground_tiles[2];
  cliffg_r_img = ground_tiles[3];
  cliffg_l_img = ground_tiles[1];
  floating_big_img = ground_tiles[19];
  floating_small_img = ground_tiles[20];
  waterg_img = ground_tiles[17];
  spikeg_img = ground_tiles[18];
  
  scene_0(0);
  //scene_1(screen_width);
  //scene_2(screen_width*2);
  //scene_3(screen_width*3);
  //scene_4(screen_width*4);
  //scene_5(screen_width*5);
  
  
}

void randomScene(int idx){
  int initial = idx * screen_width;
  int sceneidx = int(random(0,6));
  switch(sceneidx){
    case 0:
      scene_0(initial);
      break;
    case 1:
      scene_1(initial);
      break;
    case 2:
      scene_2(initial);
      break;
    case 3:
      scene_3(initial);
      break;
   case 4:
      scene_4(initial);
      break;
   case 5:
      scene_5(initial);
      break;
  }
  
}


void _translate()
{
      if(ninjaHero.get_x() > half_screen )
    {
        translate( -ninjaHero.get_x() +(screen_width/2) , 0 );
        half_screen = ninjaHero.get_x() ; 
    }
    else 
    {
        translate(-half_screen+(screen_width/2) , 0 ) ;
    }
}


PFont intro_font; 
void game_intro(){
  background(intro);
  imageMode(CENTER);
  image(sound_box_on, 50, 50);
  imageMode(CORNER);
  if(mouseX >= 50 && mouseX<=100 && mouseY >=50 && mouseY<=100){
    if(mousePressed){
      image(sound_box_off, 50, 50);
      imageMode(CORNER);
      music.pause();
    }
  }
}

int t = 0;

void draw(){
    if(checkGameEnded()){
      endGame();
      return;
    }
    if(t == 0){
      startGame();
      if(isEnterPressed){t++;}
    }else{
    draw_background();
    _translate() ;
    draw_status(ninjaHero.health , ninjaHero.score  , ninjaHero.knive , ninjaHero.get_coins()) ; 

    //println(shapes.size());
    Iterator<GameObj> it = shapes.iterator();
    
    while(it.hasNext()){
        boolean f = true;
        GameObj a = it.next();
        
        if(a.get_type() == coin && ninjaHero.is_intersect(a,30) > 0  ){
                 inc_coin = true;
            
        }
       
        else if(a.get_type() == arrow && ninjaHero.is_intersect(a,30) > 0){
            
                 inc_knive = true;
        }
        if(inc_coin == true || inc_knive==true){
            it.remove();

        }
        if(inc_coin == true){
            ninjaHero.inc_coins() ;
            inc_coin = false;}
        if(inc_knive == true){
            ninjaHero.inc_knives() ;
            inc_knive = false;}
    }
    
    int saw_num = 1;
    for(GameObj s: shapes){
        if(s.get_type() == saw){
            draw_saw(s.get_x(), s.get_y(), s.img, saw_num,s.is_move);
            // if(ninjaHero.is_intersect(s) ){
            //     ninjaHero.dead() ;
            // }
            saw_num += 3;
            continue;
        }
        s.draw(); 
    }
    
    for(GameObj g: grounds){
       g.draw();
    }
    
    // draw_coin() ; 
    draw_fire_ball() ; 
    draw_evil() ;
    move_hero( ) ;
    ninjaHero.draw(shapes , evils , grounds) ;
    if(half_screen >= screen_width/2 && half_screen < screen_width && !scene_1_drawn){
      scene_1(screen_width);
      scene_1_drawn = true;}
    else if(half_screen > screen_width && half_screen < screen_width*2 && !scene_2_drawn){
      scene_2(screen_width*2);
      scene_2_drawn = true;}
    else if(half_screen > screen_width*2 && half_screen < screen_width*3 && !scene_3_drawn){
      scene_3(screen_width*3);
      scene_3_drawn = true;}
    else if(half_screen > screen_width*3 && half_screen < screen_width*4 && !scene_4_drawn){
      scene_4(screen_width*4);
      scene_4_drawn = true;}
    else if(half_screen > screen_width*4 && half_screen < screen_width*5 && !scene_5_drawn){
      scene_5(screen_width*5);
      scene_5_drawn = true;}
    }
} 
 
void draw_status(int h , int score , int knives , int coins)
{
    fill(0);
    textSize(30);
    text("health "+ h, half_screen+screen_height/2   , 70); 
    text("score "+ score, half_screen+screen_height/2   , 100); 
    text("knives "+ knives, half_screen+screen_height/2   , 130); 
    text("coins "+ coins, half_screen+screen_height/2   , 160); 
}

void draw_background(){
  background(background_g);
  pushMatrix();
  translate(100, 100);
  imageMode(CENTER);
  rotate(angle);
  image(moon, 0, 0);
  angle += 0.02;
  popMatrix();
  imageMode(CORNER);
}


void draw_saw(int x_pos, int y_pos, PImage img, int offset, boolean is_move){
    int initial = 1000 * offset;
    imageMode(CENTER);
    pushMatrix();
    if(is_move == false)
        translate(x_pos - 25, y_pos);
    else
      translate((x_pos - 25 + saw_motion), y_pos);
    
    rotate(saw_angle);
    image(o.get_image(), 0, 0, saw_dim, saw_dim);
    popMatrix();
    imageMode(CORNER);
    
    if(x_pos - 25 + saw_motion <= initial + 500 && saw_draw_back == 0)
          saw_draw_back = 1;
    else if(x_pos - 25 + saw_motion >= initial + 700 && saw_draw_back == 1)
          saw_draw_back = 0;  
    if(saw_draw_back == 1)
        ++saw_motion;
    else
        --saw_motion;
    
    saw_angle += 0.1;

}


// void draw_coin(){
//        pushMatrix();
//         imageMode(CENTER);
//     for(GameObj coin : coins)
//     {
//         // pushMatrix();
//         translate(coin.get_x(), coin.get_y());
//         rotate(angle);
//         coin.draw() ; 

//         // popMatrix();
//         // imageMode(CORNER);
//     }
//     angle += 0.02;
//     // offs *= 1000;
//     // pushMatrix();
//     // translate(x_pos, 100);
//     // imageMode(CENTER);
//     // rotate(angle);
//     // image(moon, 0, 0);
//     // angle += 0.02;
//     popMatrix();
//     imageMode(CORNER);
// }

void draw_fire_ball()
{

    Iterator<FireBall> it = fireBalls.iterator();
    while(it.hasNext()){
        boolean f = true;
        FireBall a = it.next();
        if(a.is_intersect(shapes,20) > 0) {
             f = false;
        }
        if(f == false)
            it.remove();
        else {
            a.update_linear();
            a.draw() ;
        }
    }

}

void draw_evil()
{
    for(Evil evil : evils)
    {   Iterator<FireBall> it = fireBalls.iterator();
        if(evil != null){
          while(it.hasNext()){
                FireBall ball = it.next();
                if(!evil.is_dead)
                    if( abs(Intersect.space_from_right(ball , evil   )) < 5 || abs(Intersect.space_from_left(ball , evil   )) < 5   ){
                    // if(evil.is_intersect(ball )){
                        evil.kill() ;  
                        it.remove();
                    }

            }

            evil.update(shapes) ;
            evil.draw();
        }
    }
}


int y(int y ){
    return (screen_height - g_height) - y ;
}

void keyPressed() {
    if (keyCode == SHIFT ) isShiftPressed = true;
    if (keyCode == UP ) isUPPressed = true;
    if (keyCode == RIGHT ) isRIGHTPressed = true;
    if (keyCode == LEFT ) isLEFTPressed = true;
    if (keyCode == DOWN ) isDOWNPressed = true;
    if(keyCode == ENTER)isEnterPressed = true;
    if ( key == ' ' ) isSpacePressed = true  ;
    if ( key == 'c' ) isCPressed = true  ;
}
void keyReleased() {
    if (keyCode == SHIFT ) isShiftPressed = false;
    if (keyCode == UP ) isUPPressed = false;
    if (keyCode == RIGHT ) isRIGHTPressed = false;
    if (keyCode == LEFT ) isLEFTPressed = false;
    if (keyCode == DOWN ) isDOWNPressed = false;
    if(keyCode == ENTER)isEnterPressed = false;
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

        String ninjJumpThrowStr = "ninja/Jump_Throw__" + nf(i, 3) + ".png"; ninjJumpThrow[i] = loadImage(ninjJumpThrowStr);  
        ninjJumpThrow[i].resize(parseInt(ninjJumpThrow[i].width/img_ratio ),parseInt(ninjJumpThrow[i].height/img_ratio ))  ;

        String ninjRunStr = "ninja/Run__" + nf(i, 3) + ".png"; ninjRun[i] =loadImage(ninjRunStr) ;
        ninjRun[i].resize(parseInt(ninjRun[i].width/img_ratio) , parseInt(ninjRun[i].height/img_ratio ))  ;

        String ninjSlideStr = "ninja/Slide__" + nf(i, 3) + ".png"; ninjSlide[i] =loadImage(ninjSlideStr) ;
        ninjSlide[i].resize(parseInt(ninjSlide[i].width/img_ratio) ,parseInt(ninjSlide[i].height/img_ratio ))  ;

        String ninjThrowStr = "ninja/Throw__" + nf(i, 3) + ".png"; ninjThrow[i]= loadImage(ninjThrowStr); 
        ninjThrow[i].resize(parseInt(ninjThrow[i].width/img_ratio ),parseInt(ninjThrow[i].height/img_ratio ))  ;

        String ninjDeadStr = "ninja/Dead__" + nf(i, 3) + ".png"; ninjDead[i]= loadImage(ninjDeadStr); 
        ninjDead[i].resize(parseInt(ninjDead[i].width/img_ratio ),parseInt(ninjDead[i].height/img_ratio ))  ;

    }
  

    for (int i = 0; i < 8; i++) {
        int t = i+1 ; 
        String zombieAttStr = "zombie/Attack (" + t + ").png"; zombieAttack[i]= loadImage(zombieAttStr); 
        zombieAttack[i].resize(parseInt(zombieAttack[i].width/img_ratio ),parseInt(zombieAttack[i].height/img_ratio ))  ;

    }
    for (int i = 0; i < 12; i++) {
        int t = i+1 ; 
        String zombieDeadStr = "zombie/Dead (" + t + ").png";zombieDead[i]= loadImage(zombieDeadStr); 
        zombieDead[i].resize(parseInt(zombieDead[i].width/img_ratio ),parseInt(zombieDead[i].height/img_ratio ))  ;

    }
    for (int i = 0; i < 15; i++) {
        int t = i+1 ; 
        String zombieIdleStr = "zombie/Idle (" + t + ").png"; zombieIdle[i]= loadImage(zombieIdleStr); 
        zombieIdle[i].resize(parseInt(zombieIdle[i].width/img_ratio ),parseInt(zombieIdle[i].height/img_ratio ))  ;

    }
    for (int i = 0; i < 10; i++) {
        int t = i+1 ; 
        String zombieWalkStr = "zombie/Walk (" + t + ").png"; zombieWalk[i]= loadImage(zombieWalkStr); 
        zombieWalk[i].resize(parseInt(zombieWalk[i].width/img_ratio ),parseInt(zombieWalk[i].height/img_ratio ))  ;

    }



    for (int i = 0; i < 8; i++) {
        int t = i+1 ; 
        String zombieAttStr = "robot/Melee (" + t + ").png"; robotAttack[i]= loadImage(zombieAttStr); 
        robotAttack[i].resize(parseInt(robotAttack[i].width/img_ratio ),parseInt(robotAttack[i].height/img_ratio ))  ;

    }
    for (int i = 0; i < 10; i++) {
        int t = i+1 ; 
        String zombieDeadStr = "robot/Dead (" + t + ").png";robotDead[i]= loadImage(zombieDeadStr); 
        robotDead[i].resize(parseInt(robotDead[i].width/img_ratio ),parseInt(robotDead[i].height/img_ratio ))  ;

    }
    for (int i = 0; i < 10; i++) {
        int t = i+1 ; 
        String zombieIdleStr = "robot/Idle (" + t + ").png"; robotIdle[i]= loadImage(zombieIdleStr); 
        robotIdle[i].resize(parseInt(robotIdle[i].width/img_ratio ),parseInt(robotIdle[i].height/img_ratio ))  ;

    }
    for (int i = 0; i < 8; i++) {
        int t = i+1 ; 
        String zombieWalkStr = "robot/Run (" + t + ").png"; robotRun[i]= loadImage(zombieWalkStr); 
        robotRun[i].resize(parseInt(robotRun[i].width/img_ratio ),parseInt(robotRun[i].height/img_ratio ))  ;

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

    zombieImages[0] =  zombieAttack  ;
    zombieImages[1] =  zombieDead  ;
    zombieImages[2] =  zombieIdle  ;
    zombieImages[3] =  zombieWalk  ;

    robotImage[0] =  robotAttack  ;
    robotImage[1] =  robotDead  ;
    robotImage[2] =  robotIdle  ;
    robotImage[3] =  robotRun  ;


    fireBallImg = loadImage("ninja/Kunai.png") ; fireBallImg.resize(20,20) ;

}


void move_hero()
{
    boolean touch_ground = ninjaHero.is_touch_ground(grounds, shapes) ; 
    int obj_intersection =  ninjaHero.is_intersect(shapes , true )  ; 

    // jump 
    if (isSpacePressed) {
        if(touch_ground && ninjaHero.get_jump_status() == 0 ){
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
        sword_hit = new SoundFile(this, "data/sowrd_hit.wav");
        sword_hit.play();
    }

    if (isShiftPressed){
        if(millis()   > time_between_knife + ninjaHero.last_knife){
            if(ninjaHero.get_knive() > 0 ){
                ninjaHero.last_knife = millis() ;
                fireBalls.add(new FireBall(1 , ninjaHero.get_x() , ninjaHero.get_y() , fireBallImg , ninjaHero.get_dir())) ;
                ninjaHero.throw_arrow() ;
                knife_hit = new SoundFile(this, "knife_hit.wav");
                knife_hit.play();
            }
        }
    }

//   println("ok");
//   ninjaHero.draw(ninjaImages , shapes , evils) ;

}

boolean checkGameEnded(){
   return ninjaHero.health <= 0 || ninjaHero.get_y() > height;
}

void startGame(){
  game_intro();
  textSize(50);
  fill(0);
  textAlign(CENTER);
   text("Fyashko production\nPress Enter to start", width/2, height/2); 
}

void endGame(){
  draw_background();
  textSize(40);
  textAlign(CENTER);
  text("BETTER LUCK NEXT TIME", width/2, height/2);
}