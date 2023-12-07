String day8_1(List<String> contents) {
  // create 2D matrix
  var matrix = <List<int>>[];
  var matrixVisibility = <List<bool>>[];
  for (String line in contents) {
    matrix.add(line.split('').map((e) => int.parse(e)).toList());
    matrixVisibility.add(line.split('').map((e) => false).toList());
  }

  for (int row = 0; row < matrix.length; row++) {
    matrixVisibility[row][0] = true;
    matrixVisibility[row][matrix[row].length - 1] = true;
  }

  for (int col = 0; col < matrix.length; col++) {
    matrixVisibility[0][col] = true;
    matrixVisibility[matrix.length - 1][col] = true;
  }

  printMatrix(matrix);

  // From left side
  for (int row = 1; row < matrix.length - 1; row++) {
    // first tree of the line
    var treeSizeMax = matrix[row][0];
    for (int col = 1; col < matrix[row].length - 1; col++) {
      if (matrix[row][col] > treeSizeMax) {
        // is visible
        treeSizeMax = matrix[row][col];
        matrixVisibility[row][col] = true;
      }
    }
  }

  printMatrix(matrixVisibility);

  print('\t-------------\t\t');

  // From right side
  for (int row = 1; row < matrix.length - 1; row++) {
    // first tree of the line
    var treeSizeMax = matrix[row][matrix.length - 1];
    for (int col = matrix[row].length - 2; col > 0; col--) {
      if (matrix[row][col] > treeSizeMax) {
        // is visible
        treeSizeMax = matrix[row][col];
        matrixVisibility[row][col] = true;
      }
    }
  }

  printMatrix(matrixVisibility);

  print('\t-------------\t\t');

  // From top side
  for (int col = 1; col < matrix[0].length - 1; col++) {
    // first tree of the line
    var treeSizeMax = matrix[0][col];
    for (int row = 1; row < matrix.length - 1; row++) {
      if (matrix[row][col] > treeSizeMax) {
        // is visible
        treeSizeMax = matrix[row][col];
        matrixVisibility[row][col] = true;
      }
    }
  }

  printMatrix(matrixVisibility);

  print('\t-------------\t\t');

  // From bottom side
  for (int col = 1; col < matrix[0].length - 1; col++) {
    // first tree of the line
    var treeSizeMax = matrix[matrix[0].length - 1][col];
    for (int row = matrix.length - 2; row > 0; row--) {
      if (matrix[row][col] > treeSizeMax) {
        // is visible
        treeSizeMax = matrix[row][col];
        matrixVisibility[row][col] = true;
      }
    }
  }

  var result = 0;
  // Compute result
  for (int row = 0; row < matrix.length; row++) {
    for (int col = 0; col < matrix[row].length; col++) {
      if (matrixVisibility[row][col]) {
        result++;
      }
    }
  }

  return '$result';
}

void printMatrix(List<List> matrix) {
  for (int row = 0; row < matrix.length; row++) {
    // first tree of the line
    var line = '';
    for (int col = 0; col < matrix.length; col++) {
      line += '${matrix[row][col]}';
    }
    print(line);
  }
}

String day8_1bis(List<String> contents) {
  // create 2D matrix
  var matrix = <List<int>>[];
  var matrixVisibility = <List<bool>>[];
  for (String line in contents) {
    matrix.add(line.split('').map((e) => int.parse(e)).toList());
    matrixVisibility.add(line.split('').map((e) => false).toList());
  }

  for (int row = 0; row < matrix.length; row++) {
    matrixVisibility[row][0] = true;
    matrixVisibility[row][matrix[row].length - 1] = true;
  }

  for (int col = 0; col < matrix.length; col++) {
    matrixVisibility[0][col] = true;
    matrixVisibility[matrix.length - 1][col] = true;
  }

  printMatrix(matrix);

  for (int row = 1; row < matrix.length - 1; row++) {
    for (int col = 1; col < matrix[row].length - 1; col++) {
      int currentTreeSize = matrix[row][col];

      // right
      bool rightOk = true;
      for (int col2 = col + 1; col2 < matrix[row].length; col2++) {
        if (matrix[row][col2] >= currentTreeSize) {
          rightOk = false;
          break;
        }
      }

      // left
      bool leftOk = true;
      for (int col2 = col - 1; col2 >= 0; col2--) {
        if (matrix[row][col2] >= currentTreeSize) {
          leftOk = false;
          break;
        }
      }

      // top
      bool topOk = true;
      for (int row2 = row - 1; row2 >= 0; row2--) {
        if (matrix[row2][col] >= currentTreeSize) {
          topOk = false;
          break;
        }
      }

      // bottom
      bool bottomOk = true;
      for (int row2 = row + 1; row2 < matrix.length; row2++) {
        if (matrix[row2][col] >= currentTreeSize) {
          bottomOk = false;
          break;
        }
      }

      if (rightOk || leftOk || topOk || bottomOk) {
        matrixVisibility[row][col] = true;
      }
    }
  }

  printMatrix(matrixVisibility);

  var result = 0;
  // Compute result
  for (int row = 0; row < matrix.length; row++) {
    for (int col = 0; col < matrix[row].length; col++) {
      if (matrixVisibility[row][col]) {
        result++;
      }
    }
  }

  return '$result';
}

String day8_2(List<String> contents) {
  // create 2D matrix
  var matrix = <List<int>>[];
  var matrixVisibility = <List<bool>>[];
  for (String line in contents) {
    matrix.add(line.split('').map((e) => int.parse(e)).toList());
    matrixVisibility.add(line.split('').map((e) => false).toList());
  }

  for (int row = 0; row < matrix.length; row++) {
    matrixVisibility[row][0] = true;
    matrixVisibility[row][matrix[row].length - 1] = true;
  }

  for (int col = 0; col < matrix.length; col++) {
    matrixVisibility[0][col] = true;
    matrixVisibility[matrix.length - 1][col] = true;
  }

  printMatrix(matrix);

  var maxScore = 0;

  for (int row = 1; row < matrix.length - 1; row++) {
    for (int col = 1; col < matrix[row].length - 1; col++) {
      int currentTreeSize = matrix[row][col];

      int rightCounter = 0;
      // right
      bool rightOk = true;
      for (int col2 = col + 1; col2 < matrix[row].length; col2++) {
        if (matrix[row][col2] >= currentTreeSize) {
          rightOk = false;
          rightCounter++;
          break;
        } else {
          rightCounter++;
        }
      }

      int leftCounter = 0;
      // left
      bool leftOk = true;
      for (int col2 = col - 1; col2 >= 0; col2--) {
        if (matrix[row][col2] >= currentTreeSize) {
          leftOk = false;
          leftCounter++;
          break;
        } else {
          leftCounter++;
        }
      }

      int topCounter = 0;
      // top
      bool topOk = true;
      for (int row2 = row - 1; row2 >= 0; row2--) {
        if (matrix[row2][col] >= currentTreeSize) {
          topOk = false;
          topCounter++;
          break;
        } else {
          topCounter++;
        }
      }

      int bottomCounter = 0;
      // bottom
      bool bottomOk = true;
      for (int row2 = row + 1; row2 < matrix.length; row2++) {
        if (matrix[row2][col] >= currentTreeSize) {
          bottomOk = false;
          bottomCounter++;
          break;
        } else {
          bottomCounter++;
        }
      }

      var score = rightCounter * leftCounter * topCounter * bottomCounter;
      if (score > maxScore) {
        maxScore = score;
      }
      print('score : $score / maxScore : $maxScore');
    }
  }

  return '$maxScore';
}
