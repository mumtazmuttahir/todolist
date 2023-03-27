class ToDoTileModel {
  late int userId;
  late int id;
  late String titleName;
  late bool isCompleted;

  ToDoTileModel(
      {required this.userId,
      required this.id,
      required this.titleName,
      required this.isCompleted});

  static ToDoTileModel fromJson(json) => ToDoTileModel(
      userId: json['userId'],
      id: json['id'],
      titleName: json['title'],
      isCompleted: json['completed']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = titleName;
    data['completed'] = isCompleted;

    return data;
  }
}
