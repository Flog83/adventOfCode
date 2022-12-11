class Coordinate {
  int x;
  int y;
  Set<Coordinate> save = {};

  Coordinate(this.x, this.y);

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
  int startX = 200;
  int startY = 200;

  Coordinate startPosition = Coordinate(startX, startY);
  Coordinate headPosition = Coordinate(startX, startY);
  Coordinate tailPosition = Coordinate(startX, startY);

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

      evaluateTail(headPosition, tailPosition);
      //displayPosition(headPosition, tailPosition, 6);
      print('\t--------------\t\t');
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
      } else {
        line += '.';
      }
    }
    print(line);
  }
}

void evaluateTail(Coordinate headPosition, Coordinate tailPosition) {
  print('Head : x : ${headPosition.x} / y : ${headPosition.y}');
  print('Tail : x : ${tailPosition.x} / y : ${tailPosition.y}');
  //displayPosition(headPosition, tailPosition, 200);
  //print('\t----reevaluate------\t\t');
  if (headPosition.x != tailPosition.x && headPosition.y != tailPosition.y) {
    if (headPosition.x - tailPosition.x >= 2) {
      tailPosition.moveRight();
      if (headPosition.y > tailPosition.y) {
        tailPosition.moveDown();
      } else {
        tailPosition.moveUp();
      }
    } else if (tailPosition.x - headPosition.x >= 2) {
      tailPosition.moveLeft();
      if (headPosition.y > tailPosition.y) {
        tailPosition.moveDown();
      } else {
        tailPosition.moveUp();
      }
    } else if (headPosition.y - tailPosition.y >= 2) {
      tailPosition.moveDown();
      if (headPosition.x > tailPosition.x) {
        tailPosition.moveRight();
      } else {
        tailPosition.moveLeft();
      }
    } else if (tailPosition.y - headPosition.y >= 2) {
      tailPosition.moveUp();
      if (headPosition.x > tailPosition.x) {
        tailPosition.moveRight();
      } else {
        tailPosition.moveLeft();
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
