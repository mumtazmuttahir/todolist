import 'package:flutter/material.dart';
import 'package:todolist/views/components/components.dart';

class AlertDialogBox extends StatelessWidget {
  AlertDialogBox(
      {super.key,
      required this.textContoller,
      required this.onSave,
      required this.onCancel});

  final TextEditingController textContoller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: textContoller,
              minLines: 1,
              maxLines: 2,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add a new task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DialogButton(buttonText: 'Save', onPressed: onSave),
                const SizedBox(width: 2.0),
                DialogButton(buttonText: 'Cancel', onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
