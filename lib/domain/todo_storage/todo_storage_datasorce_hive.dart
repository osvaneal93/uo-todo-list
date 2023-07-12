import 'package:hive_flutter/adapters.dart';
import 'package:todo_note_app/core/errors/storage/storage_errors.dart';
import 'package:todo_note_app/data/models/note_model/note_model.dart';
import 'package:todo_note_app/domain/todo_storage/todo_storage_datasource.dart';

class TodoStorageHiveImplement extends TodoStorageDataSource {
  @override
  void createNote(Note noteAdapter) async {
    try {
      final box = Hive.box('notesBox');
      box.put(noteAdapter.id, noteAdapter);
    } catch (_) {
      throw StorageException(message: "The note isn't created, please try again.", code: 01);
    }
  }

  @override
  void deleteNote(String noteId) {
    try {
      final box = Hive.box('notesBox');
      box.delete(noteId);
    } catch (_) {
      throw StorageException(message: "The note isn't deleted, please try again.", code: 01);
    }
  }

  @override
  void editNote(Note noteAdapter) {
    try {
      final box = Hive.box('notesBox');
      box.put(noteAdapter.id, noteAdapter);
    } catch (_) {
      throw StorageException(message: "The note isn't created, please try again.", code: 01);
    }
  }

  @override
  Future<Note> getNote(String noteId) async {
    try {
      final box = Hive.box('notesBox');
      final note = await box.get(noteId) as Note;
      return note;
    } catch (_) {
      throw StorageException(message: "The note isn't created, please try again.", code: 01);
    }
  }

//----------

  @override
  Future<void> createCollection(String name) async {
    final boxExist = await Hive.boxExists(name);
    if (boxExist) {
      try {
        await Hive.openBox(name);
      } catch (_) {
        throw StorageException(message: 'Something went wrong, please try again.', code: 01);
      }
    } else {
      throw StorageException(message: 'Collection already exist, please try other name.', code: 01);
    }
  }

  @override
  void deleteCollection(String name) async {
    final boxExist = await Hive.boxExists(name);
    if (boxExist) {
      try {
        await Hive.deleteBoxFromDisk(name);
      } catch (_) {
        throw StorageException(message: 'Something went wrong, please try again.', code: 01);
      }
    } else {
      throw StorageException(message: 'Something went wrong, please try again.', code: 01);
    }
  }

  @override
  void editCollection() {}

  @override
  void getCollection() {}
}
