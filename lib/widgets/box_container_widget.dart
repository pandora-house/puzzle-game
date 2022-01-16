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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.grey,
      ),
      child: Center(child: Text('$id')),
    );
  }
}