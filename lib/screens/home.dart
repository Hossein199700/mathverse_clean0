import 'package:flutter/material.dart';

import 'quiz_screen.dart';
import 'profile_screen.dart';
import 'leaderboard.dart';
import 'feedback.dart';

class HomePage extends StatelessWidget {
  final String role;
  final String username;

  const HomePage({
    super.key,
    required this.role,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MathVerse - $role"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 👤 Profile
            ElevatedButton.icon(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileScreen(username: username),
                  ),
                );
              },
              child: const Text("Profile"),
            ),

            const SizedBox(height: 12),

            // 🧠 Quiz
            ElevatedButton.icon(
              icon: const Icon(Icons.quiz),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuizScreen(),
                  ),
                );
              },
              child: const Text("Start Quiz"),
            ),

            const SizedBox(height: 12),

            // 🏆 Leaderboard
            ElevatedButton.icon(
              icon: const Icon(Icons.leaderboard),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Leaderboard(),
                  ),
                );
              },
              child: const Text("Leaderboard"),
            ),

            const SizedBox(height: 12),

            // 💬 Feedback
            ElevatedButton.icon(
              icon: const Icon(Icons.feedback),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FeedbackScreen(),
                  ),
                );
              },
              child: const Text("Feedback"),
            ),

            const Spacer(),

            // 👑 Admin Panel (فقط مدیر)
            if (role == "admin")
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "ADMIN MODE ACTIVE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
