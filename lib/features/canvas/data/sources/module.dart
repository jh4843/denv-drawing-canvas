import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'files.dart';
import 'files_memory_impl.dart';

final filesProvider = Provider<Files>((ref) {
  return FilesMemoryImpl();
});
