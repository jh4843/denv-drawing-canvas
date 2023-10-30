import 'package:hooks_riverpod/hooks_riverpod.dart';

import './images/load_images_impl.dart';
import './images/load_image.dart';

final loadImagesUseCaseProvider = Provider<LoadImageUseCase>(
  (ref) => LoadImageImpl(ref.watch(ImageRepositoryProvider)),
);
