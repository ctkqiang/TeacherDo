class Notes {
  int id;
  int students;
  String title;
  String content;
  String objective;
  String materials;
  String whoisinvolved;
  DateTime date;

  Notes({
    this.id,
    this.title,
    this.content,
    this.objective,
    this.materials,
    this.date,
    this.students,
  });

  Notes.fromMap(Map<String, dynamic> map) {
    this.id = map['_id'];
    this.title = map['_title'];
    this.content = map['_content'];
    this.objective = map['_objective'];
    this.materials = map['_materials'];
    this.date = DateTime.parse(map['_date']);
    this.students = map['_students'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': this.id,
      '_title': this.title,
      '_content': this.content,
      '_objective': this.objective,
      '_materials': this.materials,
      '_date': this.date.toIso8601String(),
      '_students': this.students,
    };
  }
}
