import '../models/user.dart';
import 'storage.dart';

class AuthService {
  static List<AppUser> users = [];

  static void load() {
    List data = StorageService.getUsers();
    users = data.map((e) => AppUser.fromMap(e)).toList();
  }

  static bool register(String u, String p) {
    for (var x in users) {
      if (x.username == u) return false;
    }

    users.add(AppUser(username: u, password: p));
    save();
    return true;
  }

  static AppUser? login(String u, String p) {
    for (var x in users) {
      if (x.username == u && x.password == p) {
        return x;
      }
    }
    return null;
  }

  static void updateUser(AppUser user) {
    int i = users.indexWhere((x) => x.username == user.username);
    if (i != -1) {
      users[i] = user;
      save();
    }
  }

  static void save() {
    StorageService.saveUsers(users.map((e) => e.toMap()).toList());
  }
}
