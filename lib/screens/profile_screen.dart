import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String username;

  ProfileScreen({required this.username});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController bio = TextEditingController(text: "");

  int score = 120;
  int cup = 2;

  void save() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Profile Updated")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text(widget.username[0]),
            ),

            SizedBox(height: 20),

            Text(widget.username,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            SizedBox(height: 20),

            TextField(
              controller: bio,
              decoration: InputDecoration(labelText: "Bio"),
            ),

            SizedBox(height: 20),

            Text("Score: $score"),
            Text("Cup: $cup"),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: save,
              child: Text("Save Profile"),
            )
          ],
        ),
      ),
    );
  }
}
