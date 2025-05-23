import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class JSettingsManager {
  static const String _key = 'SettingsJson';
  static final JSettingsManager _instance =
      JSettingsManager._privateConstructor();
  late final SharedPreferences _prefs;
  late final Map<String, dynamic> _settings;

  factory JSettingsManager() {
    return _instance;
  }

  JSettingsManager._privateConstructor() {
    init();
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _settings = _readSettings();
  }

  Future<dynamic> readSetting(String key) async {
    return _settings[key];
  }

  Future<Map<String, dynamic>> readAllSettings() async {
    return _settings;
  }

  Future<void> writeSetting(String key, dynamic value) async {
    _settings[key] = value;
    await _prefs.setString(_key, jsonEncode(_settings));
  }

  Future<void> writeAllSettings(Map<String, dynamic> settings) async {
    _settings.clear();
    _settings.addAll(settings);
    await _prefs.setString(_key, jsonEncode(_settings));
  }

  Map<String, dynamic> _readSettings() {
    final String? jsonString = _prefs.getString(_key);
    if (jsonString != null) {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } else {
      return {};
    }
  }
}
