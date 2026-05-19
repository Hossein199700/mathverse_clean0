import '../models/question.dart';
import 'dart:math';

class QuestionService {
  static Random r = Random();

  static Question generate() {
    int type = r.nextInt(4);

    if (type == 0) {
      int a = r.nextInt(20);
      int b = r.nextInt(20);
      return Question(
        text: "$a + $b = ?",
        answer: a + b,
        level: "medium",
      );
    }

    if (type == 1) {
      int a = r.nextInt(20);
      int b = r.nextInt(20);
      return Question(
        text: "$a - $b = ?",
        answer: a - b,
        level: "medium",
      );
    }

    if (type == 2) {
      int a = r.nextInt(12);
      int b = r.nextInt(12);
      return Question(
        text: "$a × $b = ?",
        answer: a * b,
        level: "hard",
      );
    }

    int a = r.nextInt(100);
    int b = r.nextInt(10) + 1;
    return Question(
      text: "$a ÷ $b = ? (تقریب)",
      answer: a ~/ b,
      level: "hard",
    );
  }
}
