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
    int last_knife = 0 ; 
    boolean is_running = false ; 
    int temp_x ; 

    PImage[][] HeroImg ;


    public Hero(PImage[][] img ,int _sh , int _dr , int _jr, int _x , int _y){
        super(_x , _y ,true , img[4][0] , -1 , -1 ) ; 
        this.jr = _jr ;
        this.dr = _dr ; 
        this.set_dir('R') ;
        this.HeroImg = img ; 
        this.sh = _sh ;
    }

    boolean is_touch_ground(List<GameObj> arr){
        for(GameObj obj : arr ){
            if(this.is_intersect(obj , true ) == 1 )
                return true ; 
        }
        return false ; 
    }


    // 
    public void jump_up()
    {
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

    public void run_right( )
    {
        this.move(10 , 0) ; 
        this.change_photo(this.HeroImg[8][(this.currentFrame+1)%numFrames] ) ;
        this.set_dir('R') ;
        this.is_running = true ; 
        
    }
    public void run_left()
    {
        this.move(-10 , 0) ; 
        this.change_photo(this.HeroImg[8][(this.currentFrame+1)%numFrames] ) ;
        this.set_dir('L') ;
        this.is_running = true ; 

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

    public void draw(List<GameObj> objects_arr ,Evil[] evils ,List<GameObj> grounds  )
    {
        // check if it touch the 
        for(Evil evil : evils)
        {
            if(this.is_intersect(evil) > 0 ){
                // check if is hit in hit status (from right and left )
                if(this.get_hit_status() > 0 && this.get_dir() == evil.get_dir()){

                }
                // check if no 
                else {

                }

            }
        }

        //check if is not touch the groudnd drop down 
        boolean touch_ground = this.is_touch_ground(grounds) ; 

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
            this.drop_down(); 
        }


        // if(touch_ground && this.get_jump_status() == 0 && this.get_hit_status() == 0  && this.get_throw_status() == 0 ){
        //     this.set_jump_status(0 )  ; 
        //     if(!this.is_running){
        //         this.change_photo(this.HeroImg[4][this.currentFrame]) ;
        //     }
        // }

        // else if (this.get_jump_status() > 0 && this.get_hit_status() > 0 ){
        //     this.jump_up_attack();
        // }
        // else if (this.get_jump_status() > 0 && this.get_throw_status() > 0 ){
        //     this.jump_up_throw();
        // }
        // else if(this.get_jump_status() > 0 ){
        //     this.jump_up();
        // }


        // if(!touch_ground && this.get_jump_status() == 0){
        //     this.drop_down(); 
        // }

        // // increse the current frame         
        // this.currentFrame = (this.currentFrame+1)%this.numFrames ; 
        // super.draw() ;

        // // for hit
        // if(this.get_hit_status() > 0 ){
        //     this.hit(); 
        //     this.set_hit_status(this.get_hit_status()-1) ;
          
        // }

        // // for throw 
        // if(this.get_throw_status() > 0 ){
        //     this.throw_arrow(); 
        //     this.set_throw_status(this.get_throw_status()-1) ;

        // }
        this.currentFrame = (this.currentFrame+1)%this.numFrames ; 
        super.draw() ;


        this.is_running= false ;
    }

}
