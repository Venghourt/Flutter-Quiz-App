import 'package:flutter/material.dart';
import '../../models/quiz.model.dart';
import './choiceButton.widget.dart';
class QuestionWidget extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback toNextQuestion;
  final Question question;

  const QuestionWidget({super.key, required this.question, required this.toNextQuestion, required this.quiz});

  void getPlayerChoiceIndex(int index, Question question) {
    Answer answer = Answer(question: question, selectedAnswerIndex: index);
    quiz.addAnswer(answer);
    toNextQuestion();
  }

  List<Widget> listChoiceButtons(){
    return question.choices.asMap().entries.map((entry) {
      int index = entry.key;
      String choice = entry.value;
      return Container(
        margin : EdgeInsets.only(bottom: 30),
        child: ChoiceButton(
          answerText: choice,
          onTap: () => getPlayerChoiceIndex(index, question),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children : [
          SizedBox(height: 100),
          Text(question.title, style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),),
          SizedBox(height: 40),
          ...listChoiceButtons(),
        ]
      ),
    );
  }
}