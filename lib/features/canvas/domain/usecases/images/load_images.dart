import 'package:denv_drawing_canvas/shared/images/types/files.dart';

import '../../model/my_images.dart';
import '../../repository/image_repository.dart';

class LoadLocalImagesUseCase {
  LoadLocalImagesUseCase(this.imageRepository);
  final ImageRepository imageRepository;

  Future<MyImages> execute(List<String> pathList) async {
    await imageRepository.loadLocalFiles(pathList);
    return await imageRepository.getMyImages(pathList);
  }
}
