import 'package:denv_drawing_canvas/shared/images/types/files.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_image_info.freezed.dart';
part 'my_image_info.g.dart';

@freezed
class MyImageInfo with _$MyImageInfo {
  const factory MyImageInfo({
    required String id,
    required String path,
    required FileType type,
    required ImageFormat imgFormat,
    required int width,
    required int height,
    required int bytePerPixel,
  }) = _MyImageInfo;

  factory MyImageInfo.fromJson(Map<String, Object?> json) =>
      _$MyImageInfoFromJson(json);
}
