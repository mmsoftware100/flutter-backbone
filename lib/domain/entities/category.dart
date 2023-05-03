class Category{

  int id;
  String name; // display name
  String image;

  Category({
    required this.id,
    required this.name,
    required this.image
  });



  static Category get sample {
    return Category(id: 0, name: "name", image: "image");
  }
}