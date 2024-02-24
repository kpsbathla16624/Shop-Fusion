class Sfprice {
  static double calculateTotal(double productprice, String location) {
    double taxrate = 0.10;
    double taxamount = productprice * taxrate;
    double shipingcost = 40;
    double total = productprice + taxamount + shipingcost;
    return total;
  }
}
