import 'package:flutter/material.dart';
import './ui/screen/welcome.screen.dart';
import './ui/screen/question.screen.dart';
import './data/mockupData.data.dart';
import './ui/screen/result.screen.dart';
import './ui/screen/history.screen.dart';
enum AppScreen {
  welcome,
  quiz,
  result,
  history
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppScreen currentScreen = AppScreen.welcome;

  void switchScreen(AppScreen screen) {
    setState(() {
      currentScreen = screen;
    });
  }

  void restartQuiz(){
    setState(() {
      currentScreen = AppScreen.welcome;
      mockupQuiz.resetQuiz();
    });
  }

  Widget get screenToShow {
    switch (currentScreen) {
      case AppScreen.welcome:
        return WelcomeScreen(switchScreen:() => switchScreen(AppScreen.quiz));
      case AppScreen.quiz:
        return QuestionScreen(quiz: mockupQuiz, switchScreen:() => switchScreen(AppScreen.result));
      case AppScreen.result:
        return Result(quiz:mockupQuiz, restartQuiz: restartQuiz, switchScreen:() => switchScreen(AppScreen.history));
      case AppScreen.history:
        return HistoryScreen(quiz: mockupQuiz, restartQuiz: restartQuiz);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: screenToShow
    );
  }
}