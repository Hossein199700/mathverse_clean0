import 'package:flutter/material.dart';
import '../services/auth.dart';

class Leaderboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = AuthService.users;
    list.sort((a, b) => b.score.compareTo(a.score));

    return Scaffold(
      appBar: AppBar(title: Text("Leaderboard")),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (c, i) {
          var u = list[i];

          return ListTile(
            leading: Text("${i + 1}"),
            title: Text(u.username),
            subtitle: Text("Score: ${u.score} | Cup: ${u.cup}"),
          );
        },
      ),
    );
  }
}
