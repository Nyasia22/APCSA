ArrayList<Retail> R = new ArrayList<Retail>();
ArrayList<Retail> Japan = new ArrayList<Retail>();
ArrayList<Retail> AUS = new ArrayList<Retail>();
ArrayList<Retail> USA = new ArrayList<Retail>();
Table table;
PImage img;
int mode = 0;
// arrayLists
void setup() {
  fullScreen();
  img = loadImage("https://i.pinimg.com/564x/e9/9d/5a/e99d5ac9916e29d261e46969fa8b43f4.jpg");
  img.resize(width, height);

  table = loadTable("https://raw.githubusercontent.com/jabree00/csvFiles/main/retail_cleaned.csv", "header");
  table.sort("Country");
  //println(table.getRowCount() + "total rows in table");
  int count = 0;
  
  //loops through all the rows in the table and coverts the rows into R objects
  for (TableRow row : table.rows()) {

    String description = row.getString ("Description");
    int price = row.getInt("Price");
    int customerid = row.getInt("Customer ID");
    String country = row.getString("Country");
    Retail myRetail = new Retail(description, price, customerid, country);
    //object description 
    

    if ( country.equals("Japan" )) {
      Japan.add(myRetail);
    }

    if ( country.equals("Australia")) {
      AUS.add(myRetail);
    }

    if ( country.equals("USA")) {
      USA.add(myRetail);
    }
  }
 
}
void draw() {

  if(mode==1){
    // show japan info
    japanPurchases();
    
     
  }
  if(mode==2){
    // show AUS info
    AUSPurchases();
  }
  if(mode==3){
    // show USA info
    USAPurchases();
  }
  if( mode==0){
    // Japan purchases
    background(img);
   
    fill(178, 34, 34); 
    circle(700, 160, 100);
    fill(0, 0, 0);
    text("J", 695, 180);
    textSize(50);
    // AUS purchases
    fill(255, 215, 0);
    circle(1600, 820, 100);
    fill(0, 0, 0);
    text("A", 1592, 850);
    textSize(50);
    // USA purchases
    fill(0, 0, 255);
    circle(330, 900, 100);
    fill(0, 0, 0);
    text("U", 320, 900);
    textSize(50);
  }
  
  
    fill(255);
    circle(50,height-50,20)
    
  
  
} // end draw

public void japanPurchases() {
  //img = loadImage("https://upload.wikimedia.org/wikipedia/commons/4/4a/Flag_of_Japan_-_animated.gif");
  img.resize(width, height);
  background(255,0,0);
  
  fill(0);
  textSize(25);
  textAlign(CENTER);
  for(int i = 0; i < Japan.size(); i++ ){
    System.out.println(Japan.get(i).getProduct());
    text(Japan.get(i).getProduct(), width/2, i*50);
  }
 } // end Japanese Purchases
 
 
public void AUSPurchases() {
  //img = loadImage("https://upload.wikimedia.org/wikipedia/commons/8/88/Flag_of_Australia_%28converted%29.svg");
  //img.resize(width, height);
  background(200,200,0);
  
  fill(0);
  textSize(25);
  textAlign(CENTER);
  for(int i = 0; i < AUS.size(); i++ ){
    System.out.println(AUS.get(i).getProduct());
    text(AUS.get(i).getProduct(), width/2, i*50);
  }
} // end Australia purchases

public void USAPurchases() {
  fill(0,0,255);
  rect(0,0, width,height);
  fill(255);
  textSize(25);
  textAlign(CENTER);
  for(int i = 0; i < USA.size(); i++ ){
    System.out.println(USA.get(i).getProduct());
    text(USA.get(i).getProduct(), width/2, i*50);
    
  }
}
// end USA purchases: it shows the purchases from the US
void mousePressed() {
 
  if(dist(mouseX,mouseY,50,height-50)< 20){
    mode = 0; 
    
  }
  
  if(dist(mouseX,mouseY,700,160)< 100){
    mode = 1;
    
  }
  
  if(dist(mouseX,mouseY,1600, 820)<100){
   mode = 2; 
  }
  
  if(dist(mouseX,mouseY,330,900)<100){
   mode = 3;  
  }

}
// end mouse press
