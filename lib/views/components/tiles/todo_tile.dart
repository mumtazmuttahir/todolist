//Framework Imports
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile(
      {Key? key,
      required this.userId,
      required this.id,
      required this.titleName,
      required this.isCompleted,
      required this.onChanged,
      required this.deleteTask})
      : super(key: key);

  final int userId;
  final int id;
  final String titleName;
  final bool isCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext) deleteTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade500,
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(6.0)),
          child: Row(
            children: [
              //Checkbox
              Checkbox(value: isCompleted, onChanged: onChanged),
              //Task Name
              Flexible(
                child: Text(
                  titleName,
                  maxLines: 2,
                  style: TextStyle(
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
