

int g_x_offset = 50, g_y_offset = 0;
int g_width = 50, g_height = 100;
int box_width=50,box_height=50;
int float_g_y = 200;
int floatg_big_width=200, floating_small_width=100,floatg_width=50, floatg_height= 40;
// scenes:
void scene_0(int offset){
    int initial = 0+offset;
    for(int i=0; i<20;i++){
       if(i == 9 || i == 10 || i == 11)
         grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset - 20), false, waterg_img,g_height,g_width, waterg));
       else if(i==8){
           grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset), false, cliffg_r_img,g_height,g_width, normalg));
        }
       else if(i==12){
           grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset), false, cliffg_l_img,g_height,g_width, normalg));
        }
       else
         grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset), false, normalg_img,g_height,g_width, normalg));
    }
    shapes.add(new GameObj(initial + 200, y(g_y_offset + box_height), false, fixed_box_img, box_height, box_width,fixedb));
    shapes.add(new GameObj(initial + 200, y(g_y_offset + box_height + box_height), false, fixed_box_img, box_height, box_width,fixedb)); 
    shapes.add(new GameObj(initial + 370, y(g_y_offset + box_height), false, fixed_box_img, box_height, box_width,fixedb));
    shapes.add(new GameObj(initial + 370, y(g_y_offset + box_height*2), false, fixed_box_img, box_height, box_width,fixedb));    
   
    evils.add( new Evil(initial + 265, y(g_y_offset +70), zombieImages, -1, -1, screen_height, 1, zombie) );
    
    
    shapes.add(new GameObj(initial + 650, y(g_height + box_height), false, coin_img, box_height, box_width, coin));
    shapes.add(new GameObj(initial + 650, y(g_height + box_height), false, coin_box_img, box_height, box_width, coinb));
    shapes.add(new GameObj(initial + 650+box_width, y(g_height + box_height), false, coin_img, box_height, box_width, coin));
    //shapes.add(new GameObj(initial + 650+box_width, y(g_height + box_height), false, fixed_box_img, box_height, box_width));
    shapes.add(new GameObj(initial + 650+2*box_width, y(g_height + box_height), false, coin_box_img, box_height, box_width, coinb));
    
    
    shapes.add(new GameObj(initial + 650, y(g_y_offset + box_height), false, coin_img, box_height, box_width, coin));
    shapes.add(new GameObj(initial + 650, y(g_y_offset + box_height), false, coin_box_img, box_height, box_width, coinb));
    shapes.add(new GameObj(initial + 650+box_width, y(g_y_offset + box_height), false, coin_img, box_height, box_width, coin));
    shapes.add(new GameObj(initial + 650+box_width, y(g_y_offset + box_height), false, fixed_box_img, box_height, box_width,fixedb));
    shapes.add(new GameObj(initial + 650+2*box_width, y(g_y_offset + box_height), false, coin_box_img, box_height, box_width, coinb));
    
    
    
    for(int i = 0; i < 5; ++i){
        int d = i;
        if(i >= 3)
            d = 5 - i - 1;
        for(int j = 0; j <= d; ++j)
          shapes.add(new GameObj(initial + 850 + (i * box_width), y(g_y_offset + box_height + (j * box_height)), false, fixed_box_img, box_height, box_width,fixedb));    
  }
}


void scene_1(int offset){
  int initial = 0+offset;
  for(int i=0; i<20;i++){
          if(i==14){
           grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset), false, cliffg_r_img,g_height,g_width, normalg));
          
          }
          else if(i==18){
           grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset), false, cliffg_l_img,g_height,g_width, normalg));
          
          }
         else if(i == 15 || i == 16 || i == 17)
             grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset - 20), false, spikeg_img,g_height,g_width, spikeg));
         else
             grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset), false, normalg_img,g_height,g_width, normalg));
   }
  //for(int i = 0; i < 3; ++i)
  //    shapes.add(new GameObj(initial + 50 + (i * 45), y(g_y_offset + 40), false, coin_img, box_height, box_width, coin));
  
      grounds.add(new GameObj(initial+180, y(g_y_offset + 150), false, floating_big_img,40,200, floatg));
  
  //for(int i = 0; i < 3; ++i)
  //      shapes.add(new GameObj(initial+220+(g_x_offset*i), y(g_y_offset + 150 + 40), false, coin_img, box_height, box_width, coin));
  
    shapes.add(new GameObj(initial + 415, y(g_y_offset + box_height), false, fixed_box_img, box_height, box_width, fixedb));
    shapes.add(new GameObj(initial + 415 +  box_width + 200, y(g_y_offset + box_height), false, fixed_box_img, box_height, box_width, fixedb));
    shapes.add(new GameObj(initial + 415 + 2 * box_width + 75, y(g_y_offset), false, saw_img, g_height, g_height, saw));
    
}


void scene_2(int offset){
  
   int initial = 0+offset;  
   for(int i=0; i<20;i++){
         
       if(i==6 || i==13){
           grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset), false, cliffg_r_img,g_height,g_width, normalg));
           
        }
        else if(i==9 || i==16){
           grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset), false, cliffg_l_img,g_height,g_width, normalg));
           
        }
        else if(i == 7 || i ==8 || i == 14 || i==15){
          grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset-20), false, waterg_img,g_height,g_width, waterg));
          
        }
        else {
        grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset), false, normalg_img,g_height,g_width, normalg));
    }}
    
   
     grounds.add(new GameObj(initial+(g_x_offset*2), y(float_g_y), false,floating_big_img,floatg_height, floatg_big_width,floatg));
   
  
  shapes.add(new GameObj(initial+(g_x_offset*9), y(g_y_offset+box_height), false, coin_img,box_height, box_width, coin));
  shapes.add(new GameObj(initial+(g_x_offset*13), y(g_y_offset+box_height), false, coin_img,box_height, box_width, coin));
   
  shapes.add(new GameObj(initial+(g_x_offset*4), y(float_g_y + box_height), false, coin_img,box_height, box_width, coin));
  //shapes.add(new GameObj(initial+(g_x_offset*4-15), y(float_g_y + box_height), false, coin_img,box_height, box_width, coin));
  shapes.add(new GameObj(initial+(g_x_offset*5), y(g_y_offset+box_height), false, coin_img,box_height, box_width, coin));
  
  shapes.add(new GameObj(initial+(g_x_offset*5), y(g_y_offset+box_height), false, coin_box_img,box_height, box_width, coinb));
  shapes.add(new GameObj(initial+(g_x_offset*4), y(float_g_y + box_height), false, coin_box_img,box_height, box_width, coinb));
  //shapes.add(new GameObj(initial+(g_x_offset*4-15), y(float_g_y + box_height), false, coin_box_img,box_height, box_width, coinb));
  shapes.add(new GameObj(initial+(g_x_offset*18), y(g_y_offset+box_height), false, special_box_img,box_height, box_width, "to be random"));
  shapes.add(new GameObj(initial+(g_x_offset*3-15), y(float_g_y + box_height), false, special_box_img,box_height, box_width, "to be randomized"));
 
   shapes.add(new GameObj(initial+(g_x_offset*12), y(g_y_offset + 80), false, robot_img,85,65, robot));
  
}


void scene_3(int offset){
  int initial = 0+offset;
  for(int i=0; i<20; i++){
     if(i==13){
           grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset), false, cliffg_r_img,g_height,g_width, normalg));
        }
       else if(i==18){
           grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset), false, cliffg_l_img,g_height,g_width, normalg));
        }
    else if(i>13 && i<18){
      grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset-20), false, spikeg_img,g_height,g_width, spikeg));
     
   }
   else {
    grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset), false, normalg_img,g_height,g_width, normalg));
  }}
  
  for(int i = 0; i < 5; ++i){
        int d = i;
        if(i >= 3)
            d = 5 - i - 1;
        for(int j = 0; j <= d; ++j)
          shapes.add(new GameObj(initial + 100 + (i * box_width), y(g_y_offset + box_height + (j * box_height)), false, fixed_box_img, box_height, box_width,fixedb));    
  }
  //grounds.add(new GameObj(initial+(195), y(g_y_offset+180), false, fixed_box_img,box_height, box_width));
  evils.add( new Evil(initial + 400, y(g_y_offset +70), zombieImages, 85, 65, screen_height, 1, zombie));
  //evils.add( new Evil(initial + 230, y(g_y_offset +70), robotImage, 85, 65, screen_height, 1, robot) );
  
  shapes.add(new GameObj(initial+(g_x_offset*19), y(g_y_offset+box_height), false, special_box_img, box_height, box_width, "TODO INSERT TYPE NAME"));
}


void scene_4(int offset){
  int initial = 0+offset;
  for(int i=0; i < 5;i++)
      grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset), false, normalg_img,g_height,g_width,normalg));
  for(int i=5; i < 8;i++)
      grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset-20), false, waterg_img,g_height,g_width, waterg));
  for(int i=8; i < 15;i++)
      grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset), false, normalg_img,g_height,g_width,normalg));
  for(int i=15; i < 20;i++)
      grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset-20), false, waterg_img,g_height,g_width, waterg));
  
    
    grounds.add(new GameObj(initial+(g_x_offset*15), y(g_y_offset+150), false, floating_big_img,floatg_height, floatg_big_width,floatg));
    
  
    grounds.add(new GameObj(initial+(g_x_offset*6), y(g_y_offset+250), false, floating_big_img,floatg_height, floatg_big_width,floatg));
  
      grounds.add(new GameObj(initial+(g_x_offset*1), y(g_y_offset+200), false, floating_big_img,floatg_height, floatg_big_width,floatg));
  grounds.add(new GameObj(initial+(g_x_offset*6), y(g_y_offset+100), false, floating_small_img,50,60,floatg));
  
  
  
  // evils[1] = new Evil(initial + 500, y(g_y_offset +70), hazard_img, 100, 50, screen_height, 1, hazard);
  shapes.add(new GameObj(initial+(box_width* 0), y(g_y_offset+300), false, special_box_img, box_height, box_width, "TODO INSERT TYPE NAME"));
  shapes.add(new GameObj(initial+(box_width* 1), y(g_y_offset+300), false, special_box_img, box_height, box_width, "TODO INSERT TYPE NAME"));
  shapes.add(new GameObj(initial+(box_width* 2), y(g_y_offset+300), false, special_box_img, box_height, box_width, "TODO INSERT TYPE NAME"));
  
  shapes.add(new GameObj(initial + 500, y(g_y_offset), true, saw_img, g_height, g_height, saw));
}


void scene_5(int offset){
  int initial = 0+offset;
  for(int i=0; i<20; i++){
    if(i >9){
      grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset-20), false, spikeg_img,g_height,g_width, spikeg));
      continue;
    }
    if(i==9){
      grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset), false, cliffg_r_img,g_height,g_width,normalg));
      continue;}
    grounds.add(new GameObj(initial+(g_x_offset*i), y(g_y_offset), false, normalg_img,g_height,g_width,normalg));
  }
  
  grounds.add(new GameObj(initial+(g_x_offset*13), y(g_y_offset+50), false, floating_small_img,floatg_height, floating_small_width,floatg));
  grounds.add(new GameObj(initial+(g_x_offset*17), y(g_y_offset+100), false, floating_small_img,floatg_height, floating_small_width,floatg));
  
  
    grounds.add(new GameObj(initial+(g_x_offset*18), y(g_y_offset+150), false, floating_big_img,floatg_height, floatg_big_width,floatg));
  
  //evils.add(new Evil(initial + 250, y(g_y_offset +70), robotImage, 85, 65, screen_height, 1, robot));
  //evils.add(new Evil(initial + 350, y(g_y_offset +70), robotImage, 85, 65, screen_height, 1, robot));
  //evils.add(new Evil(initial + 450, y(g_y_offset +70), robotImage, 85, 65, screen_height, 1, robot));
  //shapes.add(new GameObj(initial+(g_x_offset*5), y(g_y_offset + 80), false, robot_img,85,65, "to be randomized"));
  //shapes.add(new GameObj(initial+(g_x_offset*7), y(g_y_offset + 80), false, robot_img,85,65, "to be randomized"));
  //shapes.add(new GameObj(initial+(g_x_offset*9), y(g_y_offset + 80), false, robot_img,85,65, "to be randomized"));
  
}
//end of scenes.
