import 'package:flutter/cupertino.dart';

import 'models/models.dart';
import 'puzzle_page.dart';
import 'widgets/box_animated_widget.dart';

enum PositionGap { top, bottom, left, right }
enum MoveBox { top, bottom, left, right }

class Engine extends ChangeNotifier {
  final _currentIdMatrix = [
    [1, 2, 3, 4],
    [5, 6, 9, 7],
    [8, 0, 10, 11],
    [12, 13, 14, 15],
  ];

  bool _correct = false;

  List<List<int>> get idMatrix => _currentIdMatrix;

  bool get correct => _correct;

  PositionBox initPosition(var id, var size) {
    int counterY = 0;
    int counterX = 0;
    bool endSearch = false;

    for (final y in _currentIdMatrix) {
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
    final coordinates = _getIdCoordinates(id, _currentIdMatrix);

    final elementId = _currentIdMatrix[coordinates.y][coordinates.x];
    _currentIdMatrix[coordinates.y][coordinates.x] = 0;

    if (move == MoveBox.bottom) {
      _currentIdMatrix[coordinates.y + 1][coordinates.x] = elementId;
      notifyListeners();
      return;
    }
    if (move == MoveBox.top) {
      _currentIdMatrix[coordinates.y - 1][coordinates.x] = elementId;
      notifyListeners();
      return;
    }
    if (move == MoveBox.left) {
      _currentIdMatrix[coordinates.y][coordinates.x - 1] = elementId;
      notifyListeners();
      return;
    }
    if (move == MoveBox.right) {
      _currentIdMatrix[coordinates.y][coordinates.x + 1] = elementId;
      notifyListeners();
      return;
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

  double getBoxWith(var size) =>
      (size.width - 2 * PuzzlePage.padding) / _currentIdMatrix[0].length;

  double getBoxHeight(var size) =>
      (size.height - 2 * PuzzlePage.padding) / _currentIdMatrix.length;

  void checkIdMatrix() async {
    final id1XY = <int>[0, 0];
    final id2XY = <int>[0, 1];
    final id8XY = <int>[0, 2];
    final id9XY = <int>[1, 2];
    final id13XY = <int>[1, 3];
    final id14XY = <int>[2, 3];
    final id15XY = <int>[2, 3];

    final idList = <List<int>>[
      id1XY,
      id2XY,
      id8XY,
      id9XY,
      id13XY,
      id14XY,
      id15XY
    ];

    final correctMatrix = [
      [1, 0, 0, 0],
      [5, 0, 0, 0],
      [8, 9, 0, 0],
      [0, 13, 14, 15],
    ];

    for (final id in idList) {
      if (correctMatrix[id[1]][id[0]] != _currentIdMatrix[id[1]][id[0]]) {
        return;
      }
    }

    await Future.delayed(
        const Duration(milliseconds: BoxAnimatedWidget.timeAnimation));

    _correct = true;
    notifyListeners();
  }

  int quantityInternalGaps() => _currentIdMatrix.length - 1;
}
