import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProfileView extends StatelessWidget {
  final AppUser user;

  const UserProfileView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.username)),
      body: Column(
        children: [
          Text(user.username),
          Text("Score: ${user.score}"),
          Text("Level: ${user.level}"),
          Text("League: ${user.league}"),
          Text(user.bio),
        ],
      ),
    );
  }
}
