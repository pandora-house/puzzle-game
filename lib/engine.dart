import 'package:flutter/cupertino.dart';

enum PositionZero { top, bottom, left, right }
enum MoveBox { top, bottom, left, right }

class Engine extends ChangeNotifier {
  final _idMatrix = [
    [1, 2, 3, 4],
    [5, 6, 0, 7],
    [8, 9, 10, 11],
    [12, 13, 14, 15],
  ];

  List<List<int>> get idMatrix => _idMatrix;

  PositionBox initPosition(var id, var size) {
    int counterY = 0;
    int counterX = 0;
    bool endSearch = false;

    for (final y in _idMatrix) {
      counterX = 0;
      for (final x in y) {
        if (x == id) {
          endSearch = true;
          break;
        }
        counterX++;
      }
      if (endSearch) break;
      counterY++;
    }

    return PositionBox(
        x: getBoxWith(size) * counterX, y: getBoxHeight(size) * counterY);
  }

  AxisAlign? getAxis(var id, var matrix) {
    int xIdIndex = 0;
    int yIdIndex = 0;
    for (final row in matrix) {
      for (final elem in row) {
        if (elem == id) {
          xIdIndex = row.indexOf(elem);
          yIdIndex = matrix.indexOf(row);
        }
      }
    }
    int? topIndex = yIdIndex - 1;
    if (yIdIndex == 0) topIndex = null;
    int? bottomIndex = yIdIndex + 1;
    if (yIdIndex == matrix.length - 1) bottomIndex = null;
    int? rightIndex = xIdIndex + 1;
    if (xIdIndex == matrix[0].length - 1) rightIndex = null;
    int? leftIndex = xIdIndex - 1;
    if (xIdIndex == 0) leftIndex = null;

    if (topIndex != null) {
      if (matrix[topIndex][xIdIndex] == 0) {
        return AxisAlign(align: Axis.vertical, zero: PositionZero.top);
      }
    }

    if (bottomIndex != null) {
      if (matrix[bottomIndex][xIdIndex] == 0) {
        return AxisAlign(align: Axis.vertical, zero: PositionZero.bottom);
      }
    }

    if (rightIndex != null) {
      if (matrix[yIdIndex][rightIndex] == 0) {
        return AxisAlign(align: Axis.horizontal, zero: PositionZero.right);
      }
    }

    if (leftIndex != null) {
      if (matrix[yIdIndex][leftIndex] == 0) {
        return AxisAlign(align: Axis.horizontal, zero: PositionZero.left);
      }
    }
  }

  void updateMatrix(var id, var move) {
    int xIdIndex = 0;
    int yIdIndex = 0;
    for (final row in _idMatrix) {
      for (final elem in row) {
        if (elem == id) {
          xIdIndex = row.indexOf(elem);
          yIdIndex = _idMatrix.indexOf(row);
        }
      }
    }
    if (move == MoveBox.bottom && yIdIndex != _idMatrix.length - 1) {
      final elementId = _idMatrix[yIdIndex][xIdIndex];
      _idMatrix[yIdIndex][xIdIndex] = 0;
      _idMatrix[yIdIndex + 1][xIdIndex] = elementId;
      notifyListeners();
    } else if (move == MoveBox.top && yIdIndex != 0) {
      final elementId = _idMatrix[yIdIndex][xIdIndex];
      _idMatrix[yIdIndex][xIdIndex] = 0;
      _idMatrix[yIdIndex - 1][xIdIndex] = elementId;
      notifyListeners();
    }
  }

  double getBoxWith(var size) => size.width / _idMatrix[0].length;

  double getBoxHeight(var size) => size.height / _idMatrix.length;
}

class AxisAlign {
  final Axis? align;
  final PositionZero? zero;

  AxisAlign({this.align, this.zero});
}

class PositionBox {
  final double x;
  final double y;

  PositionBox({required this.x, required this.y});
}

// class IdIndex {
//   final int x;
//   final int y;
//
//   IdIndex({required this.x, required this.y});
// }
