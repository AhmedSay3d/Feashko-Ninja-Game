class Evil extends GameObj
{

    int step = 3 ; 
    int sh ; 
    int  currentFrame = 0 ;  
    PImage[][] images ; 
    int[] numFrames = {8,12,15,10} ;
    
    
    public Evil(int _x , int _y , PImage[][] img , int _h , int _w , int _sh , int _step , String type)
    {
       this(_x, _y, img[3][1], _h, _w, _sh, type); 
       this.images = img ; 
       this.step = _step ;
    }
     public Evil(int _x , int _y , PImage img , int _h , int _w , int _sh, int _step, String type ){
      
       this(_x , _y , img , _h , _w, _sh, _step);
       this.type = type;
       
    }
    public Evil(int _x , int _y , PImage img , int _h , int _w , int _sh, int _step ){
      
       this(_x , _y , img , _h , _w, _sh, null);
       this.step = _step;
    }
    public Evil(int _x , int _y , PImage img , int _h , int _w , int _sh, String type)
    {
        super(_x , _y , true , img , _h , _w, type);
        this.set_dir('L') ;
        this.sh= _sh  ;
    }

    //private boolean is_touch_ground(List<GameObj> objects_arr  )
    //{
    //    if(this.is_intersect(objects_arr ) == 1 )
    //        return true ;

    //    for(Ground gnd : Ground.grounds){
    //        if(gnd != null){
    //            if(this.get_x() > gnd.from  && this.get_x() < gnd.to){
    //                if( abs (this.get_y() - (this.screen_height-(Ground.height+this.get_height()) )) <= this.drop_rate ){
    //                    return true ;
    //                }
    //            }
    //        }
    //    }
    //    return false ; 
    //}

    public void update (List<GameObj> objects_arr)
    {
        int temp = this.is_intersect(objects_arr) ;
        if( temp == 3 )
            this.set_dir('L');
        if( temp == 4 )
            this.set_dir('R') ;

        if(this.get_dir()=='L')
            move(-this.step,0) ;
        else 
            move(this.step ,0) ;

        this.change_photo(this.images[3][(this.currentFrame)]) ; 
        this.currentFrame = (this.currentFrame+1)%this.numFrames[3] ; 

      
    }
}
