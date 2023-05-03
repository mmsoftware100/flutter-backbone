class Bill{

  int id;
  String name;
  int coin;
  String image;

  Bill({
    required this.id,
    required this.name,
    required this.coin,
    required this.image
  });



  static Bill get sample {
    return Bill(id: 0, name: "name",coin: 0,  image: "image");
  }
}