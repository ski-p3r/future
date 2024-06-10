import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('key', 'value');
}

Future<void> readData() async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.getString('key') ?? 'default_value';
  print(value);
}

Future<void> modifyData(String key, String newValue) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, newValue);
}

Future<void> deleteData(String key) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(key);
}

Future<void> clearAllData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
