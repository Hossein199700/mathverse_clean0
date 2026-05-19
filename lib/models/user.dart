class AppUser {
  String username;
  String password;
  String bio;

  int score;
  int xp;
  int level;
  String league;

  AppUser({
    required this.username,
    required this.password,
    this.bio = "",
    this.score = 0,
    this.xp = 0,
    this.level = 1,
    this.league = "Bronze",
  });

  Map<String, dynamic> toMap() => {
    "username": username,
    "password": password,
    "bio": bio,
    "score": score,
    "xp": xp,
    "level": level,
    "league": league,
  };

  static AppUser fromMap(Map m) => AppUser(
    username: m["username"],
    password: m["password"],
    bio: m["bio"] ?? "",
    score: m["score"] ?? 0,
    xp: m["xp"] ?? 0,
    level: m["level"] ?? 1,
    league: m["league"] ?? "Bronze",
  );
}
