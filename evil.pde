class Evil extends GameObj
{

    int step = 3 ; 
    int sh ; 
    int  currentFrame = 0 ;  
    PImage[][] images ; 
    // int[] numFrames = {8,12,15,10} ;
    int[] numFrames  ;
    boolean is_dead =  false;
    boolean is_attack =  false;
    int attack_status = 0 ;
    int dr = 0 ; 
    
    
    public Evil(int _x , int _y , PImage[][] img , int _h , int _w , int _sh , int _step , String type)
    {

       this(_x, _y, img[3][1], _h, _w, _sh, type); 
       this.images = img ; 
       this.step = _step ;
       this.numFrames = new int[4] ; 
       for(int i =0 ; i< img.length ; i++)
           this.numFrames[i] = img[i].length ; 
    }
     public Evil(int _x , int _y , PImage img , int _h , int _w , int _sh, int _step, String type ){
      
       this(_x , _y , img , _h , _w, _sh, _step);
       this.type = type;
       
    }
    public Evil(int _x , int _y , PImage img , int _h , int _w , int _sh, int _step ){
      
       this(_x , _y , img , _h , _w, _sh, "evil");
       this.step = _step;
    }
    public Evil(int _x , int _y , PImage img , int _h , int _w , int _sh, String type)
    {

        super(_x , _y , true , img , _h , _w, type);
        this.set_dir('L') ;
        this.sh= _sh  ;
    }

    public void update (List<GameObj> objects_arr)
    {
       
        if(!this.is_dead){
             int temp = this.is_intersect(objects_arr) ;
            if( temp == 3 )
                this.set_dir('L');
            if( temp == 4 )
                this.set_dir('R') ;

                if(this.get_dir()=='L')
                    move(-this.step,0) ;
                else 
                    move(this.step ,0) ;

                if(this.images[3][(this.currentFrame)] != null )
                    this.change_photo(this.images[3][(this.currentFrame)]) ; 
                this.currentFrame = (this.currentFrame+1)%this.numFrames[3] ; 

          
        }
        else {
            if ( this.dr > 0){
                this.change_photo(this.images[1][(this.currentFrame)]) ; 
                this.currentFrame = (this.currentFrame+1)%this.numFrames[1] ; 
                this.dr -- ;
            }
        }

    }

    public void kill() 
    {
        this.is_dead = true ; 
        this.dr = numFrames[1] ; 
        this.currentFrame = 0 ;
    }

    public void attack() 
    {
        this.attack_status = 8 ; 
        this.is_attack = true ; 
        this.dr = numFrames[0] ; 
        this.currentFrame = 0 ;
    }
}
