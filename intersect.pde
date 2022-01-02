static class Intersect{
    static final int  NORTH =0, EAST = 1, SOUTH = 2, WEST = 3, NOCOLLISION = -1,
     TOPLEFT=0 , TOPRIGHT=1, BOTTOMRIGHT=2, BOTTOMLEFT=3; 
    static int check(GameObj pri, GameObj sec, boolean  debug, int gap)
    {
      /* return pri place relative to sec.
         return 0 for north, 1 for east, 2 for south, 3 for west and -1 if there is no collison.
         Please use the final variables instade of their numerical values.
         for instance use Intersect.NORTH instade of 0.
       */
      PVector[] pricorns = objCorners(pri);
      PVector[] seccorns = objCorners(sec);
      if(checkWestCollision(pricorns, seccorns, gap)){
        print("W");
        return WEST;
      }
      if(checkEastCollision(pricorns, seccorns, gap)){
        print("E");
        return EAST;
      }
      if(checkNorthCollision(pricorns, seccorns, gap)){
        println("N");
        return NORTH;
      }
      if(checkSouthCollision(pricorns, seccorns, gap))
        return SOUTH;
      return NOCOLLISION;

    }
    
    static boolean checkWestCollision(PVector[] pri, PVector[] sec, int gap){
      ArrayList<Boolean> conds = new ArrayList<Boolean>();
      
      conds.add(pri[TOPLEFT].x < sec[TOPLEFT].x); // top left x.
      conds.add(pri[TOPRIGHT].x <= sec[TOPRIGHT].x); // topright x
      conds.add(pri[TOPRIGHT].x >= sec[TOPLEFT].x);
      conds.add(abs(pri[BOTTOMLEFT].y - sec[BOTTOMLEFT].y) <= gap); // bottom left.
      if(!conds.contains(false))
        println(String.format("WEST %f %f %f", pri[TOPRIGHT].x, sec[TOPLEFT].x, pri[TOPRIGHT].x));
      return !conds.contains(false);
    }
    
    static boolean checkEastCollision(PVector[] pri, PVector[] sec, int gap){
      ArrayList<Boolean> conds = new ArrayList<Boolean>();
      
      conds.add(pri[TOPRIGHT].x > sec[TOPRIGHT].x); // top right x.
      conds.add(pri[TOPLEFT].x >= sec[TOPLEFT].x && pri[TOPLEFT].x < sec[TOPRIGHT].x);
      conds.add(abs(pri[BOTTOMLEFT].y - sec[BOTTOMLEFT].y) <= gap); 
      if(!conds.contains(false))
        println(String.format("EAST %f %f %f", pri[TOPLEFT].x, sec[TOPLEFT].x, sec[TOPRIGHT].x));
      return !conds.contains(false);
    }
    
    static boolean checkNorthCollision(PVector[] pri, PVector[] sec, int gap){
       ArrayList<Boolean> conds = new ArrayList<Boolean>();
       conds.add( pri[BOTTOMLEFT].y <= sec[TOPLEFT].y + gap); // y
       conds.add( pri[BOTTOMLEFT].y >= sec[TOPLEFT].y - gap/2);
       conds.add( pri[TOPLEFT].x >= sec[TOPLEFT].x && pri[TOPLEFT].x <= sec[TOPRIGHT].x); // top left in bound
       conds.add( pri[TOPRIGHT].x >= sec[TOPLEFT].x && pri[TOPRIGHT].x <= sec[TOPRIGHT].x); // top right in bound
       println(String.format("NORTH %f %f %f", pri[BOTTOMLEFT].y, sec[TOPLEFT].y, sec[TOPRIGHT].y));
       return conds.get(0) && conds.get(1) && (conds.get(2) || conds.get(3));
    }
    
    static  boolean checkSouthCollision(PVector[] pri, PVector[] sec, int gap){
      return checkNorthCollision(sec, pri, gap);
    }
    
    static PVector objCenterPoint(GameObj o){
      int x = o.get_x() + o.get_width()/2;
      int y = o.get_y() + o.get_height()/2;
      return new PVector(x, y);
    }
    
    static PVector[] objCorners(GameObj o){
      // top left, top right, bottom right, bottom left.
      PVector[] ret = new PVector[4];
      ret[TOPLEFT] = new PVector(o.get_x(), o.get_y());
      ret[TOPRIGHT] = new PVector(o.get_x()+o.get_width(), o.get_y());
      ret[BOTTOMRIGHT] = new PVector(o.get_x()+o.get_width(), o.get_y()+o.get_height());
      ret[BOTTOMLEFT] = new PVector(o.get_x(), o.get_y()+o.get_height());
      return ret;
    }
    
    static int space_from_right(GameObj pri , GameObj sec )
    {
        int pri_x = pri.get_x()  ,
            pri_y = pri.get_y() ,
            pri_h = pri.get_height() ,
            pri_w = pri.get_width() ;

        int sec_x = sec.get_x()  ,
           sec_y = sec.get_y() ,
           sec_h = sec.get_height() ,
           sec_w = sec.get_width() ;

        //    println(pri_y , pri_h  , sec_y , sec_h ) ;

         if(   (pri_y >= sec_y && pri_y <= sec_y+sec_h  ) 
            || (pri_y+pri_h >= sec_y && pri_y+pri_h <= sec_y+sec_h  )
         ) 
            return (pri_x + pri_w) -sec_x ;
        else 
            return -1 ; 
    }
    static int space_from_left(GameObj pri , GameObj sec )
    {
        int pri_x = pri.get_x()  ,
            pri_y = pri.get_y() ,
            pri_h = pri.get_height() ,
            pri_w = pri.get_width() ;

        int sec_x = sec.get_x()  ,
           sec_y = sec.get_y() ,
           sec_h = sec.get_height() ,
           sec_w = sec.get_width() ;

         if(   (pri_y >= sec_y && pri_y <= sec_y+sec_h  ) 
                ||( pri_y+pri_h >= sec_y && pri_y+pri_h <= sec_y+sec_h  ) 
         ) 
            return pri_x - (sec_x + sec_w)  ;
        else 
            return -1 ; 
    }


}
