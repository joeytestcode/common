import 'package:common/j_settingsManager.dart';

void main() {
  final settingsManager = JSettingsManager();
  settingsManager.init().then((_) {
    settingsManager.writeSetting('testKey', 'testValue').then((_) {
      print('Setting written successfully!');
    }).catchError((error) {
      print('Error writing setting: $error');
    });
  }).catchError((error) {
    print('Error initializing settings manager: $error');
  });
}
