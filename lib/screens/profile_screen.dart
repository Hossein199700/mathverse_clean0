import 'package:flutter/material.dart';
import '../services/current_user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bioController.text = CurrentUser.user?.bio ?? "";
  }

  void save() {
    if (CurrentUser.user != null) {
      CurrentUser.user!.bio = bioController.text;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile Saved")),
    );
  }

  @override
  Widget build(BuildContext context) {
    var u = CurrentUser.user;

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text(u?.username.substring(0, 1) ?? "?"),
            ),

            const SizedBox(height: 10),

            Text(u?.username ?? ""),

            const SizedBox(height: 20),

            TextField(
              controller: bioController,
              decoration: const InputDecoration(labelText: "Bio"),
            ),

            const SizedBox(height: 20),

            Text("Score: ${u?.score ?? 0}"),
            Text("Cup: ${u?.cup ?? 0}"),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: save,
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../services/current_user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var u = CurrentUser.user!;

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(child: Text(u.username[0])),

            Text(u.username),
            Text("Score: ${u.score}"),
            Text("Level: ${u.level}"),
            Text("League: ${u.league}"),

            const SizedBox(height: 10),
            Text(u.bio),
          ],
        ),
      ),
    );
  }
}
