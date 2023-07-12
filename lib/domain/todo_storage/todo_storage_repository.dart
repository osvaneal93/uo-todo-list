import 'package:todo_note_app/data/models/note_model/note_model.dart';
import 'package:todo_note_app/domain/todo_storage/todo_storage_datasource.dart';

abstract class TodoStorageRepositoryBase {
  void createNote(Note noteAdapter);
  void getNote(String noteId);
  void deleteNote(String noteId);
  void editNote(Note noteAdapter);

  void createCollection(String name);
  void getCollection();
  void deleteCollection(String name);
  void editCollection();
}

class TodoStorageRepository extends TodoStorageRepositoryBase {
  final TodoStorageDataSource todoStorageDataSource;

  TodoStorageRepository({required this.todoStorageDataSource});
  @override
  void createNote(Note noteAdapter) => todoStorageDataSource.createNote(noteAdapter);

  @override
  void deleteNote(String noteId) => todoStorageDataSource.deleteNote(noteId);

  @override
  void editNote(Note noteAdapter) => todoStorageDataSource.editNote(noteAdapter);

  @override
  void getCollection() => todoStorageDataSource.getCollection();

  @override
  Future<Note> getNote(String noteId) => todoStorageDataSource.getNote(noteId);

  @override
  void createCollection(String name) => todoStorageDataSource.createCollection(name);

  @override
  void deleteCollection(String name) => todoStorageDataSource.deleteCollection(name);

  @override
  void editCollection() => todoStorageDataSource.editCollection();
}
