import 'package:shared_preferences/shared_preferences.dart';

const String ACCESS_TOKEN = 'accessToken';
const String REFRESH_TOKEN = 'refreshToken';
const String CATEGORIES = 'categories';

class AppPref {
  static final AppPref _instance = AppPref._internal();
  static SharedPreferences? _prefs;

  factory AppPref() {
    return _instance;
  }

  AppPref._internal();

  Future init() async => _prefs = await SharedPreferences.getInstance();

  Future<bool>? setAccessToken(String token) async {
    return await _prefs!.setString(ACCESS_TOKEN, token);
  }

  String? getAccessToken() => _prefs!.getString(ACCESS_TOKEN);

  Future<bool>? setRefreshToken(String token) async {
    return await _prefs!.setString(REFRESH_TOKEN, token);
  }

  String? getRefreshToken() => _prefs!.getString(REFRESH_TOKEN);

  Future<bool> setCategories(List<String> categories) async {
    return await _prefs!.setStringList(CATEGORIES, categories);
  }
}
