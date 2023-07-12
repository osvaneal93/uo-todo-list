class StorageException implements Exception {
  final String message;
  final int code;

  StorageException({required this.message, required this.code});
}

class LoadDataException implements Exception {
  final String message;
  final int code;

  LoadDataException({required this.message, required this.code});
}
