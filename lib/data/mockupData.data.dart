import '../models/quiz.model.dart';

List<Question> mockupQuestions = [
  Question(
    title: "What is the capital of France?",
    choices: ["Berlin", "Madrid", "Paris", "Rome"],
    correctAnswerIndex: 2,
    point: 10.0,
  ),
  Question(
    title: "Which planet is known as the Red Planet?",
    choices: ["Earth", "Mars", "Jupiter", "Saturn"],
    correctAnswerIndex: 1,
    point: 10.0,
  ),
  Question(
    title: "What is the largest ocean on Earth?",
    choices: ["Atlantic Ocean", "Indian Ocean", "Arctic Ocean", "Pacific Ocean"],
    correctAnswerIndex: 3,
    point: 10.0,
  ),
];

Quiz mockupQuiz = Quiz(questions: mockupQuestions);