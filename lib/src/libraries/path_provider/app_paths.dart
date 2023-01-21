import 'dart:io';

import 'package:path_provider/path_provider.dart';

class AppPaths {
  Future<Directory> get applicationSupportDirectory =>
      getApplicationDocumentsDirectory();
}
