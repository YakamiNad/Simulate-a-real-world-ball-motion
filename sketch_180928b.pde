int numberOfPhotos=3;
PImage[] array = new PImage[4];
PShape temp;
int xpos=0;
int ypos=0;
int zpos=0;
int index;


ArrayList<ball> balls = new ArrayList<ball>();

class ball{
   int ballX,ballY,ballZ,index;
   boolean ballWall;
   boolean ballGround;
   int xv;
   int yv;
   int zv;
   int y_current;
}
void setup(){
 size(600,600,P3D);

 //vertex(height,0,-150);
 endShape();
PImage a= loadImage("pic1.jpg");
PImage b= loadImage("pic2.jpg");
PImage c= loadImage("pic3.jpg");
PImage d= loadImage("pic4.jpeg");
PImage e= loadImage("pic4.jpeg");
PImage f= loadImage("pic4.jpeg");
PImage g= loadImage("pic4.jpeg");
array[0]=a;
array[1]=b;
array[2]=c;
array[3]=d;
array[4]=e;
array[5]=f;
array[6]=g;
}

void draw() {
 
 stroke(0); 
 background(255);
 beginShape(LINES);         // Setting the outline (stroke) to black
 vertex(0,0,0);
 vertex(0,0,-300);
 vertex(width,0,0);
 vertex(width, 0,-300);
 vertex(0,0,-300);
 vertex(width, 0,-300);
 vertex(0,0,-300);
 vertex(0,height,-300);
 vertex(width, 0,-300);
 vertex(width, height,-300);
 vertex(0,height,-300);
 vertex(width, height,-300);
 vertex(0,height,-300);
 vertex(0,height,0);
 vertex(width, height,-300);
 vertex(width,height,0);
 //vertex(height,0,-150);
 endShape();
 //camera(width/2+map(mouseX, 0, width, -2*width, 2*width), 
 //        height/2+map(mouseY, 0, height, -height, height),
 //        height/2/tan(PI*30.0 / 180.0), 
 //        width, height/2.0, 0, 
 //        0, 1, 0);
       
       int a=balls.size();
       for(int i=0;i<a;i++){
         pushMatrix();
         //int temp_x=balls.get(i).ballX;
         //int temp_y=balls.get(i).ballY;
         //int temp_z=balls.get(i).ballZ;
         int temp_index=balls.get(i).index;
translate(balls.get(i).ballX,balls.get(i).ballY,balls.get(i).ballZ);
temp=createShape(SPHERE,20);
  
  temp.setStroke(false);
  temp.setTexture(array[temp_index]);
  shape(temp);
       
// if(balls.get(i).ballWall==false){
//   if(balls.get(i).ballZ>-500){
//  balls.get(i).ballZ=balls.get(i).ballZ-1;
//  balls.get(i).ballX=balls.get(i).ballX=+balls.get(i).xspeed;
//}
//if(balls.get(i).ballZ<=-500){
//  balls.get(i).ballWall=true;
// }
// }
// if(balls.get(i).ballWall==true){
// if(balls.get(i).ballZ<=-500){
//  balls.get(i).ballZ=balls.get(i).ballZ+1;}
//if(balls.get(i).ballZ>=100){
//   balls.get(i).ballWall=false;
// }
// if(balls.get(i).ballZ>-500){
//  balls.get(i).ballZ=balls.get(i).ballZ+1;}  
//}
 
   if(balls.get(i).ballZ>-300){
     balls.get(i).ballZ=balls.get(i).ballZ+int(balls.get(i).zv*0.5);
   }
   if(balls.get(i).ballZ<=-300 || balls.get(i).ballZ>100){
     balls.get(i).zv=balls.get(i).zv*(-1);
     balls.get(i).ballZ=balls.get(i).ballZ+int(balls.get(i).zv*0.5);
   }
   if(balls.get(i).ballX>0 && balls.get(i).ballX<600){
     balls.get(i).ballX=balls.get(i).ballX+int(balls.get(i).xv*0.5);
   }
   if(balls.get(i).ballX<=0 || balls.get(i).ballX>600){
     balls.get(i).xv=balls.get(i).xv*(-1);
     balls.get(i).ballX=balls.get(i).ballX+int(balls.get(i).xv*0.5);
   }
   if(balls.get(i).ballGround==false){
   if(balls.get(i).ballY>0){
      balls.get(i).ballY=balls.get(i).ballY+int(balls.get(i).yv*0.5)+int(0.5*(9.8)*0.5*0.5);
    
   }
   }
   
   if(balls.get(i).ballY>=600){
     balls.get(i).ballGround=true;
     
   }
   if(balls.get(i).ballGround==true){
     balls.get(i).ballY=balls.get(i).ballY-int(balls.get(i).yv*0.5)+int(0.5*(9.8)*0.5*0.5);
     if(balls.get(i).ballY<=balls.get(i).y_current){
       balls.get(i).ballGround=false;
       balls.get(i).y_current= balls.get(i).ballY;
     }
   }
   
   //if( balls.get(i).ballY>400){
   //  balls.get(i).yv=balls.get(i).yv*(-1);
   //  balls.get(i).ballY=balls.get(i).ballY+int(balls.get(i).yv*0.5)+int(0.5*(9.8)*0.5*0.5);
   //}
   // if(balls.get(i).ballY<=0 || balls.get(i).ballY>400){
   //  balls.get(i).zv=balls.get(i).zv*(-1);
   //  balls.get(i).ballZ=balls.get(i).ballZ+int(balls.get(i).zv*0.5);
   //}
   
 
  
 
 popMatrix();}
}

void mouseClicked() {
  //pushMatrix();
  
  index = int(random(6));
  xpos=mouseX;
  ypos=mouseY;
  zpos=0;
  ball temp=new ball();
  temp.ballX=xpos;
  temp.ballY=ypos;
  temp.ballZ=zpos;
  temp.index=index;
  temp.ballGround=false;
  temp.xv=int(random(-20,20));
  temp.yv=int(random(0,20));
  temp.zv=int(random(0,20));
  temp.y_current=ypos;
  balls.add(temp);
  
  
  //translate(mouseX,mouseY,0);
  //temp=createShape(SPHERE,20);
  //int index = int(random(3));
  //temp.setStroke(false);
  //temp.setTexture(array[index]);
  //shape(temp);
  //popMatrix();
  
  
}
