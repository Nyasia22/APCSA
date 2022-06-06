public class Retail {
  private String description;
  private int price;
  private int customerid;
  private String country;
  Retail(String description, int price, int customerid, String country) {
    this.description=description;
    this.price=price;
    this.customerid=customerid;
    this.country=country;
  }// End of R counstructer
  public String getProduct(){
    return description; 
  }

}
// ends Retail class 
