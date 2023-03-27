//Framework imports
import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  DialogButton({super.key, required this.buttonText, required this.onPressed});

  final String buttonText;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}
