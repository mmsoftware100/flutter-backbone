class Description{

  int id;
  int answerId;
  String name;

  Description({
    required this.id,
    required this.answerId,
    required this.name
  });



  static Description get sample {
    return Description(id: 0, answerId: 0, name: "name");
  }
}