class Coordinate {
  int x;
  int y;
  Set<Coordinate> save = {};

  Coordinate(this.x, this.y);

  void saveStart() {
    save.add(Coordinate(x, y));
  }

  void moveRight() {
    x++;
    save.add(Coordinate(x, y));
  }

  void moveLeft() {
    x--;
    save.add(Coordinate(x, y));
  }

  void moveUp() {
    y--;
    save.add(Coordinate(x, y));
  }

  void moveDown() {
    y++;
    save.add(Coordinate(x, y));
  }

  void moveRightDown() {
    x++;
    y++;
    save.add(Coordinate(x, y));
  }

  void moveRightUp() {
    x++;
    y--;
    save.add(Coordinate(x, y));
  }

  void moveLeftDown() {
    x--;
    y++;
    save.add(Coordinate(x, y));
  }

  void moveLeftUp() {
    x--;
    y--;
    save.add(Coordinate(x, y));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Coordinate &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;

  @override
  int get hashCode => x.hashCode + y.hashCode;
}

String day9_1(List<String> contents) {
  int startX = 0;
  int startY = 4;

  Coordinate headPosition = Coordinate(startX, startY);
  headPosition.saveStart();
  Coordinate tailPosition = Coordinate(startX, startY);
  tailPosition.saveStart();

  for (String line in contents) {
    var split = line.split(' ');
    var direction = split[0];
    var distance = int.parse(split[1]);

    for (int move = 0; move < distance; move++) {
      switch (direction) {
        case 'R':
          headPosition.moveRight();
          break;
        case 'L':
          headPosition.moveLeft();
          break;
        case 'U':
          headPosition.moveUp();
          break;
        case 'D':
          headPosition.moveDown();
          break;
      }

      //print('Head : x : ${headPosition.x} / y : ${headPosition.y}');
      //print('Tail : x : ${tailPosition.x} / y : ${tailPosition.y}');
      //displayPosition(headPosition, tailPosition, 6);
      //print('\t----reevaluate------\t\t');
      evaluateTail(headPosition, tailPosition);
      //displayPosition(headPosition, tailPosition, 6);
      //print('\t--------------\t\t');
    }
  }

  return '${tailPosition.save.length}';
}

void displayPosition(Coordinate head, Coordinate tail, int size) {
  for (int y = 0; y < size; y++) {
    String line = '';
    for (int x = 0; x < size; x++) {
      if (tail.x == x && tail.y == y) {
        line += 'T';
      } else if (head.x == x && head.y == y) {
        line += 'H';
      } else if (tail.save.contains(Coordinate(x, y))) {
        line += '#';
      } else {
        line += '.';
      }
    }
    print(line);
  }
}

void evaluateTail(Coordinate headPosition, Coordinate tailPosition) {

  if (headPosition.x != tailPosition.x && headPosition.y != tailPosition.y) {
    if (headPosition.x - tailPosition.x >= 2) {
      if (headPosition.y > tailPosition.y) {
        tailPosition.moveRightDown();
      } else {
        tailPosition.moveRightUp();
      }
    } else if (tailPosition.x - headPosition.x >= 2) {
      if (headPosition.y > tailPosition.y) {
        tailPosition.moveLeftDown();
      } else {
        tailPosition.moveLeftUp();
      }
    } else if (headPosition.y - tailPosition.y >= 2) {
      if (headPosition.x > tailPosition.x) {
        tailPosition.moveRightDown();
      } else {
        tailPosition.moveLeftDown();
      }
    } else if (tailPosition.y - headPosition.y >= 2) {
      if (headPosition.x > tailPosition.x) {
        tailPosition.moveRightUp();
      } else {
        tailPosition.moveLeftUp();
      }
    }
  } else {
    if (headPosition.x - tailPosition.x >= 2) {
      tailPosition.moveRight();
    } else if (tailPosition.x - headPosition.x >= 2) {
      tailPosition.moveLeft();
    } else if (headPosition.y - tailPosition.y >= 2) {
      tailPosition.moveDown();
    } else if (tailPosition.y - headPosition.y >= 2) {
      tailPosition.moveUp();
    }
  }
}

String day9_2(List<String> contents) {
  int startX = 11;
  int startY = 15;

  Coordinate headPosition = Coordinate(startX, startY);
  headPosition.saveStart();

  List<Coordinate> tailsPositions = <Coordinate>[];
  for(int i=0; i<9; i++) {

    Coordinate tailPosition = Coordinate(startX, startY);
    tailPosition.saveStart();

    tailsPositions.add(tailPosition);
  }

  for (String line in contents) {
    var split = line.split(' ');
    var direction = split[0];
    var distance = int.parse(split[1]);

    for (int move = 0; move < distance; move++) {
      switch (direction) {
        case 'R':
          headPosition.moveRight();
          break;
        case 'L':
          headPosition.moveLeft();
          break;
        case 'U':
          headPosition.moveUp();
          break;
        case 'D':
          headPosition.moveDown();
          break;
      }

      print('Head : x : ${headPosition.x} / y : ${headPosition.y}');
      //displayPosition2(headPosition, tailsPositions, 30);
      //print('\t----reevaluate------\t\t');
      evaluateTail(headPosition, tailsPositions[0]);
      for(int i=1; i<9; i++) {
        evaluateTail(tailsPositions[i-1], tailsPositions[i]);
      }
      print('\t--------------\t\t');
    }
    displayPosition2(headPosition, tailsPositions, 30);
  }

  return '${tailsPositions[8].save.length}';
}

void displayPosition2(Coordinate head, List<Coordinate> tails, int size) {
  for (int y = 0; y < size; y++) {
    String line = '';
    for (int x = 0; x < size; x++) {
      if (head.x == x && head.y == y) {
        line += 'H';
      } else if (tails[0].x == x && tails[0].y == y) {
          line += '1';
      } else if (tails[1].x == x && tails[1].y == y) {
          line += '2';
      } else if (tails[2].x == x && tails[2].y == y) {
          line += '3';
      } else if (tails[3].x == x && tails[3].y == y) {
          line += '4';
      } else if (tails[4].x == x && tails[4].y == y) {
          line += '5';
      } else if (tails[5].x == x && tails[5].y == y) {
          line += '6';
      } else if (tails[6].x == x && tails[6].y == y) {
          line += '7';
      } else if (tails[7].x == x && tails[7].y == y) {
          line += '8';
      } else if (tails[8].x == x && tails[8].y == y) {
          line += '9';
      } else {
        line += '.';
      }
    }
    print(line);
  }
}