import 'package:flutter/material.dart';
//vid 60 is imp !!
class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      // child: Text(style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),'start screen'),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assetss/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(175, 255, 255, 255)),
          const SizedBox(height: 12),
          const Text(
            'Learn flutter the fun way',
            style: TextStyle(
                color: Color.fromARGB(175, 255, 255, 255),
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start'),
          ),
        ],
      ),
    );
  }
}
