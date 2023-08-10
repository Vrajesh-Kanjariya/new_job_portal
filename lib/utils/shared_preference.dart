import 'package:shared_preferences/shared_preferences.dart';

const String toolTipsKEY = 'toolTipsKEY';
const String isUserLoginKey = 'isUserLogin';
const String fcmTokenKey = 'fcmToken';
const String registerIdKey = 'registerId';
const String accessTokenKey = 'accessToken';
const String deviceIdKey = 'deviceId';
const String deviceNameKey = 'deviceName';
const String macAddressKey = 'macAddress';
const String imeiNumberKey = 'imeiNumber';
const String memberIdKey = 'memberId';
const String languageKey = 'language';
const String profileStatusKey = 'profileStatus';
const String addMemberStatusKey = 'addMemberStatus';
const String userSelectedStatusKey = 'userSelectedStatus';
const String mobileNoKey = 'mobileNo';
const String textColorsKey = 'textColors';
const String textSizesKey = 'textSizes';
const String lineSaveHeightKey = 'lineSaveHeight';
const String namavaliTextColorsKey = 'namavaliTextColors';
const String namavaliTextSizesKey = 'namavaliTextSizes';
const String namavaliLineSaveHeightKey = 'namavaliLineSaveHeight';
const String mantrajapCountKey = 'mantraJapCount';

Future<bool> checkPrefKey(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.containsKey(key);
}

Future<String?>? getPrefStringValue(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

setPrefStringValue(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

Future<bool> getPrefBoolValue(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key) ?? false;
}

setPrefBoolValue(String key, bool value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}

Future<int?>? getPrefIntValue(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt(key);
}

setPrefIntValue(String key, int value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

Future<double?>? getPrefDoubleValue(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getDouble(key);
}

setPrefDoubleValue(String key, double value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setDouble(key, value);
}

Future<List<String>?>? getPrefListValue(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList(key);
}

setPrefListValue(String key, List<String> value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList(key, value);
}

Future<Set<String>> getPrefKeys() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getKeys();
}

removePrefValue(String key) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}

removePref() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
