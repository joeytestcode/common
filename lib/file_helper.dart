import 'package:path_provider/path_provider.dart';

class FileHelper {
  static Future<String> get localPath async {
    return (await getApplicationDocumentsDirectory())!.path;
  }

  static Future<String> get downloadPath async {
    return (await getDownloadsDirectory())!.path;
  }

  static Future<String> get externalStoragePath async {
    return (await getExternalStorageDirectory())!.path;
  }
}
