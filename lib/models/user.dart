class AppUser {
  String username;
  String password;
  String bio;
  int score;
  int cup;

  AppUser({
    required this.username,
    required this.password,
    this.bio = "",
    this.score = 0,
    this.cup = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "password": password,
      "bio": bio,
      "score": score,
      "cup": cup,
    };
  }

  static AppUser fromMap(Map data) {
    return AppUser(
      username: data["username"],
      password: data["password"],
      bio: data["bio"] ?? "",
      score: data["score"] ?? 0,
      cup: data["cup"] ?? 0,
    );
  }
}
