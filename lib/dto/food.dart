class Foods {
  late int? id;
  late String title;
  Foods(this.id, this.title);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'title': title,
    };
    return map;
  }

  Foods.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
  }
}