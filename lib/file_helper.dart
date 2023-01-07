import 'package:path_provider/path_provider.dart';

class FileHelper {
  static Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<String> get downloadPath async {
    final directory = await getDownloadsDirectory();
    return directory.path;
  }
}
