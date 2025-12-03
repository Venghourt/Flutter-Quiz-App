class Quiz {
  final List<Question> questions;
  List<Answer> answers = [];
  List<double> previousScores = [];
  
  Quiz({required this.questions});
  
  void addAnswer(Answer answer) {
    answers.add(answer);
  }

  void addScore(double score) {
    previousScores.add(score);
  }

  double calculateScore() {
    double totalScore = 0;
    for (var answer in answers) {
      if (answer.isCorrect()) {
        totalScore += answer.question.point;
      }
    }
    addScore(totalScore);
    return totalScore;
  }

  void resetQuiz() {
    answers.clear();
  }

  double get highestScore {
    if (previousScores.isEmpty) {
      return 0;
    }
    return previousScores.reduce((a, b) => a > b ? a : b);
  }
}

class Question {
  final String title;
  final List<String> choices;
  final int correctAnswerIndex;
  final double point;

  Question({
    required this.title,
    required this.choices,
    required this.correctAnswerIndex,
    required this.point,
  });
}

class Answer{
  final Question question;
  final int selectedAnswerIndex;

  Answer({
    required this.question,
    required this.selectedAnswerIndex,
  });

  bool isCorrect() {
    return question.correctAnswerIndex == selectedAnswerIndex;
  }
}

