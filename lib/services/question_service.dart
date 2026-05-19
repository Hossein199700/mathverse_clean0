import '../models/question.dart';
import 'dart:math';

class QuestionService {
  static Random r = Random();

  static Question generate() {
    int type = r.nextInt(7);

    // جمع
    if (type == 0) {
      int a = r.nextInt(50);
      int b = r.nextInt(50);
      return Question(
        text: "$a + $b = ?",
        answer: a + b,
        level: "easy",
      );
    }

    // تفریق
    if (type == 1) {
      int a = r.nextInt(50);
      int b = r.nextInt(50);
      return Question(
        text: "$a - $b = ?",
        answer: a - b,
        level: "easy",
      );
    }

    // ضرب
    if (type == 2) {
      int a = r.nextInt(12);
      int b = r.nextInt(12);
      return Question(
        text: "$a × $b = ?",
        answer: a * b,
        level: "medium",
      );
    }

    // تقسیم
    if (type == 3) {
      int b = r.nextInt(10) + 1;
      int a = b * r.nextInt(10);
      return Question(
        text: "$a ÷ $b = ?",
        answer: a ~/ b,
        level: "medium",
      );
    }

    // توان
    if (type == 4) {
      int a = r.nextInt(5) + 2;
      int b = r.nextInt(3) + 2;
      return Question(
        text: "$a^$b = ?",
        answer: pow(a, b).toInt(),
        level: "hard",
      );
    }

    // رادیکال ساده
    if (type == 5) {
      int a = r.nextInt(10) + 1;
      return Question(
        text: "√${a * a} = ?",
        answer: a,
        level: "hard",
      );
    }

    // معادله ساده
    int x = r.nextInt(10) + 1;
    int a = r.nextInt(10) + 1;

    return Question(
      text: "$a + x = ${a + x} → x = ?",
      answer: x,
      level: "hard",
    );
  }
}
