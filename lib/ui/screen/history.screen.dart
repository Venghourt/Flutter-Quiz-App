import 'package:flutter/material.dart';
import '../../models/quiz.model.dart';
import '../widgets/button.widget.dart';
class HistoryScreen extends StatelessWidget {
  final VoidCallback restartQuiz;
  final Quiz quiz;
  const HistoryScreen({super.key, required this.quiz, required this.restartQuiz});

  List<Widget> listPreviousScores() {
    return quiz.previousScores.asMap().entries.map((entry) {
      int index = entry.key;
      double score = entry.value;
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 630, vertical: 10),
        child: ListTile(
          leading: CircleAvatar(
            child: Text('${index + 1}'),
          ),
          title: Text('Score: $score'),
        ),
      );
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('History'),
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                SizedBox(height: 20),
                Text("Your hightest score ", style: TextStyle(fontSize: 30, color: Colors.white), textAlign: TextAlign.center,),
                Text('${quiz.highestScore}', style: TextStyle(fontSize: 30, color: Colors.black,fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Your Previous Scores',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                ...listPreviousScores(),
                SizedBox(height: 20),
                ButtonWidget(
                  text: 'Restart Quiz',
                  onPressed: restartQuiz,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}