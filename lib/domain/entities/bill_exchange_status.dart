class BillExchangeStatus{

  int id;
  String name; // display name
  String image;

  BillExchangeStatus({
    required this.id,
    required this.name,
    required this.image
  });



  static BillExchangeStatus get sample {
    return BillExchangeStatus(id: 0, name: "name", image: "image");
  }
}