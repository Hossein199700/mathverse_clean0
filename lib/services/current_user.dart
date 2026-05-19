import '../models/user.dart';

class CurrentUser {
  static AppUser? user;

  static void setUser(AppUser u) {
    user = u;
  }

  static void logout() {
    user = null;
  }
}
