// import 'package:flutter/material.dart';

// class QuestonsSummary extends StatelessWidget{
//   const QuestonsSummary(this.summaryData, {super.key});
//   final List<Map<String,Object>> summaryData;
//   @override
//   Widget build(BuildContext context) {
//     return  SizedBox(
//       height: 300,
//       child: SingleChildScrollView(
//         child:Column(
//               children: summaryData.map((data){
//                 return  Row(children: [
//                   Text(((data['question_index'] as int) + 1).toString()),
//                   Expanded(
//                     child: Column(children: [
//                       Text(data['question'] as String),
//                       const SizedBox(height: 5,),
//                       Text(data['user_answer'] as String),
//                       Text(data['correct_answer'] as String),
//                     ]),
//                   )
//                 ]);
//               }).toList(),
//               ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class QuestonsSummary extends StatelessWidget {
  const QuestonsSummary(this.summaryData, {super.key});
  
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Adjust the height if needed
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final isCorrect = data['user_answer'] == data['correct_answer'];

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isCorrect ? Colors.green[50] : Colors.red[50], // Conditional background color
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isCorrect ? Colors.green : Colors.red,
                  width: 2,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Question number inside a circle
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${(data['question_index'] as int) + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Expanded Column for question and answers
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Question Text with improved font and size
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis, // Prevent text overflow
                        ),
                        const SizedBox(height: 8),
                        // The user answer with color differentiation
                        Text(
                          'Your answer: ${data['user_answer']}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isCorrect ? Colors.green : Colors.red,
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Correct answer with a distinct color
                        Text(
                          'Correct answer: ${data['correct_answer']}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
