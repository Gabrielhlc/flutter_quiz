import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final void Function() handleSelected;

  Answer(this.text, this.handleSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
          ),
          onPressed: handleSelected,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
