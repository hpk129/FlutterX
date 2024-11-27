import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'start_screen.dart';
import 'results_screen.dart';
//import 'package:quiz_app/models/quiz_questions.dart';

class QuizWidget extends StatefulWidget{
  const QuizWidget({super.key});

  @override
  State<QuizWidget> createState(){
    return _QuizWidgetState();
  }
}

class _QuizWidgetState extends State<QuizWidget>{
  List<String> selectedAnswers = [];

  //you can store widgets into variables

  //nullable object
  Widget? activeScreen;

  //Few very clever ways to remove the iniState method:
  //1. storing activeScreen as  a string and then using ternary 
  //operations ....
  // child : activeScreen == 'start-screen ? StartScreen(swithcScreen): const QuestionScreen
  //2. using ternaary opertation but make another variable
  // specially in the build fucntion (outside the widget tree basically)
  //like final switchWidget = activeScreen...same as above
  //now you can write child: switchWidget to increasse readibility
  //3. using if 
  //Widget build(context){
  //      Widget ScreenWidget = StartScreen(switchScreen)
  //      if(activeScreen =='question-screen'){
  //          ScreenWidget = const QuestionScreen();
  //      }....... aage ka code i.e widget tree remains the same

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        //selectedAnswers = [];
        activeScreen =  ResultsScreen(
          choosenAnswer: selectedAnswers,
        );
      });
    }
  }

  void switchScreen(){
    setState((){
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer,);
    });
  }


  @override
 Widget build(context){
  return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration:const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 246, 210, 131),
                Color.fromARGB(255, 164, 164, 252)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight,
              ),
          ),
          child: activeScreen,
        ),
      ),
    );
 }
}