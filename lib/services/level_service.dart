import '../models/user.dart';

class LevelService {
  static void addXP(AppUser user, int value) {
    user.xp += value;
    user.score += value;

    if (user.xp >= 100) {
      user.level++;
      user.xp = 0;
    }

    if (user.score > 1500) {
      user.league = "Gold";
    } else if (user.score > 500) {
      user.league = "Silver";
    } else {
      user.league = "Bronze";
    }
  }
}
