import 'package:freezed_annotation/freezed_annotation.dart';

import 'dart:typed_data';

import './my_image_info.dart';

part 'my_image.freezed.dart';
part 'my_image.g.dart';

class Uint8ListConverter implements JsonConverter<Uint8List, List<int>> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(List<int> json) {
    return Uint8List.fromList(json);
  }

  @override
  List<int> toJson(Uint8List object) {
    return object.toList();
  }
}

@freezed
class MyImage with _$MyImage {
  @JsonSerializable(explicitToJson: true)
  factory MyImage({
    required MyImageInfo imgInfo,
    @Uint8ListConverter() required Uint8List bytes,
    @Default(false) bool loadCompleted,
  }) = _MyImage;

  factory MyImage.fromJson(Map<String, Object> json) => _$MyImageFromJson(json);
}
