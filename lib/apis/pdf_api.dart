import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> prefs = SharedPreferences.getInstance();

Future<String?> getHost() {
  return prefs.then((SharedPreferences prefs) {
    return prefs.getString('host') ?? "192.168.1.174";
  });
}

Future<int?> getPort() {
  return prefs.then((SharedPreferences prefs) {
    return prefs.getInt('port') ?? 330;
  });
}
class PdfApi {
  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
