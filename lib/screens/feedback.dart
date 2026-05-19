import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final msg = TextEditingController();

  static List<String> messages = [];

  void send() {
    messages.add(msg.text);
    msg.clear();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Feedback")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: messages.map((e) => ListTile(title: Text(e))).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(controller: msg),
          ),
          ElevatedButton(
            onPressed: send,
            child: const Text("Send"),
          )
        ],
      ),
    );
  }
}
