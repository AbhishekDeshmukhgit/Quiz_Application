import 'package:flutter/material.dart';
import 'package:quiz_application/question.dart';
import 'package:quiz_application/quizdata.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
Quizdata q=Quizdata();
void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scorekeeper=[];
  void checkanswer(bool userpickedanswer)
  {
    bool correctanswer=q.getCorrectAnswer();
    setState((){
      if(q.isFinished()==true)
        {
          Alert(context: context, title: "Quiz Ended", desc: "You have completed quiz successfully").show();
          q.reset();
          scorekeeper=[];
        }
      else {
        if (userpickedanswer == correctanswer) {
          scorekeeper.add(
            Icon(Icons.check, color: Colors.green,),
          );
        }
        else {
          scorekeeper.add(
            Icon(Icons.close, color: Colors.red,),
          );
        }
        q.nextQuestion();
      }
    });

  }
 @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                q.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              // textColor: Colors.white,
              // color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkanswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              //color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkanswer(false);
              },
            ),
          ),
        ),
        Row(
          children:scorekeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/