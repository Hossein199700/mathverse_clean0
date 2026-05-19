class AppUser {
  String username;
  String password;
  int score;

  AppUser({
    required this.username,
    required this.password,
    this.score = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "password": password,
      "score": score,
    };
  }

  static AppUser fromMap(Map data) {
    return AppUser(
      username: data["username"],
      password: data["password"],
      score: data["score"] ?? 0,
    );
  }
}
