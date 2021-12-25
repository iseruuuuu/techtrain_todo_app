import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageService {
  static late final SharedPreferences instance;

  static Future<void> init() async {
    instance = await SharedPreferences.getInstance();
  }
}

class TodoStorage {
  final String _key = 'todo';

  List<String>? load() {
    return StorageService.instance.getStringList(_key);
  }

  void save(List<String> data) {
    StorageService.instance.setStringList(_key, data);
  }
}
