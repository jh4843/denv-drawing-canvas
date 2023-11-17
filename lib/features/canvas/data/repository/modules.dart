import 'package:denv_drawing_canvas/shared/images/utils/modules.dart';

import 'package:denv_drawing_canvas/features/canvas/domain/repository/image_repository.dart';
import "./images/image_repository_impl.dart";
import "../sources/module.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';

final imageRepositoryProvider = Provider<ImageRepository>((ref) {
  return ImageRepositoryImpl(
      files: ref.read(filesProvider),
      myImageConverter: ref.read(myImageConverterProvider));
});
