import 'package:quiz_application/question.dart';
class Quizdata{
  int questionnumber=0;
  List<Questions> Questionbank=[
    Questions('You can lead a cow down stairs but not up stairs.',false),
    Questions('Approximately one quarter of human bones are in the feet.',true),
    Questions('A slug\'s blood is green.',true),
    Questions('Some cats are actually allergic to humans', true),
    Questions('You can lead a cow down stairs but not up stairs.', false),
    Questions('Approximately one quarter of human bones are in the feet.', true),
    Questions('A slug\'s blood is green.', true),
    Questions('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Questions('It is illegal to pee in the Ocean in Portugal.', true),
  ];

  void nextQuestion() {
    if (questionnumber < Questionbank.length - 1) {
      questionnumber++;
    }
  }

  String getQuestionText() {
    return Questionbank[questionnumber].questiontext;
  }
  bool getCorrectAnswer() {
    return Questionbank[questionnumber].questionanswer;
  }
  bool isFinished() {
    if (questionnumber >= Questionbank.length - 1) {
      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }
  void reset()
  {
    questionnumber=0;
  }
}