import 'dart:ui';

import 'package:flutter/material.dart' hide Image;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:denv_drawing_canvas/features/canvas/presentation/widgets/drawing_canvas.dart';

import '../provider/modules.dart';
import '../widgets/tools_list.dart';

class DrawingPage extends HookConsumerWidget {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadedImageList = useState<List<Image>>([]);
    final toolbarHeight = useState(80);
    final isShowToolsSideBar = useState(false);

    final myImages = ref.watch(myImagesListState);
    final myImagesModel = ref.watch(myImagesListModel);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            isShowToolsSideBar.value = !isShowToolsSideBar.value;
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save_outlined),
          ),
          IconButton(
              onPressed: () {
                isShowToolsSideBar.value = !isShowToolsSideBar.value;

                if (isShowToolsSideBar.value) {
                  toolbarHeight.value = 80;
                } else {
                  toolbarHeight.value = 0;
                }
              },
              icon: const Icon(Icons.remove_red_eye_outlined)),
        ],
        title: const Text("Painter"),
      ),
      body: Column(
        children: <Widget>[
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: MediaQuery.of(context).size.width,
            height: toolbarHeight.value.toDouble(),
            child: ToolsList(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Flexible(
            //color: Colors.white,
            fit: FlexFit.loose,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.red,
              child: DrawingCanvas(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  loadedImages: loadedImageList),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pickImageApp(myImagesModel);
          //
          print("myImagesModel: ${myImagesModel.state.values.length}");
          print("myImages: ${myImages.values}");
        },
        child: const Icon(Icons.image_outlined),
      ),
    );
  }

  void _pickImageApp(MyImagesStateNotifier imgStateNotifier) async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      List<String> pathList = [pickedFile.path];
      await imgStateNotifier.loadMyImages(pathList);
    }

    return null;
  }
}
