import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';


class Answer  extends StatelessWidget{

  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler,this.answerText);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.amberAccent,
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }

}