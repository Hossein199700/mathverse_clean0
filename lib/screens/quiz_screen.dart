import 'package:flutter/material.dart';
import '../services/question_service.dart';
import '../models/question.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Question q = QuestionService.generate();
  TextEditingController ans = TextEditingController();

  int score = 0;
  int cup = 0;

  void check() {
    if (int.tryParse(ans.text) == q.answer) {
      score += q.level == "hard" ? 20 : 10;

      if (score % 50 == 0) {
        cup++;
      }
    }

    setState(() {
      q = QuestionService.generate();
      ans.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Score: $score  |  Cup: $cup",
                style: TextStyle(fontSize: 20)),

            SizedBox(height: 30),

            Text(q.text, style: TextStyle(fontSize: 26)),

            TextField(
              controller: ans,
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: check,
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
user.score += q.level == "hard" ? 20 : 10;

if (user.score % 50 == 0) {
  user.cup++;
}
AuthService.updateUser(user);
