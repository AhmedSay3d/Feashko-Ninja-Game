class Hero extends GameObj
{
    int sh  ; // screen height 
    int jr = 7 ; // jump_rate
    int dr = 8 ;  // drop_rate
    int jump_status = 0 ; 
    int hit_status = 0 ; 
    int throw_status = 0 ; 
    int numFrames = 9 ; 
    int currentFrame = 0 ; 
    int num_arrow ;
    int knive = 3  ;
    int score = 0  ;
    int last_knife = 0 ;
    int num_coins = 0;
    boolean is_running = false ; 
    int temp_x ;
    int verticalSpeed = 4;
    int health = 100  ; 
    boolean is_dead = false ; 

    PImage[][] HeroImg ;


    public Hero(PImage[][] img ,int _sh , int _dr , int _jr, int _x , int _y){
        super(_x , _y ,true , img[4][0] , -1 , -1, "HERO" ) ; 
        this.jr = _jr ;
        this.dr = _dr ; 
        this.set_dir('R') ;
        this.HeroImg = img ; 
        this.sh = _sh ;
    }

    boolean is_touch_ground(){
        for(GameObj obj : grounds )
            if((obj.type == normalg || obj.type== floatg )&& this.is_intersect(obj,10 ) == Intersect.NORTH)
                return true;
            else
              obj.highlight = false;
              
        //for(GameObj obj : shapes){
        // println(String.format("hero: %d %d", get_x(), get_y()));
        //  if(obj.type == saw){
        //    println("______________");
        //    PVector[] p = obj.objCorners(obj);
        //    for(PVector a : p)
        //      println(String.format("saw: %f %f", a.x, a.y));
        //  }
         
        //}
        
        
            
        for(GameObj obj : shapes)
          if(obj.breakble()==false&& this.is_intersect(obj, 8) == Intersect.NORTH)
            return true;
        
        return false ; 
    }


    // 
    public void jump_up()
    {
        if(collidesSideWays(Intersect.SOUTH)){
          drop_down();
          return;
        }
        this.move(0,-this.jr) ;
        this.change_photo(this.HeroImg[5][(this.currentFrame+1)%numFrames] ) ;
        this.set_jump_status(this.get_jump_status() - 1 ) ;
    }
    public void jump_up_attack()
    {
        this.move(0,-this.jr) ;
        this.change_photo(this.HeroImg[6][(this.currentFrame+1)%numFrames] ) ;
        this.set_jump_status(this.get_jump_status() - 1 ) ;
    }
    public void jump_up_throw()
    {
        this.move(0,-this.jr) ;
        this.change_photo(this.HeroImg[7][(this.currentFrame+1)%numFrames] ) ;
        this.set_jump_status(this.get_jump_status() - 1 ) ;
    }
    
    boolean collidesSideWays(int direction){
      for(GameObj obj : shapes){
          int intersectres = is_intersect(obj, 8);
          if(intersectres == direction){
            //obj.highlight = true;
            return true;
          }
          //else obj.highlight = false;
        }
        return false;
    }
    public void run_right( )
    {
        this.change_photo(this.HeroImg[8][(this.currentFrame+1)%numFrames] ) ;
        this.set_dir('R') ;
        if(collidesSideWays(Intersect.WEST) == false){
          this.move(verticalSpeed , 0); 
          this.is_running = true;
        }else
        stopRunning();
        
    }
    public void run_left()
    {
        this.set_dir('L') ;
        this.change_photo(this.HeroImg[8][(this.currentFrame+1)%numFrames] ) ;
        if(collidesSideWays(Intersect.EAST) == false){
        this.move(-verticalSpeed , 0) ; 
        this.is_running = true;
        }else
          stopRunning();
    }
    
    void stopRunning(){
      move(0, 0);
      is_running=false;
    }
    
    public void drop_down()
    {
        this.move(0,this.dr) ;
    }

    public void hit()
    {
        if(this.get_hit_status() ==  0 ){
            this.set_hit_status(this.numFrames +1 ) ;
        }
        this.change_photo(this.HeroImg[0][this.currentFrame]) ; 
    }

    public void throw_arrow()
    {
        if(this.get_throw_status() ==  0 ){
            this.set_throw_status(this.numFrames +1 ) ;
            this.set_knive(this.get_knive()-1) ;
        }
        this.change_photo(this.HeroImg[10][this.currentFrame]) ;  
        
    }
    public int get_knive()
    {
        return this.knive; 
    }
    public void set_knive(int i)
    {
         this.knive = i ; 
    }

    public void set_throw_status(int i )
    {
        this.throw_status = i ; 
    }
    public int get_throw_status()
    {
        return this.throw_status  ; 
    }
    public void set_jump_status(int i )
    {
        this.jump_status = i ;
    }
    public int get_jump_status()
    {
       return this.jump_status  ;
    }
    public void set_hit_status(int i )
    {
        this.hit_status = i ; 
    }
    public int get_hit_status( )
    {
        return this.hit_status  ; 
    }

    public void draw(List<GameObj> objects_arr ,List<Evil> evils ,List<GameObj> grounds  )
    {
        if(killedbysaw()){
          health = 0;
          return;
        }
          
        // check if it touch the
        if(!this.is_dead) 
        {
            int r , l ; 
            for(Evil evil : evils)
            {
                if(!evil.is_dead){
                    r = Intersect.space_from_right(this,evil) ;
                    l = Intersect.space_from_left(this,evil) ;
                    if(r != -1 && l != -1 ){
                        if ((this.get_dir() == 'R' &&  ( r > -10 && r <= 50 )) || (this.get_dir() == 'L' &&( l > -20 && l < 20 ) )) 
                        {
                            if(this.get_hit_status() > 0 )
                            {
                                print("win") ;
                                evil.kill() ; 
                                this.score += 10 ; 
                            } else {
                                evil.attack() ; 
                                this.lose() ; 
                                print("lose");
                            }
                        }
                    }

                }
            }

            //check if is not touch the groudnd drop down 
            boolean touch_ground = this.is_touch_ground() ; 

            if(touch_ground && !this.is_running){

                // hit 
                if(this.get_hit_status() > 0){
                    this.hit(); 
                    this.set_hit_status(this.get_hit_status()-1) ;
                }
                // throw 
                else if (this.get_throw_status() > 0 ){
                    this.throw_arrow(); 
                    this.set_throw_status(this.get_throw_status()-1) ;
                }
                else {
                    this.change_photo(this.HeroImg[4][this.currentFrame]) ;
                }

            }
            else if (this.get_jump_status() > 0)
            {
                // hit 
                if(this.get_hit_status() > 0)
                    this.jump_up_attack();
                // throw
                if (this.get_throw_status() > 0 )
                    this.jump_up_throw();
                else {
                    this.jump_up();
                }
            }
            else if(!touch_ground){
                if(this.get_y() >= this.sh )
                    this.dead() ; 
                this.drop_down(); 
            }
            
        }
        else {
            this.change_photo(this.HeroImg[2][this.currentFrame]) ; 
            if(this.currentFrame ==this.numFrames -1)
                noLoop() ;
        }
        this.currentFrame = (this.currentFrame+1)%this.numFrames ; 
        super.draw() ;
        this.is_running= false ;
    }
    
    boolean killedbysaw(){
      for(GameObj obj : shapes){
          if(obj.type == saw){
            obj.highlight = true;
          }
          if(obj.type == saw && this.is_intersect(obj, 100) != Intersect.NOCOLLISION){
            println("coll");
            return true;
          }
        }
        return false;
    }

    public int get_coins(){
        return this.num_coins ; 
    }
    public void inc_coins()
    {
        this.num_coins ++ ; 
    }

    public void lose() {
        if(this.health > 0  )
            this.health -= 1 ; 
        else
            this.dead();
    }
    public void dead() {
        this.is_dead = true ; 
        this.currentFrame = 0 ; 
    }


}
