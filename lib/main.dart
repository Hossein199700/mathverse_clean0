import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home.dart';
import 'screens/quiz_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/leaderboard.dart';
import 'screens/feedback.dart';

import 'services/auth.dart';
import 'services/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🧠 راه‌اندازی سیستم ذخیره‌سازی
  await StorageService.init();
  AuthService.load();

  runApp(const MathVerseApp());
}

class MathVerseApp extends StatelessWidget {
  const MathVerseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MathVerse',

      // 🎨 تم کامل اپ
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),

        scaffoldBackgroundColor: Colors.white,

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // 🌟 اولین صفحه اپ
      home: const SplashScreen(),

      // 🧭 مسیرهای کامل اپ
      routes: {
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),

        '/home_student': (_) =>
            HomePage(role: "student", username: ""),

        '/home_admin': (_) =>
            HomePage(role: "admin", username: ""),

        '/quiz': (_) => QuizScreen(),
        '/profile': (_) => ProfileScreen(username: ""),
        '/leaderboard': (_) => const Leaderboard(),
        '/feedback': (_) => const FeedbackScreen(),
      },
    );
  }
}
