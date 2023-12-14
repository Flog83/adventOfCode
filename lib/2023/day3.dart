
String day3_1(List<String> contents) {
  int result = 0;

  var regExp = RegExp('[0-9]');

  int sum = 0;

  for (int i = 0; i < contents.length; i++) {
    String currentNumber = '';
    bool hasCharInNeighbors = false;
    for (int j = 0; j < contents[i].length; j++) {
      String currentChar = contents[i][j];
      if (regExp.hasMatch(currentChar)) {
        currentNumber += currentChar;

        List<String> neighbors = <String>[];
        // check neighbors
        if (i > 0 && j > 0) {
          // check top left
          neighbors.add(contents[i - 1][j - 1]);
        }
        if (i > 0) {
          // check previous line
          neighbors.add(contents[i - 1][j]);
        }
        if (i > 0 && j < contents[i].length - 1) {
          // check top right
          neighbors.add(contents[i - 1][j + 1]);
        }

        if (j > 0) {
          // check previous char of the line
          neighbors.add(contents[i][j - 1]);
        }
        if (j < contents[i].length - 1) {
          // check next char of the line
          neighbors.add(contents[i][j + 1]);
        }

        if (i < contents.length - 1 && j > 0) {
          // check bottom left
          neighbors.add(contents[i + 1][j - 1]);
        }
        if (i < contents.length - 1) {
          // check next line
          neighbors.add(contents[i + 1][j]);
        }
        if (i < contents.length - 1 && j < contents[i].length - 1) {
          // check bottom right
          neighbors.add(contents[i + 1][j + 1]);
        }

        //neighbors.forEach(print);

        for (String neighbor in neighbors) {
          if (neighbor != '.' && !regExp.hasMatch(neighbor)) {
            print('char $neighbor');
            hasCharInNeighbors = true;
          }
        }
      }
      // current number is the last char of line or current is a .
      if ((j == contents[i].length-1 || !regExp.hasMatch(currentChar))) {
        if (currentNumber.isNotEmpty) {
          // update sum
          var parse = int.parse(currentNumber);

          print('extract value : $parse');
          if(hasCharInNeighbors) {
            print('get it');
            sum += parse;
            hasCharInNeighbors = false;
          }
          // reset
          currentNumber = '';
          print('---------------');
        }
      }
    }
  }
  return sum.toString();
}

class Pair<T, U> {
  T first;
  U second;

  Pair(this.first, this.second); 

  @override
  String toString() {
    return '[$first;$second]';
  }
}

String day3_2(List<String> contents) {

  var regExp = RegExp('[0-9]');

  int sum = 0;

  for (int i = 0; i < contents.length; i++) {
    for (int j = 0; j < contents[i].length; j++) {
      String currentChar = contents[i][j];
      if (currentChar == '*') {

        Pair starPosition = Pair(i, j);
        Map<Pair,String> neighbors = <Pair,String>{};

        // check neighbors
        if (i > 0 && j > 0) {
          // check top left
          neighbors.putIfAbsent(Pair(i-1, j-1), () => contents[i - 1][j - 1]);
        }
        if (i > 0) {
          // check previous line
          neighbors.putIfAbsent(Pair(i-1, j), () => contents[i - 1][j]);
        }
        if (i > 0 && j < contents[i].length - 1) {
          // check top right
          neighbors.putIfAbsent(Pair(i-1, j+1), () => contents[i - 1][j + 1]);
        }

        if (j > 0) {
          // check previous char of the line
          neighbors.putIfAbsent(Pair(i, j-1), () => contents[i][j - 1]);
        }
        if (j < contents[i].length - 1) {
          // check next char of the line
          neighbors.putIfAbsent(Pair(i, j+1), () => contents[i][j + 1]);
        }
        
        if (i < contents.length - 1 && j > 0) {
          // check bottom left
          neighbors.putIfAbsent(Pair(i+1, j-1), () => contents[i + 1][j - 1]);
        }
        if (i < contents.length - 1) {
          // check next line
          neighbors.putIfAbsent(Pair(i+1, j), () => contents[i + 1][j]);
        }
        if (i < contents.length - 1 && j < contents[i].length - 1) {
          // check bottom right
          neighbors.putIfAbsent(Pair(i+1, j+1), () => contents[i + 1][j + 1]);
        }

        print('Star position $starPosition');
        int lastLineIndex = -1;
        int lastColIndex = -1;

        List<int> gearNumbers = <int>[];
        for (MapEntry<Pair, String> neighbor in neighbors.entries) {
          if (neighbor.value != '.' && regExp.hasMatch(neighbor.value)) {

            print('Number neighbor part ${neighbor.value} ${neighbor.key}');
            if(neighbor.key.first != lastLineIndex) {

              lastLineIndex = neighbor.key.first;
              lastColIndex = neighbor.key.second;
              gearNumbers.add(int.parse(findCompleteNumber(contents[lastLineIndex], lastColIndex)));
            } else if(neighbor.key.first == lastLineIndex && lastColIndex+1 != neighbor.key.second) {

              lastLineIndex = neighbor.key.first;
              lastColIndex = neighbor.key.second;
              gearNumbers.add(int.parse(findCompleteNumber(contents[lastLineIndex], lastColIndex)));
            } else if(lastColIndex+1 == neighbor.key.second) {

              lastLineIndex = neighbor.key.first;
              lastColIndex = neighbor.key.second;
            }
          }
        }

        if(gearNumbers.length == 2) {
          int multiply = gearNumbers[0] * gearNumbers[1];
          print('Mulitply the two numbers $multiply');
          sum += multiply;
        }

        print('-------------');
      }
    }
  }

  return sum.toString();
}

String findCompleteNumber(String line, int numberPosition) {

  String number = '';
  var regExp = RegExp('[0-9]');

  for(int j = numberPosition; j < line.length; j++) {
    if(regExp.hasMatch(line[j])) {
      number += line[j];
    } else {
      break;
    }
  }
  for(int j = numberPosition-1; j >= 0; j--) {
    if(regExp.hasMatch(line[j])) {
      number = line[j] + number;
    } else {
      break;
    }
  }

  print('Number found $number');
  return number;
}
