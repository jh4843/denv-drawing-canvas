import 'package:freezed_annotation/freezed_annotation.dart';

import 'my_image.dart';

part 'my_images.freezed.dart';
part 'my_images.g.dart';

@freezed
class MyImages with _$MyImages {
  const factory MyImages({
    @Default([]) List<MyImage> values,
  }) = _MyImages;

  const MyImages._();

  List<MyImage> get loadedList {
    return values.where((myImage) => myImage.loadCompleted).toList();
  }

  List<MyImage> get loadingList {
    return values.where((myImage) => !myImage.loadCompleted).toList();
  }

  factory MyImages.fromJson(Map<String, Object?> json) =>
      _$MyImagesFromJson(json);
}
