class QuizQuestions {
  const QuizQuestions(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers(){
    //method chaining...

    //final only ensures that you dont reassign
    //the variable nothing else!
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}