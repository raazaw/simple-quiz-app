import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/quiz_logic.dart';

void main() {
  runApp(MaterialApp(home: SafeArea(child: MyApp())));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> trackAnswer = [];

  QuizLogic questionLogic = QuizLogic();

  void checkAnswer(bool userSelectedAnswer) {
    if (questionLogic.getAnswers() == userSelectedAnswer) {
      trackAnswer.add(Icon(
        Icons.check,
        color: Colors.green,
        size: 35,
      ));
    } else {
      trackAnswer.add(Icon(
        Icons.cancel,
        color: Colors.red,
        size: 35,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 10,
              child: Center(
                child: Text(
                  questionLogic.getQuestion(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 32),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 20,
                      primary: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 10)),
                  onPressed: () {
                    setState(() {
                      checkAnswer(true);
                    questionLogic.changeQuestion();
                    });
                    
                  },
                  child: Text("TRUE"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 20,
                      primary: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 20)),
                  onPressed: () {
                    setState(() {
                      checkAnswer(false);
                    questionLogic.changeQuestion();
                    });
                  },
                  child: Text("FALSE"),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: trackAnswer,
            )
          ],
        ),
      ),
    );
  }
}
