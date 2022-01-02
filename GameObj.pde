class GameObj {

    public PImage img ;
    protected int img_height, img_width;
    protected int x_pos , y_pos ;
    protected char dir ;
    protected float img_scale ;
    protected String type;
    public boolean is_move , is_vis; 
    protected GameObj index  ;
    boolean highlight = false;
    
    public GameObj(int _x , int _y , boolean _is_move , PImage img, int h , int w)
    {
      this(_x, _y, _is_move, img, h, w, null);   
    }
    public GameObj(int _x , int _y , boolean _is_move , PImage img, int h , int w, String type)
    {
        this.set_coordintes(_x,_y ); 
        this.is_move = _is_move ; 
        this.change_photo(img) ; 
        this.set_type(type);
        this.img_height = h;
        this.img_width = w;
        // this.set_height(height);
        // this.set_width(width) ; 


    }
    void  set_coordintes(int _x , int _y )
    {
        this.x_pos = _x ;
        this.y_pos = _y ;
    }

    
    // method to set position and get 
    int get_x()
    {
        return this.x_pos  ;
    }
    void set_x(int x)
    {
        this.x_pos =x ; 
    }
    void set_y(int y)
    {
        this.y_pos =y ; 
    }
    int get_y()
    {
        return this.y_pos  ;
    }
    
    PVector get_corr(){
      return new PVector(this.x_pos, this.y_pos);
    }
    
    // method used in resize and get demention 
    int get_height(){
        if(this.img_height > 0)
            return this.img_height  ;
        return this.img.height ;
    }
    int get_width()
    {
        if(this.img_width > 0)
            return this.img_width  ;
        return this.img.width;
    }
    // void resize(int x , int y )
    // {
    //     this.img.resize(x,y) ; 
    // }
    
  
    
    void set_type(String type){
      
        this.type = type;
    }
    
    String get_type(){
      return this.type;
    }
    GameObj get_intersect_obj(){
      return this.index;
    }
    void change_photo (PImage _img )
    {
        this.change_photo(_img , -1  , -1 ) ;
    }

    void change_photo(PImage  _img , int h , int w )
    {
        this.img = _img ; 
        // if(h!= -1 && w != -1  )
        //     this.resize(h,w) ;
    }

    /* check if intersect 
        1=> form bottom 
        2=> from top 
        3=> from right
        4=> from left 
        -1 =>  didn't intersect  
    */
    int is_intersect (List<GameObj> objects_array)
    {
        return this.is_intersect(objects_array , false ) ;
    }

    int is_intersect(GameObj obj){
        if(obj != null)
            return  Intersect.check(this , obj , true , 0) ;
        else 
            return -1 ; 
    }

    int is_intersect(GameObj obj , int gap){
        if(obj != null)
            return  Intersect.check(this , obj , false , gap) ;
        else 
            return -1 ; 
    }
    int is_intersect(GameObj obj , boolean debug){
        if(obj != null)
            return  Intersect.check(this , obj , debug , 0) ;
        else 
            return -1 ; 
    }

    int is_intersect (List<GameObj> objects_array ,boolean debug ) 
    {
        int temp =-1 ;
        if(objects_array != null)
            for(GameObj obj : objects_array)
            {
                if(obj != null)
                {
                    temp = Intersect.check(this , obj , debug , 0) ;
                    if (temp > 0 )
                    {
                        this.index = obj ; 
                        break ;  
                    }
                }         
            }
        return temp ;
    } 
    

    // method to draw how much the object will move in x dir and y dir 
    void move (int x , int y )
    {
        this.set_x(this.get_x() + x);
        this.set_y(this.get_y() + y);
        // this.draw() ; 
    }

    public void draw()
    {
        if(this.get_dir() =='L' )
        {
            pushMatrix();
            translate( this.get_x() + this.get_width() , this.get_y() );
            scale( -1, 1 );
            image( this.img , 0, 0 );
            popMatrix();
        }
        else 
        {
            image(this.img , this.get_x() , this.get_y(), this.get_width() , this.get_height()) ; 
        }
        if(highlight){
          PVector[] p = objCorners(this);
          for(int i=1; i<4; i++)
            line(p[i].x, p[i].y, p[i-1].x, p[i-1].y);
        }
    } 
    
    PVector[] objCorners(GameObj o){
      // top left, top right, bottom right, bottom left.
      PVector[] ret = new PVector[4];
      ret[0] = new PVector(o.get_x(), o.get_y());
      ret[1] = new PVector(o.get_x()+o.get_width(), o.get_y());
      ret[2] = new PVector(o.get_x()+o.get_width(), o.get_y()+o.get_height());
      ret[3] = new PVector(o.get_x(), o.get_y()+o.get_height());
      return ret;
    }
    
     public PImage get_image(){
       return this.img;
    }

    public char get_dir()
    {   
        return this.dir ; 
    }

    public void  set_dir(char _dir  )
    {
        this.dir = _dir ;
    }

}
