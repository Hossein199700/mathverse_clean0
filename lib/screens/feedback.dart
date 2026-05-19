import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  TextEditingController msg = TextEditingController();

  List<String> messages = [];

  void send() {
    messages.add(msg.text);
    msg.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feedback")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: messages.map((e) => Text("• $e")).toList(),
            ),
          ),
          TextField(controller: msg),
          ElevatedButton(onPressed: send, child: Text("Send"))
        ],
      ),
    );
  }
}
