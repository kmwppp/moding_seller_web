import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_keys.dart';

class StorageService {
  static SharedPreferences? _prefs;

  // 앱 시작 시 main.dart에서 초기화해주는 것이 좋습니다.
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // 최근 검색어 저장
  static Future<void> saveSearchHistory(List<String> history) async {
    await _prefs?.setStringList(AppKeys.searchHistoryKey, history);
  }

  // 최근 검색어 불러오기
  static List<String> getSearchHistory() {
    return _prefs?.getStringList(AppKeys.searchHistoryKey) ?? [];
  }

  // 모든 히스토리 삭제
  static Future<void> clearHistory() async {
    await _prefs?.remove(AppKeys.searchHistoryKey);
  }
}
