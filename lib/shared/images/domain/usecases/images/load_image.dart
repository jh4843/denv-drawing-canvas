import 'package:denv_drawing_canvas/shared/images/types/files.dart';
import '../../model/my_image.dart';

abstract class LoadImageUseCase {
  Future<MyImage?> execute(FileTypes type, String path);
}
