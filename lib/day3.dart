String day3_1(List<String> contents) {
  int sum = 0;
  for (int i = 0; i < contents.length; i++) {
    String rucksack = contents[i];
    String firstCompartment = rucksack.substring(0, rucksack.length ~/ 2);
    String secondCompartment =
        rucksack.substring(rucksack.length ~/ 2, rucksack.length);

    var tabLine = secondCompartment.split('');
    for (int j = 0; j < tabLine.length; j++) {
      String char = tabLine[j];
      if (firstCompartment.contains(char)) {
        int charValue = char.runes.first;
        int convertedCharValue;
        // MAJ 'A' int value = 65
        if (charValue < 97) {
          // MAJ 'A' problem value = 27
          convertedCharValue = (charValue - 38);
        }
        // MAJ 'a' int value = 97
        else {
          // MAJ 'a' problem value = 1
          convertedCharValue = (charValue - 96);
        }
        sum += convertedCharValue;
        print('char : $char / value : $convertedCharValue');
        break;
      }
    }
  }

  return '$sum';
}

String day3_2(List<String> contents) {
  int sum = 0;
  var group = <String>[];
  for (int i = 0; i < contents.length; i++) {
    String rucksack = contents[i];

    if (i + 1 % 3 != 0) {
      print('add');
      group.add(rucksack);
    } else {
      print('handle');
      group.add(rucksack);
      var tabLine = group[0].split('');

      for (int j = 0; j < tabLine.length; j++) {
        String char = tabLine[j];
        if (group[1].contains(char) && group[2].contains(char)) {
          int charValue = char.runes.first;
          int convertedCharValue;
          // MAJ 'A' int value = 65
          if (charValue < 97) {
            // MAJ 'A' problem value = 27
            convertedCharValue = (charValue - 38);
          }
          // MAJ 'a' int value = 97
          else {
            // MAJ 'a' problem value = 1
            convertedCharValue = (charValue - 96);
          }
          sum += convertedCharValue;
          print('char : $char / value : $convertedCharValue');
          break;
        }
      }

      // Reset group
      group = <String>[];
    }
  }

  return '$sum';
}
