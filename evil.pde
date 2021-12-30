class Evil extends GameObj
{

    int step = 3 ; 
    int sh ; 
    PImage[][] images ; 
    
    
    public Evil(int _x , int _y , PImage[][] img , int _h , int _w , int _sh , int _step )
    {
       this(_x, _y, img[3][1], _h, _w, _sh, null); 
       this.images = img ; 
       this.step = _step ;
    }
    public Evil(int _x , int _y , PImage img , int _h , int _w , int _sh, String type)
    {
        super(_x , _y , true , img , _h , _w, type);
        this.set_dir('L') ;
        this.sh= _sh  ;
    }


    public void update (GameObj[] objects_arr)
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

      
    }
}
