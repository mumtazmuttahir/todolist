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

  ToDoTileModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    titleName = json['title'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = titleName;
    data['isCompleted'] = isCompleted;

    return data;
  }
}
