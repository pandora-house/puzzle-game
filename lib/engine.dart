import 'package:flutter/cupertino.dart';

enum PositionGap { top, bottom, left, right }
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

  PositionGap? getGapPosition(var id, var matrix) {
    final coordinates = _getIdCoordinates(id, matrix);

    int? topIndex = coordinates.y - 1;
    if (coordinates.y == 0) topIndex = null;
    int? bottomIndex = coordinates.y + 1;
    if (coordinates.y == matrix.length - 1) bottomIndex = null;
    int? rightIndex = coordinates.x + 1;
    if (coordinates.x == matrix[0].length - 1) rightIndex = null;
    int? leftIndex = coordinates.x - 1;
    if (coordinates.x == 0) leftIndex = null;

    if (topIndex != null) {
      if (matrix[topIndex][coordinates.x] == 0) {
        return PositionGap.top;
      }
    }

    if (bottomIndex != null) {
      if (matrix[bottomIndex][coordinates.x] == 0) {
        return PositionGap.bottom;
      }
    }

    if (rightIndex != null) {
      if (matrix[coordinates.y][rightIndex] == 0) {
        return PositionGap.right;
      }
    }

    if (leftIndex != null) {
      if (matrix[coordinates.y][leftIndex] == 0) {
        return PositionGap.left;
      }
    }
  }

  void updateMatrix(var id, var move) {
    final coordinates = _getIdCoordinates(id, _idMatrix);

    if (move == MoveBox.bottom && coordinates.y != _idMatrix.length - 1) {
      final elementId = _idMatrix[coordinates.y][coordinates.x];
      _idMatrix[coordinates.y][coordinates.x] = 0;
      _idMatrix[coordinates.y + 1][coordinates.x] = elementId;
      notifyListeners();
    } else if (move == MoveBox.top && coordinates.y != 0) {
      final elementId = _idMatrix[coordinates.y][coordinates.x];
      _idMatrix[coordinates.y][coordinates.x] = 0;
      _idMatrix[coordinates.y - 1][coordinates.x] = elementId;
      notifyListeners();
    }
  }

  IdIndex _getIdCoordinates(var id, var matrix) {
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
    return IdIndex(x: xIdIndex, y: yIdIndex);
  }

  double getBoxWith(var size) => size.width / _idMatrix[0].length;

  double getBoxHeight(var size) => size.height / _idMatrix.length;
}

class PositionBox {
  final double x;
  final double y;

  PositionBox({required this.x, required this.y});
}

class IdIndex {
  final int x;
  final int y;

  IdIndex({required this.x, required this.y});
}
