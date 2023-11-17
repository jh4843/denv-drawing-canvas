import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ToolsList extends HookWidget {
  const ToolsList({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.blueAccent,
    );
  }
}
