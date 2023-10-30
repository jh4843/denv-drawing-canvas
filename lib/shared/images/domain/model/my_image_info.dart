import 'package:denv_drawing_canvas/shared/images/types/files.dart';

// class MyImageInfo {
//   final String path;
//   final ImageFileFormat type;
//   //
//   final int width;
//   final int height;
//   final int bytePerPixel;
//   //
//   const MyImageInfo({
//     required this.path,
//     required this.type,
//     //
//     required this.width,
//     required this.height,
//     required this.bytePerPixel,
//   });
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_image_info.freezed.dart';
part 'my_image_info.g.dart';

@freezed
class MyImageInfo with _$MyImageInfo {
  const factory MyImageInfo({
    required String path,
    required ImageFileFormat type,
    required int width,
    required int height,
    required int bytePerPixel,
  }) = _MyImageInfo;

  factory MyImageInfo.fromJson(Map<String, Object?> json) =>
      _$MyImageInfoFromJson(json);
}
