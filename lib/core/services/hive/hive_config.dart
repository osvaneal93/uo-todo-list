import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:todo_note_app/data/models/note_model/note_model.dart';

class HiveConfig {
  static init() async {
    final dir = await path.getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    await Hive.initFlutter('hive_db');
    await Hive.openBox('notesBox');
    await Hive.openBox('p');
    Hive.registerAdapter(NoteAdapter());
  }
}
