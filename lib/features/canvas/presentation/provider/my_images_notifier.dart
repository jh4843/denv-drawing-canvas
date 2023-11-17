import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:denv_drawing_canvas/features/canvas/domain/model/my_image.dart';
import 'package:denv_drawing_canvas/features/canvas/domain/model/my_images.dart';
import 'package:denv_drawing_canvas/features/canvas/domain/usecases/modules.dart';

class MyImagesStateNotifier extends StateNotifier<MyImages> {
  MyImagesStateNotifier(this.ref) : super(const MyImages(values: [])) {}

  final Ref ref;
  late final getMyImages = ref.read(getMyImagesUseCaseProvider);

  Future<void> loadMyImages(List<String> filePathList) async {
    state = await getMyImages.execute(filePathList);
  }

  Future<MyImage?> getById(String id) async {
    return state.getImagesById(id);
  }

  Future<MyImage?> getByPath(String path) async {
    return state.getImagesById(path);
  }

  void clear() async {
    state.clear();
  }
}

final myImagesListState =
    StateNotifierProvider<MyImagesStateNotifier, MyImages>(
  (ref) => MyImagesStateNotifier(ref),
);

final myImagesListModel = Provider<MyImagesStateNotifier>((ref) {
  return ref.watch(myImagesListState.notifier);
});
