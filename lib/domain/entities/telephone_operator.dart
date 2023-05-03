class TelephoneOperator{

  int id;
  String name; // display name
  String image;

  TelephoneOperator({
    required this.id,
    required this.name,
    required this.image
  });



  static TelephoneOperator get sample {
    return TelephoneOperator(id: 0, name: "name", image: "image");
  }
}