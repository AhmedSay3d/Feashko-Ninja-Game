class Evil extends GameObj
{

    int step = 3 ; 
    int sh ; 
    float  currentFrame = 0 ;  
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
           this.numFrames[i] = img[i].length-1 ; 
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
            int temp = this.is_intersect(objects_arr,20) ;
            if( temp == Intersect.WEST )
                this.set_dir('L');
            if( temp == Intersect.EAST )
                this.set_dir('R') ;
            if(this.attack_status == 0 )
            {
                if(this.get_dir()=='L')
                    move(-this.step,0) ;
                else 
                    move(this.step ,0) ;

                if(this.images[3][round(this.currentFrame)] != null )
                    this.change_photo(this.images[3][round(this.currentFrame)]) ; 
                this.currentFrame = (this.currentFrame+0.4)%this.numFrames[3] ; 
            }
            else 
            {
                this.change_photo(this.images[0][round(this.currentFrame)]) ; 
                this.currentFrame = (this.currentFrame+0.3)%this.numFrames[0] ; 
                this.attack_status -- ;
            }
          
        }
        else {
            if ( this.dr > 0){
                this.change_photo(this.images[1][round(this.currentFrame)]) ; 
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

    public void attack() {
        if (this.attack_status == 0 )
        {
            this.attack_status = 80 ; 
            this.dr = numFrames[0] ; 
            this.currentFrame = 0 ;
            
        }
        
    }
}
