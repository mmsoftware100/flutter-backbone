class GameType{

  int id;
  String name; // display name
  String image;

  GameType({
    required this.id,
    required this.name,
    required this.image
  });



  static GameType get sample {
    return GameType(id: 0, name: "name", image: "image");
  }
}