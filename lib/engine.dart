import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

import 'puzzle_page.dart';
import 'models/models.dart';

enum PositionGap { top, bottom, left, right }
enum MoveBox { top, bottom, left, right }

class Engine extends ChangeNotifier {
  final _answerIdMatrix = [
    [1, 2, 3, 4],
    [5, 6, 10, 7],
    [8, 9, 0, 11],
    [12, 13, 14, 15],
  ];

  final _currentIdMatrix = [
    [1, 2, 3, 4],
    [5, 6, 0, 7],
    [8, 9, 10, 11],
    [12, 13, 14, 15],
  ];

  List<List<int>> get idMatrix => _currentIdMatrix;

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

  bool isIdMatrixCorrect() {
    Function equal = const DeepCollectionEquality().equals;
    return equal(_currentIdMatrix, _answerIdMatrix);
  }

  int quantityInternalGaps() => _currentIdMatrix.length - 1;
}
