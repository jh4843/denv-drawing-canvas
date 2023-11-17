import 'package:hooks_riverpod/hooks_riverpod.dart';
import "./my_image_converter.dart";

final myImageConverterProvider = Provider<MyImageConverter>(
  (ref) => const MyImageConverter(),
);
