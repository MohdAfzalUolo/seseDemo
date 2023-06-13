class TodoItemData {
  String title;
  String subTitle;
  bool isCompleted;

  TodoItemData({
    required this.title,
    required this.subTitle,
    required this.isCompleted,
  });
}

// ///
// // 5 gorcery false
// {
//   "id" : 5,
// "title": 'grocery',
//  "usCompleted": false
// }

/*


class TodoItemData {
    int id;
    String title;
    bool isCompleted;

    TodoItemData({
        this.id,
        this.title,
        this.isCompleted,
    });

    factory TodoItemData.fromJson(Map<String, dynamic> json) => TodoItemData(
        id: json["id"],
        title: json["title"],
        isCompleted: json["isCompleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "isCompleted": isCompleted,
    };
}


Future<List<TodoItemData>> queryAllRows() async {
  List<TodoItemData> dtaList = [];
  List<Map<String, dynamic>> mapList = await _db.query(table);
  for(Map<String,dynamic> mp in mapList){
    dtaList.add(TodoItemData.fromJson(mp));
  }
  return dtaList;
}




 */
