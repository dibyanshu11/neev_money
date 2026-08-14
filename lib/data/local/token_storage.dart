import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  TokenStorage._();
  static final TokenStorage _instance = TokenStorage._();
  factory TokenStorage() => _instance;

  static const _tokenKey = 'auth_token';
  static const _userNameKey = 'user_name';
  static const _selectedGoalKey = 'selected_goal';

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userNameKey, name);
  }

  Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userNameKey);
  }

  Future<void> saveGoal(String goal) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_selectedGoalKey, goal);
  }

  Future<String?> getGoal() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_selectedGoalKey);
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
