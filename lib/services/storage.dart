import 'package:hive/hive.dart';

class StorageService {
  static late Box box;

  static Future init() async {
    box = await Hive.openBox("usersBox");
  }

  static List getUsers() {
    return box.get("users", defaultValue: []);
  }

  static void saveUsers(List users) {
    box.put("users", users);
  }
}
