import '../model/my_image.dart';
import '../model/my_image_info.dart';

import 'package:denv_drawing_canvas/shared/images/types/files.dart';

abstract class ImageRepository {
  Future<MyImage> loadImage(FileTypes type, String path);
  Future<MyImageInfo> loadOnlyImageInfo(MyImageInfo todo);
}
