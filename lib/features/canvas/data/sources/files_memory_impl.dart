import 'files.dart';
import 'dart:io';
import 'dart:typed_data';

class FilesMemoryImpl extends Files {
  final Map<String, File> _files = {};

  @override
  File get(String path) {
    return _files[path]!;
  }

  @override
  void add(File file) async {
    _files[file.path] = file;
  }

  @override
  void delete(String path) async {
    _files.remove(path);
  }

  @override
  Future<Uint8List?> read(String path) async {
    return _files[path]?.readAsBytes();
  }
}
