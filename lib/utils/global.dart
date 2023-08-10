import 'dart:io';

class Global {
  static String getAccessStatus() {
    if (Platform.isAndroid) {
      return '1';
    }
    return '2';
  }
}