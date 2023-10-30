import 'dart:ui';

import 'package:flutter/material.dart' hide Image;
import 'package:flutter_hooks/flutter_hooks.dart';

class DrawingPage extends HookWidget {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isShowToolsSideBar = useState(false);
    final loadedImageList = useState<List<Image>>([]);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => isShowToolsSideBar.value = !isShowToolsSideBar.value,
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save_outlined),
          ),
        ],
        title: const Text("Painter"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: const Center(
              child: Text("Drawing Page"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.image_outlined),
      ),
    );
  }
}
