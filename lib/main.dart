import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'engine.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => Engine(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        AnimatedBox(
          id: 1,
          size: size,
        ),
        AnimatedBox(
          id: 2,
          size: size,
        ),
        AnimatedBox(
          id: 3,
          size: size,
        ),
        AnimatedBox(
          id: 4,
          size: size,
        ),
        AnimatedBox(
          id: 5,
          size: size,
        ),
        AnimatedBox(
          id: 6,
          size: size,
        ),
        AnimatedBox(
          id: 7,
          size: size,
        ),
        AnimatedBox(
          id: 8,
          size: size,
        ),
        AnimatedBox(
          id: 9,
          size: size,
        ),
        AnimatedBox(
          id: 10,
          size: size,
        ),
        AnimatedBox(
          id: 11,
          size: size,
        ),
        AnimatedBox(
          id: 12,
          size: size,
        ),
        AnimatedBox(
          id: 13,
          size: size,
        ),
        AnimatedBox(
          id: 14,
          size: size,
        ),
        AnimatedBox(
          id: 15,
          size: size,
        ),
      ],
    ));
  }
}

class AnimatedBox extends StatefulWidget {
  const AnimatedBox({Key? key, required this.id, required this.size})
      : super(key: key);
  final int id;
  final Size size;

  @override
  State<AnimatedBox> createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox> {
  double positionX = 0;
  double positionY = 0;
  double boxHeight = 0;
  double boxWith = 0;
  int incrementY = 0;
  int incrementX = 0;
  PositionGap? _gap;

  @override
  void initState() {
    super.initState();
    final position = Engine().initPosition(widget.id, widget.size);
    positionX = position.x;
    positionY = position.y;
    boxHeight = Engine().getBoxHeight(widget.size);
    boxWith = Engine().getBoxWith(widget.size);
  }

  @override
  Widget build(BuildContext context) {
    final matrix =
        context.select<Engine, List<List<int>>>((value) => value.idMatrix);
    _gap = Engine().getGapPosition(widget.id, matrix);
    return AnimatedPositioned(
      duration: const Duration(seconds: 1),
      top: positionY + boxHeight * incrementY,
      left: positionX + boxWith * incrementX,
      child: GestureDetector(
        child: BoxContainer(
          id: widget.id,
          size: widget.size,
        ),
        onTap: _gap == null
            ? null
            : () {
                if (_gap == PositionGap.top) {
                  setState(() {
                    incrementY--;
                  });
                } else if (_gap == PositionGap.bottom) {
                  // context
                  //     .read<Engine>()
                  //     .updateMatrix(widget.id, MoveBox.bottom);
                  setState(() {
                    incrementY++;
                  });
                } else if (_gap == PositionGap.right) {
                  setState(() {
                    incrementX++;
                  });
                } else if (_gap == PositionGap.left) {
                  setState(() {
                    incrementX--;
                  });
                }
              },
      ),
    );
  }
}

class BoxContainer extends StatelessWidget {
  const BoxContainer({Key? key, required this.id, required this.size})
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
