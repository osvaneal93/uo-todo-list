import 'package:todo_note_app/data/models/note_model/note_model.dart';

abstract class TodoStorageDataSource {
  void createNote(Note noteAdapter);
  Future<Note> getNote(String noteId);
  void deleteNote(String noteId);
  void editNote(Note noteAdapter);

  void getCollection();
  void createCollection(String name);
  void deleteCollection(String name);
  void editCollection();
}
