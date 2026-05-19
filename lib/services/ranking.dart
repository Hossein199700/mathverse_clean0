class RankingService {
  static List<Map<String, dynamic>> users = [];

  static void addUser(String name, int score) {
    users.add({"name": name, "score": score});

    users.sort((a, b) => b["score"].compareTo(a["score"]));
  }
}
