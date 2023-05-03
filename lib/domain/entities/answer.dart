class Answer{

  int id;
  String name;
  int answerId;

  Answer({
    required this.id,
    required this.name,
    required this.answerId
  });



  static Answer get sample {
    return Answer(id: 0, name: "name", answerId: 0);
  }
}