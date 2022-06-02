ArrayList<Retail> R = new ArrayList<Retail>();
ArrayList<Retail> Japan = new ArrayList<Retail>();
ArrayList<Retail> AUS = new ArrayList<Retail>();
ArrayList<Retail> USA = new ArrayList<Retail>();
Table table;
PImage img;
int mode = 0;
void setup() {
  fullScreen();
  img = loadImage("https://i.pinimg.com/564x/e9/9d/5a/e99d5ac9916e29d261e46969fa8b43f4.jpg");
  img.resize(width, height);

  table = loadTable("https://raw.githubusercontent.com/jabree00/csvFiles/main/retail_cleaned.csv", "header");
  table.sort("Country");
  //println(table.getRowCount() + "total rows in table");
  int count = 0;

  for (TableRow row : table.rows()) {

    String description = row.getString ("Description");
    int price = row.getInt("Price");
    int customerid = row.getInt("Customer ID");
    String country = row.getString("Country");
    Retail myRetail = new Retail(description, price, customerid, country);

    if ( country.equals("Japan" )) {
      Japan.add(myRetail);
    }

    if ( country.equals("AUS")) {
      AUS.add(myRetail);
    }

    if ( country.equals("USA")) {
      USA.add(myRetail);
    }
  }
 
}
void draw() {
  background(img);
  if(mode==1){
    // show japan info
    japanPurchases();
     
  }
  if(mode==2){
    // show AUS info
  }
  if(mode==3){
    // show USA info
  }
  if( mode==0){
    fill(178, 34, 34); 
    circle(700, 160, 100);
    fill(0, 0, 0);
    text("J", 695, 180);
    textSize(50);
    fill(255, 215, 0);
    circle(1600, 820, 100);
    fill(0, 0, 0);
    text("A", 1592, 850);
    textSize(50);
    fill(0, 0, 255);
    circle(330, 900, 100);
    fill(0, 0, 0);
    text("U", 320, 900);
    textSize(50);
  }
  
} // end draw

public void japanPurchases() {
  fill(178,34,34);
  rect(0, 0, width,height);
  fill(255);
  for(int i = 0; i < Japan.size(); i++ ){
    System.out.println(Japan.get(i).getProduct());
    text(Japan.get(i).getProduct(), width/2, i*50);
  }
  
}


void mousePressed() {
  System.out.println("mouse was pressed");
  if(dist(mouseX,mouseY,700,160)< 100){
    mode = 1;
    System.out.println("pressed Japan"); 
  }
  
  if(dist(mouseX,mouseY,1600, 820)<100){
   mode = 2; 
  }
  
  if(dist(mouseX,mouseY,1600,820)<100){
   mode = 3;  
  }

}
// end mouse press
