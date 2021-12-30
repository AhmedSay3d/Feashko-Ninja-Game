// scenes:
void scene_0(int offset){
    int initial = 0+offset;
    for(int i=0; i<20;i++){
       if(i == 9 || i == 10 || i == 11)
         grounds.add(new GameObj(initial+(50*i), y(ground_height - 20), false, waterg_img,100,50, waterg));
       else
         grounds.add(new GameObj(initial+(50*i), y(ground_height), false, normalg_img,100,50));
    }
    shapes.add(new GameObj(initial + 200, y(ground_height + 30), false, fixed_box_img, box_height, box_width));
    shapes.add(new GameObj(initial + 200, y(ground_height + 30 + 30), false, fixed_box_img, box_height, box_width)); 
    shapes.add(new GameObj(initial + 370, y(ground_height + 30), false, fixed_box_img, box_height, box_width));
    shapes.add(new GameObj(initial + 370, y(ground_height + 30 + 30), false, fixed_box_img, box_height, box_width));    
   
    evils[0] = new Evil(initial + 230, y(ground_height +70), zombieImages, 85, 65, screen_height, 1, zombie);
    
    
    shapes.add(new GameObj(initial + 650, y(ground_height + 30), false, coin_img, box_height, box_width, coin));
    shapes.add(new GameObj(initial + 650, y(ground_height + 30), false, coin_box_img, box_height, box_width, coinb));
    shapes.add(new GameObj(initial + 680, y(ground_height + 30), false, fixed_box_img, box_height, box_width));
    shapes.add(new GameObj(initial + 710, y(ground_height + 30), false, coin_img, box_height, box_width, coin));
    shapes.add(new GameObj(initial + 710, y(ground_height + 30), false, coin_box_img, box_height, box_width, coinb));
    
    
    
    for(int i = 0; i < 5; ++i){
        int d = i;
        if(i >= 3)
            d = 5 - i - 1;
        println("i = ", i);
        println("d = ", d);

        for(int j = 0; j <= d; ++j){
          println("j = ", j);
          shapes.add(new GameObj(initial + 800 + (i * 30), y(ground_height + 30 + (j * 30)), false, fixed_box_img, box_height, box_width));   
        }  
  }
}


void scene_1(int offset){
  int initial = 0+offset;
  for(int i=0; i<20;i++){
         if(i == 15 || i == 16 || i == 17)
             grounds.add(new GameObj(initial+(50*i), y(ground_height - 20), false, spikeg_img,100,50, spikeg));
         else
             grounds.add(new GameObj(initial+(50*i), y(ground_height), false, normalg_img,100,50));
   }
  for(int i = 0; i < 3; ++i)
      shapes.add(new GameObj(initial + 50 + (i * 45), y(ground_height + 40), false, coin_img, box_height, box_width, coin));
  for(int i = 0; i < 3; ++i){
    if(i == 0)
        grounds.add(new GameObj(initial+215+(50*i), y(ground_height + 150), false, cliffg_l_img,25,50));
    else if(i == 1)
        grounds.add(new GameObj(initial+215+(50*i), y(ground_height + 150), false, normalg_img,25,50));
    else
        grounds.add(new GameObj(initial+215+(50*i), y(ground_height + 150), false, cliffg_r_img,25,50));
  }
  
  for(int i = 0; i < 3; ++i)
        shapes.add(new GameObj(initial+220+(50*i), y(ground_height + 150 + 40), false, coin_img, box_height, box_width, coin));
  
    shapes.add(new GameObj(initial + 415, y(ground_height + 30), false, fixed_box_img, box_height, box_width));
    shapes.add(new GameObj(initial + 600, y(ground_height + 30), false, fixed_box_img, box_height, box_width));
    shapes.add(new GameObj(initial + 550, y(ground_height), false, saw_img, 50, 50, saw));
}


void scene_2(int offset){
  
   int initial = 0+offset;  
   for(int i=0; i<20;i++){
         if(i==0){
            grounds.add(new GameObj(initial+(50*i), y(ground_height), false, cliffg_l_img,100,50));
           continue;  
       }
        if(i == 7 || i ==8 || i == 14 || i==15){
          grounds.add(new GameObj(initial+(50*i), y(ground_height-20), false, waterg_img,100,50, waterg));
          continue;
        }
        grounds.add(new GameObj(initial+(50*i), y(ground_height), false, normalg_img,100,50));
    }
    
   for(int i=2; i<5; i++){
     grounds.add(new GameObj(initial+(50*i), y(200), false, normalg_img,floatg_height, floatg_width));
   }
  
  shapes.add(new GameObj(initial+(50*9), y(ground_height+30), false, coin_img,box_height, box_width, coin));
  shapes.add(new GameObj(initial+(50*13), y(ground_height+30), false, coin_img,box_height, box_width, coin));
   
  shapes.add(new GameObj(initial+(50*2), y(230), false, coin_img,box_height, box_width, coin));
  shapes.add(new GameObj(initial+(50*4-15), y(230), false, coin_img,box_height, box_width, coin));
  shapes.add(new GameObj(initial+(50*5), y(ground_height+30), false, coin_img,box_height, box_width, coin));
  
  shapes.add(new GameObj(initial+(50*5), y(ground_height+30), false, coin_box_img,box_height, box_width, coinb));
  shapes.add(new GameObj(initial+(50*2), y(230), false, coin_box_img,box_height, box_width, coinb));
  shapes.add(new GameObj(initial+(50*4-15), y(230), false, coin_box_img,box_height, box_width, coinb));
  shapes.add(new GameObj(initial+(50*18), y(ground_height+30), false, special_box_img,box_height, box_width, "to be random"));
  shapes.add(new GameObj(initial+(50*3), y(230), false, special_box_img,box_height, box_width, "to be randomized"));
 
  shapes.add(new GameObj(initial+(50*12), y(ground_height + 80), false, robot_img,85,65, robot));
  
}


void scene_3(int offset){
  int initial = 0+offset;
  for(int i=0; i<20; i++){
   if(i>13 && i<18){
      grounds.add(new GameObj(initial+(50*i), y(ground_height-20), false, spikeg_img,100,50, spikeg));
     continue;
   }
    grounds.add(new GameObj(initial+(50*i), y(ground_height), false, normalg_img,100,50));
  }
  
  for(int i=4; i<10;i++)
    grounds.add(new GameObj(initial+(30*i), y(ground_height+30), false, fixed_box_img,box_height, box_width));
  for(int i=4; i<9;i++)
    grounds.add(new GameObj(initial+(30*i+15), y(ground_height+60), false, fixed_box_img,box_height, box_width));
  for(int i=4; i<8;i++)
    grounds.add(new GameObj(initial+(30*i+30), y(ground_height+90), false, fixed_box_img,box_height, box_width));
  for(int i=4; i<7;i++)
    grounds.add(new GameObj(initial+(30*i+45), y(ground_height+120), false, fixed_box_img,box_height, box_width));
  for(int i=4; i<6;i++)
    grounds.add(new GameObj(initial+(30*i+60), y(ground_height+150), false, fixed_box_img,box_height, box_width));
  grounds.add(new GameObj(initial+(195), y(ground_height+180), false, fixed_box_img,box_height, box_width));
  evils[2] = new Evil(initial + 400, y(ground_height +70), zombieImages, 85, 65, screen_height, 1, zombie);
  evils[3] = new Evil(initial + 230, y(ground_height +70), robot_img, 85, 65, screen_height, 1, robot);
  
  shapes.add(new GameObj(initial+(50*19), y(ground_height+30), false, special_box_img, box_height, box_width, "TODO INSERT TYPE NAME"));
}


void scene_4(int offset){
  int initial = 0+offset;
  for(int i=0; i < 5;i++)
      grounds.add(new GameObj(initial+(50*i), y(ground_height), false, normalg_img,100,50));
  for(int i=5; i < 8;i++)
      grounds.add(new GameObj(initial+(50*i), y(ground_height-20), false, waterg_img,100,50, waterg));
  for(int i=8; i < 15;i++)
      grounds.add(new GameObj(initial+(50*i), y(ground_height), false, normalg_img,100,50));
  for(int i=15; i < 20;i++)
      grounds.add(new GameObj(initial+(50*i), y(ground_height-20), false, waterg_img,100,50, waterg));
  for(int i=15; i < 18; i++)
    grounds.add(new GameObj(initial+(50*i), y(ground_height+150), false, normalg_img,floatg_height, floatg_width));
  for(int i=5; i < 12;i++)
    grounds.add(new GameObj(initial+(50*i), y(ground_height+250), false, normalg_img,floatg_height, floatg_width));
  for(int i=0; i < 3;i++)
      grounds.add(new GameObj(initial+(50*i), y(ground_height+200), false, normalg_img,floatg_height, floatg_width));
  grounds.add(new GameObj(initial+(50*5-25), y(ground_height+125), false, normalg_img,50,60));
  
  
  
  //evils[1] = new Evil(initial + 500, y(ground_height +70), hazard_img, 100, 50, screen_height, 1, hazard);
  shapes.add(new GameObj(initial+(40* 0), y(ground_height+300), false, special_box_img, box_height, box_width, "TODO INSERT TYPE NAME"));
  shapes.add(new GameObj(initial+(40* 1), y(ground_height+300), false, special_box_img, box_height, box_width, "TODO INSERT TYPE NAME"));
  shapes.add(new GameObj(initial+(40* 2), y(ground_height+300), false, special_box_img, box_height, box_width, "TODO INSERT TYPE NAME"));
  
  shapes.add(new GameObj(initial + 500, y(ground_height), false, saw_img, 50, 50, saw));

}


void scene_5(int offset){
  int initial = 0+offset;
  for(int i=0; i<20; i++){
    if(i >9){
      grounds.add(new GameObj(initial+(50*i), y(ground_height-20), false, spikeg_img,100,50, spikeg));
      continue;
    }
    grounds.add(new GameObj(initial+(50*i), y(ground_height), false, normalg_img,100,50));
  }
  
  grounds.add(new GameObj(initial+(50*13), y(ground_height+50), false, normalg_img,floatg_height, floatg_width));
  grounds.add(new GameObj(initial+(50*17), y(ground_height+100), false, normalg_img,floatg_height, floatg_width));
  
  for(int i=18; i<20;i++)
    grounds.add(new GameObj(initial+(50*i), y(ground_height+150), false, normalg_img,floatg_height, floatg_width));
  
  evils[4] = new Evil(initial + 250, y(ground_height +70), robot_img, 85, 65, screen_height, 1, robot);
  evils[5] = new Evil(initial + 350, y(ground_height +70), robot_img, 85, 65, screen_height, 1, robot);
  evils[6] = new Evil(initial + 450, y(ground_height +70), robot_img, 85, 65, screen_height, 1, robot);
  shapes.add(new GameObj(initial+(50*5), y(ground_height + 80), false, robot_img,85,65, "to be randomized"));
  shapes.add(new GameObj(initial+(50*7), y(ground_height + 80), false, robot_img,85,65, "to be randomized"));
  shapes.add(new GameObj(initial+(50*9), y(ground_height + 80), false, robot_img,85,65, "to be randomized"));
  
}
//end of scenes.
