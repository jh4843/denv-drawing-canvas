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

  List<MyImage> get myImages => values;
  MyImage? getImagesById(String id) {
    return values.firstWhere((e) => e.imgInfo.id == id);
  }

  MyImage? getImagesByPath(String path) {
    return values.firstWhere((e) => e.imgInfo.path == path);
  }

  MyImages add(MyImage myImage) {
    return MyImages(values: [...values, myImage]);
  }

  void clear() {
    values.clear();
  }

  MyImages remove(MyImage myImage) {
    return MyImages(values: values.where((e) => e != myImage).toList());
  }

  MyImages update(MyImage myImage) {
    return MyImages(
      values: values.map((e) => e == myImage ? myImage : e).toList(),
    );
  }

  MyImages updateAll(List<MyImage> myImages) {
    return MyImages(values: myImages);
  }

  factory MyImages.fromJson(Map<String, Object?> json) =>
      _$MyImagesFromJson(json);
}
