class QuizQuestion {
  final String caption;
  final String keyWord;
  final String correctAnswer;
  final String incorrectAnswer;

  QuizQuestion({required this.caption, required this.keyWord, required this.correctAnswer, required this.incorrectAnswer});

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      caption: json['caption'],
      keyWord: json['key_word'],
      correctAnswer: json['options']['correct_answer'],
      incorrectAnswer: json['options']['incorrect_answer'],
    );
  }
}