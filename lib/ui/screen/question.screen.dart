import 'package:flutter/material.dart';
import '../../models/quiz.model.dart';
import '../widgets/questionView.widget.dart';
class QuestionScreen extends StatefulWidget {
  final VoidCallback switchScreen;
  final Quiz quiz;
  const QuestionScreen({super.key, required this.quiz, required this.switchScreen});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void toNextQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: currentQuestionIndex == widget.quiz.questions.length - 1 ? QuestionWidget(
        question: widget.quiz.questions[currentQuestionIndex],
        toNextQuestion: widget.switchScreen,
        quiz: widget.quiz,
      ): QuestionWidget(
        question: widget.quiz.questions[currentQuestionIndex],
        toNextQuestion: toNextQuestion,
        quiz: widget.quiz,
      ),
    );
  }
}