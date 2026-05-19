import '../models/user.dart';
import 'storage.dart';

class AuthService {
  static List<AppUser> users = [];

  static void loadUsers() {
    List data = StorageService.getUsers();
    users = data.map((e) => AppUser.fromMap(e)).toList();
  }

  static bool register(String u, String p) {
    for (var user in users) {
      if (user.username == u) return false;
    }

    users.add(AppUser(username: u, password: p));
    save();
    return true;
  }

  static AppUser? login(String u, String p) {
    for (var user in users) {
      if (user.username == u && user.password == p) {
        return user;
      }
    }
    return null;
  }

  static void save() {
    StorageService.saveUsers(
      users.map((e) => e.toMap()).toList(),
    );
  }
}
