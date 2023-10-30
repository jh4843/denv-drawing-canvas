import "./load_image.dart";
import 'package:denv_drawing_canvas/shared/images/types/files.dart';

import "../../model/my_image.dart";
import '../../repository/image_repository.dart';

class LoadImageImpl implements LoadImageUseCase {
  LoadImageImpl(this.imageRepository);
  final ImageRepository imageRepository;

  @override
  Future<MyImage?> execute(FileTypes type, String path) async {
    return await imageRepository.loadImage(type, path);
  }
}
