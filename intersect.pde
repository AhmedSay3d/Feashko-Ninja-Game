import java.util.stream.IntStream;
static class Intersect{

    static int check (GameObj obj1 , GameObj obj2 , boolean  debug)
    {
      
      
       int obj1_sx = obj1.get_x()  ,
           obj1_sy = obj1.get_y() ,
           obj1_ey = obj1_sy+obj1.get_height() ,
           obj1_ex = obj1_sx+obj1.get_width() ;

       int obj2_sx = obj2.get_x()  ,
           obj2_sy = obj2.get_y() ,
           obj2_ey = obj2_sy+obj2.get_height() ,
           obj2_ex = obj2_sx+obj2.get_width() ;
       
       // create the x and y ranges for both objects in the four edges.
       //IntStream stream1h = IntStream.range(obj1_sx, obj1_ex);
       //IntStream stream1w= IntStream.range(obj1_sy, obj1_ey);
       
       //IntStream stream2h = IntStream.range(obj2_sx, obj2_ex);
       //IntStream stream2w= IntStream.range(obj2_sy, obj2_ey);
       
       
       //IntStream stream1lx = IntStream.range(obj1_sx, obj1_sx+5);
       //IntStream stream1rx = IntStream.range(obj1_ex-5, obj1_ex);
       //IntStream stream1ty = IntStream.range(obj1_sy, obj1_sy+5);
       //IntStream stream1by = IntStream.range(obj1_ey-5, obj1_ey);
       
       //IntStream stream2lx = IntStream.range(obj2_sx, obj2_sx+5);
       //IntStream stream2rx = IntStream.range(obj2_ex-5, obj2_ex);
       //IntStream stream2ty = IntStream.range(obj2_sy, obj2_sy+5);
       //IntStream stream2by = IntStream.range(obj2_ey-5, obj2_ey);
        
        // obj1 (x,y) arrays for left, right, top, bottom
        
        PVector PVector = new PVector(5,5);
        
        
        
        List<PVector> PVectors_obj1_left = new ArrayList<PVector>();
        List<PVector> PVectors_obj1_right = new ArrayList<PVector>();
        List<PVector> PVectors_obj1_top = new ArrayList<PVector>();
        List<PVector> PVectors_obj1_bottom = new ArrayList<PVector>();
        
        List<PVector> PVectors_obj2_left = new ArrayList<PVector>();
        List<PVector> PVectors_obj2_right = new ArrayList<PVector>();
        List<PVector> PVectors_obj2_top = new ArrayList<PVector>();
        List<PVector> PVectors_obj2_bottom = new ArrayList<PVector>();
        
        //create the PVector lists for obj1
        //left
        for(int i=obj1_sx; i<obj1_sx+5;i++){
            for(int j=obj1_sy; i<=obj1_ey;j++){
                PVectors_obj1_left.add(new PVector(i,j));
            
          }}
         //right
         for(int i=obj1_ex-4; i<=obj1_ex;i++){
            for(int j=obj1_sy; i<=obj1_ey;j++){
                PVectors_obj1_right.add(new PVector(i,j));
            
        }}
        //top
         for(int i=obj1_sx; i<obj1_ex;i++){
            for(int j=obj1_sy; i<=obj1_sy+5;j++){
                PVectors_obj1_top.add(new PVector(i,j));
          
        }}
        //bottom
        for(int i=obj1_sx; i<obj1_ex;i++){
            for(int j=obj1_ey-4; i<=obj1_ey;j++){
                PVectors_obj1_bottom.add(new PVector(i,j));
          
        }}
        
        //create the PVector lists for obj1
        //left
        for(int i=obj2_sx; i<obj2_sx+5;i++){
            for(int j=obj2_sy; i<=obj2_ey;j++){
                PVectors_obj2_left.add(new PVector(i,j));
            
          }}
         //right
         for(int i=obj2_ex-4; i<=obj2_ex;i++){
            for(int j=obj2_sy; i<=obj2_ey;j++){
                PVectors_obj2_right.add(new PVector(i,j));
            
        }}
        //top
         for(int i=obj2_sx; i<obj2_ex;i++){
            for(int j=obj2_sy; i<=obj2_sy+5;j++){
                PVectors_obj2_top.add(new PVector(i,j));
          
        }}
        //bottom
        for(int i=obj2_sx; i<obj2_ex;i++){
            for(int j=obj2_ey-4; i<=obj2_ey;j++){
                PVectors_obj2_bottom.add(new PVector(i,j));
          
        }}

        for(PVector p: PVectors_obj1_left){
          println(p);
        }
        return -1;
        
        //if(){
        
        //}
        //else if(){
       
        //}
        //else if(){
        
        //}
        //else if(){
        
        //}
        //else 
        //    return -1 ;
        
        


    }


}
