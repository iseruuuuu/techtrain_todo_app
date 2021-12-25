import 'package:enum_to_string/enum_to_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PreferenceKey {
  memo,
}

class Preference {
  final preference = SharedPreferences.getInstance();

  Future<List<String>> load(PreferenceKey key) async {
    final pref = await preference;
    final value = pref.getStringList(EnumToString.convertToString(key)) ?? [];
    return value;
  }

  Future<void> save(PreferenceKey key, List<String> value) async {
    final pref = await preference;
    await pref.setStringList(EnumToString.convertToString(key), value);
  }
}
