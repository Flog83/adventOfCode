String day6_1(List<String> contents) {
  String buffer = contents[0];

  var list = buffer.split('');

  int index = 0;
  for (int i = 0; i < list.length - 4; i++) {
    print('current : $i / value : ${list[i]}');

    // Create a String of 4 char
    String current = '${list[i]}';
    for (int j = i + 1; j < i + 4; j++) {
      current += '${list[j]}';
    }
    print('$current');

    // Use toSet to evaluate if all 4 char are unique
    if (current.runes.toSet().length == 4) {
      // i + 3 is tab index of the last char and +1 for human index
      index = i + 3 + 1;
      break;
    }
  }

  return "$index";
}

String day6_2(List<String> contents) {
  String buffer = contents[0];

  int sequenceSize = 14;

  var list = buffer.split('');

  int index = 0;
  for (int i = 0; i < list.length - sequenceSize; i++) {
    print('current : $i / value : ${list[i]}');

    // Create a String of 4 char
    String current = '${list[i]}';
    for (int j = i + 1; j < i + sequenceSize; j++) {
      current += '${list[j]}';
    }
    print('$current');

    // Use toSet to evaluate if all 4 char are unique
    if (current.runes.toSet().length == sequenceSize) {
      // i + sequenceSize - 1 is tab index of the last char and +1 for human index
      index = i + sequenceSize - 1 + 1;
      break;
    }
  }

  return "$index";
}
