import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:denv_drawing_canvas/features/canvas/data/repository/modules.dart';

import 'images/load_images.dart';

final getMyImagesUseCaseProvider = Provider<LoadLocalImagesUseCase>(
  (ref) => LoadLocalImagesUseCase(ref.watch(imageRepositoryProvider)),
);
