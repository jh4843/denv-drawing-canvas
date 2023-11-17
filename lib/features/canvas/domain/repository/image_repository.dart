import '../model/my_images.dart';
import '../model/my_image_info.dart';

abstract class ImageRepository {
  void loadLocalFiles(List<String> pathList);
  Future<MyImages> getMyImages(List<String> pathList);
  Future<MyImageInfo?> loadOnlyImageInfo(MyImageInfo imgInfo);
}
