import 'package:brand_assignment/Quiz_App/data/quistion.dart';
import 'package:brand_assignment/Quiz_App/question_screen.dart';
import 'package:brand_assignment/Quiz_App/result_screen.dart';
import 'package:brand_assignment/Quiz_App/splach_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var actveState; // = 'start-Screen';

//method to change the Screen
  void changeScreen() {
    setState(() {
      actveState = 'question-Screen';
    });
  }

//method to Chosse users answer and add to the list
  void chossenAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        actveState = 'result-Screen';
        
      });
    }  
  }

// methos to ReStart the Quiz
  void onRestartQuiz() {

    selectedAnswer = [];
    setState(() {
      actveState = 'question-Screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = SplachScreen(changeScreen);

    if (actveState == 'question-Screen') {
      screenWidget = QuestionScreen(onselectAnswer: chossenAnswer);
    }

    if (actveState == 'result-Screen') {
      screenWidget = ResultScreen(
        chossenAnswer: selectedAnswer,
        onRestartQuiz,
      );
      
    }
    return Scaffold(
      body:   Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      
    );
  }
}
