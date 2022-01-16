import 'package:flutter/material.dart';

import '../engine.dart';

class BoxContainerWidget extends StatelessWidget {
  const BoxContainerWidget({Key? key, required this.id, required this.size})
      : super(key: key);
  final int id;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: Engine().getBoxWith(size),
      height: Engine().getBoxHeight(size),
      color: Colors.grey[400],
      child: Center(child: Text('$id')),
    );
  }
}