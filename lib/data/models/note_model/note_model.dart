import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';

part 'note_model.g.dart';

@HiveType(typeId: 1)
class Note extends HiveObject {
  @HiveField(1)
  late String id;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String body;
  @HiveField(4)
  final DateTime datetime;
  @HiveField(5)
  final Category category;
  @HiveField(6)
  final Priority priority;
  @HiveField(7)
  final NoteStatus noteStatus;

  Note(
      {required this.id,
      required this.title,
      required this.body,
      required this.datetime,
      required this.category,
      required this.priority,
      required this.noteStatus}) {
    id = _generateUniqueId();
  }

  String _generateUniqueId() {
    var uuid = const Uuid();
    var newId = uuid.v4();
    var box = Hive.box('notes');

    // Verificar si el ID ya existe en la base de datos
    var existingNote = box.values.firstWhere(
      (note) => (note as Note).id == newId,
      orElse: () => null,
    );

    // Generar un nuevo ID si el actual ya existe
    if (existingNote != null) {
      return _generateUniqueId();
    }

    return newId;
  }

  // Note copyWith({
  //   int? id,
  //   String? title,
  //   String? body,
  //   DateTime? datetime,
  //   Category? category,
  //   Priority? priority,
  //   NoteStatus? noteStatus,
  // }) =>
  //     Note(
  //         id: id ?? this.id,
  //         title: title ?? this.title,
  //         body: body ?? this.body,
  //         datetime: datetime ?? this.datetime,
  //         category: category ?? this.category,
  //         priority: priority ?? this.priority,
  //         noteStatus: noteStatus ?? this.noteStatus);
}

enum Category {
  work,
  school,
  anywhere;
}

enum Priority {
  low,
  medium,
  high;
}

enum NoteStatus {
  completed,
  inCourse,
}
