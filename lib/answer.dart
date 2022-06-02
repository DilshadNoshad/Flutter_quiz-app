import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // final VoidCallback selectHandler;
  final void Function() selectHandler;
  final String answerText;
  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      // width: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue[300],
          onPrimary: Colors.white,
        ),
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
