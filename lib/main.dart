import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'services/storage.dart';
import 'services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await StorageService.init();
  AuthService.loadUsers();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: LoginPage(),
    );
  }
}

// ================= LOGIN =================

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final u = TextEditingController();
  final p = TextEditingController();

  final admins = {
    "Hossein_1997": "1234567",
    "AmirAli_1997": "1234567",
  };

  void login() {
    if (admins[u.text] == p.text) {
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => Home(role: "admin")));
      return;
    }

    var user = AuthService.login(u.text, p.text);

    if (user != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => Home(role: "student")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: u, decoration: InputDecoration(labelText: "Username")),
            TextField(controller: p, decoration: InputDecoration(labelText: "Password")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: login, child: Text("Login")),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RegisterPage()),
              ),
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= REGISTER =================

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final u = TextEditingController();
  final p = TextEditingController();

  void register() {
    bool ok = AuthService.register(u.text, p.text);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(ok ? "Created" : "User exists")),
    );

    if (ok) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: u, decoration: InputDecoration(labelText: "Username")),
            TextField(controller: p, decoration: InputDecoration(labelText: "Password")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: register, child: Text("Create")),
          ],
        ),
      ),
    );
  }
}

// ================= HOME =================

class Home extends StatelessWidget {
  final String role;
  Home({required this.role});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(role)),
      body: Center(
        child: Text(
          role == "admin" ? "ADMIN PANEL" : "STUDENT PANEL",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
