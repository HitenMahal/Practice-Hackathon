final int STALL_WIDTH = 30;
final int STALL_HEIGHT = 15;
final int N_SECTIONS = 6;
final int SECTION_ROWS = 3;
final int SECTION_COLUMNS = 2;
final int ROWS_PER_SECTION = 2;
final int COLUMNS_PER_SECTION = 5;
final int STALLS_PER_SECTION = ROWS_PER_SECTION * COLUMNS_PER_SECTION;
 
ParkingLot  mainLot;
Street northstr, southstr;
Date date;

// Instantiate static objects
void setup(){
  background(#696B71);
  size(500, 300);
  mainLot = new ParkingLot(100, 200, SECTION_ROWS, SECTION_COLUMNS);
  mainLot.drawParkingLot();
  northstr = new Street(30, "North City Street");
  northstr.drawStreet();
  southstr = new Street(height - 30, "South City Street");
  southstr.drawStreet();
  Gate entrance, exit;
  entrance = new Gate (235, 80, true, "entrance");
  entrance.drawGate();
  exit = new Gate(235, 230, true, "exit");
  exit.drawGate();
  date = new Date();
  date.start();
}

// Instantiate dynamic objects
void draw(){
  //background(#0E620E);


}

// Implemented by Niyousha
class ParkingLot {
  // 
  ParkingStallSection [][] parkingLot;
  
  // Constructor - Create parking lot
  ParkingLot(int x_coordinate, int y_coordinate, int rows, int columns){
    parkingLot = new ParkingStallSection[rows][columns];
    int x_position = x_coordinate + 10;
    int y_position = y_coordinate - 10;
    
    // instantiate each ParkingStallSection
    for (int i = 0; i < rows; i++){
      for (int j = 0; j < columns; j++){
        parkingLot[i][j] = new ParkingStallSection(x_position+150*j, y_position-50*i);
      }
    }
  } 
  
  // Draw static parking lot
  void drawParkingLot(){
    strokeWeight(3);
    stroke(255);
    fill (#696B71);
  //  rect(50, 50, 400, 200);
    drawGrass();
    
    for (int i = 0; i < parkingLot.length; i++){
      for (int j = 0; j < parkingLot[i].length; j++){
        parkingLot[i][j].drawSection();
      }
    }
  }
  
  void drawGrass(){
    strokeWeight(3);
    stroke(255);
    fill (#12B22B);
    // bottom grass
    rect(0, 235, 225, 35);
    rect(275, 250, 225, 20);
    
    // top grass
    rect(0, 25, 225, 45);
    rect(275, 50, 225, 20);
    
    // side grass
    rect(0, 70, 50, 200);
    
  }
}

// Implemented by Quinglan
class ParkingStallSection{
  ParkingStall[][] ps;
  int x, y;
  
  ParkingStallSection(int a, int b){
    ps=new ParkingStall[ROWS_PER_SECTION][COLUMNS_PER_SECTION];
    x=a;
    y=b;
  }
  
  void drawSection(){
    int i, j;
    for(i=0; i< ROWS_PER_SECTION; i++){
      for(j=0; j< COLUMNS_PER_SECTION-1; j++){
        ps[i][j]= new ParkingStall(x+STALL_WIDTH*j, y+STALL_HEIGHT*i, STALL_WIDTH, STALL_HEIGHT, false);
        ps[i][j].drawStall();
      }
    }
  }
}

// Implemented by Mahira
class ParkingStall{
  int posx,posy;
  int widthx, heighty;
  boolean decision;
  
  ParkingStall (int x, int y, int tempx, int tempy, boolean b) {
    posx=x;
    posy=y;
    widthx=tempx;
    heighty=tempy;
    decision = b;
  }
  
 void drawStall () {
  stroke(255);
  strokeWeight(2);
 
  if (decision==true){
    fill (255,90,90);    
    rect(posx, posy, widthx, heighty);
  }
  else
  {
    fill(150,600,150);
    rect(posx, posy, widthx, heighty);
  }
 } 
}

class Street{
  int y;
  String name;
  
  Street(int b, String s){
    y=b;
    name=s;
  }
  
  void drawStreet(){
    fill(#696B71);
    strokeWeight(0);
    rect(0, y, width, 30);
    fill(255);
    textAlign(CENTER);
    text(name, width/2, y+20);
  }
}


class Gate {
  int x,y;
  boolean open;
  String exits;

  Gate (int a, int b, boolean k, String sentence){
    x=a;
    y=b;
    open=k;
    exits= sentence;
  }
  
  void drawGate(){  
    stroke(0);
    strokeWeight(3);
    fill (255);
    rect(x-70,y-5, 60,15);
    fill (0);
    text (exits,x-40,y+7);
    
    if(open==true)
    {
      line(x-10,y,x+25,y);
    }
    else
    {
      line(x-10,y,x+15,y-20);
  
    }
  }
}

// Implemented by Hiten
class Date{
int startTime = 0, stopTime = 0;
  boolean running = false;
  void start() {
    startTime=millis();
    running = true;
  }
  
  void mousePressed() {
    if (running) {
      stop();
    }
    else {
      start();
    }
  }
  void stop() {
    stopTime = millis();
    running = false;
  }
  int getElapsedtime() {
    int elapsed;
    if(running) {
      elapsed = (millis() - startTime);
    }
    else {
      elapsed = (stopTime - startTime);
    }
    return elapsed*3600;
  }
  int second() {
    return (getElapsedtime() /1000) % 60;
  }
  int minute() {
    return (getElapsedtime()/1000/60) % 60;
  }
  int hour() {
    return (getElapsedtime()/1000/60/60) % 24;
  }
  int day() {
    return (getElapsedtime()/1000/60/60/24);
  }
  
  void display() {
    fill(0,0,0);
  //  rect(
    textAlign(CENTER);
    text("Day: "+nf(day())+"  Time: "
    +nf(hour(), 2)+":"
    +nf(minute(), 2)+":"
    +nf(second(), 2), 150, 175);
  }
}
