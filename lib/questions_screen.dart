// import 'package:flutter/material.dart';
// import 'answer_button.dart';
// import 'package:quiz_app/data/questions.dart';

// class QuestionsScreen extends StatefulWidget{
//   const QuestionsScreen({super.key});

//   @override
//   State<QuestionsScreen> createState(){
//     return _QuestionsScreenState();
//   }
// }

// class _QuestionsScreenState extends State<QuestionsScreen>{

//   @override
//   Widget build(context){
//       final currentQuestion = questions[0];


//     return SizedBox(
//       width: double.infinity,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//            Text(
//             currentQuestion.text, 
//             style:const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
//           ),
//           const SizedBox(height: 20),
//           //we are converting our questions into widget of type AnswerButton
//           //here we are also using spread operator
//           //meaning jonsi bi list return ho rahi hai after map function usko
//           //individually spread kr rahe hai into elements cuz we are inside a list
//           //children and it can't have another list  :)
//            ...currentQuestion.answers.map((answer) {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 AnswerButton(answer, () {}),
//                 const SizedBox(height: 10), // Space between buttons
//               ],
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen>{

  var currentQuestionIndex = 0;

  //for build function to be executed again and again u need to
  //always use setState....
  void answerQuestion(String selectedAnswers){
    widget.onSelectAnswer(selectedAnswers);
    setState(() {
      currentQuestionIndex = currentQuestionIndex + 1;      
    });
  }

  @override
  Widget build(context){
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        // Added margin and padding to the container
        margin: const EdgeInsets.all(150), // Margin around the container
        padding: const EdgeInsets.all(16), // Padding inside the container
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 20),
            // we are converting our questions into widget of type AnswerButton
            // here we are also using spread operator
            // meaning jonsi bi list return ho rahi hai after map function usko
            // individually spread kr rahe hai into elements cuz we are inside a list
            // children and it can't have another list  :)
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AnswerButton(answer, (){
                    answerQuestion(answer);
                  }),
                  const SizedBox(height: 10), // Space between buttons
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
