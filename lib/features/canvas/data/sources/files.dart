import 'dart:typed_data';
import 'dart:io';

abstract class Files {
  File get(String path);

  void add(File file);

  Future<Uint8List?> read(String path);

  void delete(String path);
}
