import 'package:denv_drawing_canvas/features/canvas/domain/repository/image_repository.dart';
import 'package:denv_drawing_canvas/features/canvas/domain/model/my_image.dart';
import 'package:denv_drawing_canvas/features/canvas/domain/model/my_image_info.dart';
import '../../../../../shared/images/types/files.dart';
import '../../../../../shared/images/utils/my_image_converter.dart';

import '../../../domain/model/my_images.dart';
import "../../sources/files.dart";

import "dart:io";
import "dart:typed_data";

class ImageRepositoryImpl implements ImageRepository {
  ImageRepositoryImpl({required this.files, this.myImageConverter});

  final Files files;
  final MyImageConverter? myImageConverter;

  final String path = '';

  @override
  void loadLocalFiles(List<String> pathList) {
    for (String path in pathList) {
      File file = File(path);
      files.add(file);
    }

    return;
  }

  @override
  Future<MyImageInfo?> loadOnlyImageInfo(MyImageInfo imgInfo) async {
    return null;
  }

  @override
  Future<MyImages> getMyImages(List<String> pathList) async {
    MyImages myImages = const MyImages();

    for (String path in pathList) {
      Uint8List? contents = await files.read(path);

      if (contents != null) {
        MyImage? myImage = await myImageConverter!.fromData(path, contents);

        if (myImage == null) {
          continue;
        }

        myImage = myImage.copyWith(
          imgInfo: myImage.imgInfo.copyWith(
            type: FileType.local,
          ),
        );

        myImages.add(myImage);
      }
    }

    return myImages;
  }
}
