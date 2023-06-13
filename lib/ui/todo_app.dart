import 'package:dummy/data/todo_data.dart';
import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  // final List<TodoItemData> todoList;
  const TodoApp({
    Key? key,
    // required this.todoList
  }) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<TodoItemData> todoList = [];
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 40),
              shrinkWrap: true,
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: todoList[index].isCompleted
                          ? Colors.greenAccent
                          : Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(8)),
                  width: double.infinity,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${todoList[index].title}'),
                      /* isCompleted: ${todoList[index].isCompleted.toString()}*/
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              ///this logic is for your checkbox
                              todoList[index].isCompleted =
                                  !(todoList[index].isCompleted);
                            });
                          },
                          icon: Icon(Icons.cached)),
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          _textEditingController.text = todoList[index].title;
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12),
                              )),
                              builder: (context) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      top: 36,
                                      right: 20,
                                      left: 20,
                                      bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom +
                                          36),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          controller: _textEditingController,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter ToDo Title',
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              todoList[index].title =
                                                  _textEditingController.text;
                                              // Map<String,dynamic> row = todoList.toJson();
                                            });

                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 18),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.blueAccent,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: const Center(
                                                child: Text(
                                              'Update todo title',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            )),
                                          ),
                                        ),
                                      ]),
                                );
                              });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            todoList.removeAt(index);

                            ///logic for edit title
                            // showBottomSheet(context: context, builder: builder)
                            //  todoList[index].title = _textEditingController.text;
                          });
                        },
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 12,
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _textEditingController.text = '';
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
              )),
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: 36,
                      right: 20,
                      left: 20,
                      bottom: MediaQuery.of(context).viewInsets.bottom + 36),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    TextField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter ToDo Title',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (_textEditingController.text.isNotEmpty) {
                            TodoItemData obj = TodoItemData(
                                title: _textEditingController.text,
                                subTitle: '',
                                isCompleted: false);
                            // Map<String,dynamic> row=  obj.toJson();
                            todoList.add(obj);
                          }
                        });

                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                            child: Text(
                          'Add a Todo',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                      ),
                    ),
                  ]),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
