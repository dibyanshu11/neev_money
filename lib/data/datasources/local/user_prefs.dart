import 'package:shared_preferences/shared_preferences.dart';

/// Persisted profile + security preferences.
class UserPrefs {
  UserPrefs._();
  static final UserPrefs instance = UserPrefs._();

  static const _name = 'neev_profile_name';
  static const _email = 'neev_profile_email';
  static const _phone = 'neev_profile_phone';
  static const _biometric = 'neev_biometric_enabled';
  static const _emailVerified = 'neev_email_verified';

  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  Future<String> getName() async => (await _prefs).getString(_name) ?? '';

  Future<String> getEmail() async => (await _prefs).getString(_email) ?? '';

  Future<String> getPhone() async => (await _prefs).getString(_phone) ?? '';

  Future<bool> getBiometricEnabled() async =>
      (await _prefs).getBool(_biometric) ?? false;

  Future<bool> isEmailVerified() async =>
      (await _prefs).getBool(_emailVerified) ?? false;

  Future<void> saveProfile({
    required String name,
    required String email,
    required String phone,
  }) async {
    final p = await _prefs;
    await p.setString(_name, name.trim());
    await p.setString(_email, email.trim());
    await p.setString(_phone, phone.trim());
  }

  Future<void> saveAuthIdentity({
    required String name,
    required String phone,
  }) async {
    final p = await _prefs;
    await p.setString(_name, name.trim());
    await p.setString(_phone, phone.trim());
  }

  Future<void> setEmail(String email, {bool verified = false}) async {
    final p = await _prefs;
    await p.setString(_email, email.trim());
    await p.setBool(_emailVerified, verified);
  }

  Future<void> setEmailVerified(bool value) async {
    await (await _prefs).setBool(_emailVerified, value);
  }

  Future<void> setBiometricEnabled(bool value) async {
    await (await _prefs).setBool(_biometric, value);
  }

  /// Clears signed-in profile data (delete account / hard logout).
  Future<void> clearProfile() async {
    final p = await _prefs;
    await p.remove(_name);
    await p.remove(_email);
    await p.remove(_phone);
    await p.remove(_biometric);
    await p.remove(_emailVerified);
  }
}
