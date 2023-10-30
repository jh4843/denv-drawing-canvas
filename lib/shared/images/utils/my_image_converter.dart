import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;
import 'dart:io';

import './model/my_image.dart';
import './model/my_image_info.dart';

class MyImageConverter{
  const MyImageConverter();

  MyImage fromFile(File file) {
    final Uint8List bytes = file.readAsBytesSync();
    final ui.Image image = ui.decodeImage(bytes)!;
    final MyImageInfo imgInfo = MyImageInfo(
      width: image.width,
      height: image.height,
      type: image.format == ui.ImageFormat.png
          ? ImageFileFormat.png
          : ImageFileFormat.jpeg,
      bytePerPixel: image.getBytesPerPixel(),
      path: file.path,
    );

    return MyImage(imgInfo: imgInfo, bytes: bytes);

  }
}