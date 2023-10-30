import "../../domain/repository/image_repository.dart";
import "../../domain/model/my_image.dart";
import "../../types/files.dart";
import "../../utils/my_image_converter.dart";

import "dart:io";

class ImageRepositoryImpl implements ImageRepository {
  ImageRepositoryImpl(this.images);
  
  final 
  final String path = '';

  @override
  Future<MyImage?> loadImage(FileTypes type, String path) async {
    switch (type) {
      case FileTypes.local:
        File file = File(path);


        return await files.read(path);
      case FileTypes.network:
        return await files.read(path);
      default:
        return null;
    }
  }
}
