import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;
import 'dart:io';

import 'package:image/image.dart';

import "../types/files.dart";

import 'package:denv_drawing_canvas/features/canvas/domain/model/my_image.dart';
import 'package:denv_drawing_canvas/features/canvas/domain/model/my_image_info.dart';

class MyImageConverter {
  const MyImageConverter();

  Future<MyImage?> fromFile(File file) async {
    Uint8List bytes = await file.readAsBytes(); // Read the file as bytes
    // final ByteData buffer = ByteData.sublistView(
    //     bytes.buffer.asByteData()); // Create a ByteData view of the bytes

    Image? image = decodeImage(bytes);

    if (image == null) {
      return null;
    }

    ImageFormat fileFormat = getFileFormat(bytes[0], bytes[1], bytes[2]);

    var bpp = 1; // grayscale

    switch (fileFormat) {
      case ImageFormat.png:
        bpp = 4;
        break;
      case ImageFormat.jpeg:
        bpp = 3;
        break;
      case ImageFormat.gif:
        bpp = 3;
        break;
      default:
        bpp = 1;
        break;
    }

    if (image.data != null) {
      bpp = image.data!.bitsPerChannel * image.data!.numChannels ~/ 8;
    }

    final MyImageInfo imgInfo = MyImageInfo(
      id: file.path,
      path: file.path,
      width: image.width,
      height: image.height,
      type: FileType.local,
      imgFormat: fileFormat,
      bytePerPixel: bpp,
    );

    return MyImage(imgInfo: imgInfo, bytes: bytes);
  }

  ImageFormat getFileFormat(int byte0, int byte1, int byte2) {
    if (byte0 == 0x89 && byte1 == 0x50 && byte2 == 0x4E) {
      return ImageFormat.png;
    } else if (byte0 == 0xFF && byte1 == 0xD8) {
      return ImageFormat.jpeg;
    } else if (byte0 == 0x47 && byte1 == 0x49 && byte2 == 0x46) {
      return ImageFormat.gif;
    } else {
      // You can add more checks for other formats if needed
      return ImageFormat.unknown;
    }
  }

  Future<MyImage?> fromData(String path, Uint8List bytes) async {
    // final ByteData buffer = ByteData.sublistView(
    //     bytes.buffer.asByteData()); // Create a ByteData view of the bytes

    Image? image = decodeImage(bytes);

    if (image == null) {
      return null;
    }

    ImageFormat fileFormat = getFileFormat(bytes[0], bytes[1], bytes[2]);

    var bpp = 1; // grayscale

    switch (fileFormat) {
      case ImageFormat.png:
        bpp = 4;
        break;
      case ImageFormat.jpeg:
        bpp = 3;
        break;
      case ImageFormat.gif:
        bpp = 3;
        break;
      default:
        bpp = 1;
        break;
    }

    if (image.data != null) {
      bpp = image.data!.bitsPerChannel * image.data!.numChannels ~/ 8;
    }

    final MyImageInfo imgInfo = MyImageInfo(
      id: path,
      path: path,
      width: image.width,
      height: image.height,
      type: FileType.local,
      imgFormat: fileFormat,
      bytePerPixel: bpp,
    );

    return MyImage(imgInfo: imgInfo, bytes: bytes);
  }
}
