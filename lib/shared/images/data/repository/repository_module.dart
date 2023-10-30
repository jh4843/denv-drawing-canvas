import '../../domain/repository/image_repository.dart';

final ImageRepositoryProvider = Provider.autoDispose<ImageRepository>((ref) {
  return ImageRepositoryImpl([]);
});