import 'package:flutter/material.dart';

import '../engine.dart';

class BoxContainerWidget extends StatelessWidget {
  const BoxContainerWidget({Key? key, required this.id, required this.size})
      : super(key: key);
  final int id;
  final Size size;

  @override
  Widget build(BuildContext context) {
    const padding = 0.5;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        width: Engine().getBoxWith(size) - 2 * padding,
        height: Engine().getBoxHeight(size) - 2 * padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.grey,
        ),
        child: Center(child: Text('$id')),
      ),
    );
  }
}
