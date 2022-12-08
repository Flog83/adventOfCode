import 'dart:collection';

String day5_1(List<String> contents) {
  bool isStacksPart = true;
  var crateStacks = <Queue>[];

  for (int i = 0; i < contents.length; i++) {
    var line = contents[i];
    // Fill empty cell
    var replace = line.replaceAll('    ', '.[#]').replaceAll(' ', '.');

    if (replace.isEmpty) {
      print('Stack part ended');
      isStacksPart = false;
    }

    if (isStacksPart && replace.startsWith('[')) {
      // Parse stacks
      var crateLine = replace.split('.');
      if (crateStacks.isEmpty) {
        for (int i = 0; i < crateLine.length; i++) {
          crateStacks.add(new Queue());
        }
      }

      for (int i = 0; i < crateLine.length; i++) {
        if (crateLine[i] != '[#]') {
          crateStacks[i].addFirst(crateLine[i].substring(1, 2));
        }
      }
    } else if (replace.startsWith('move.')) {
      var moveParameters = <int>[];
      replace.split('.').forEach((element) {
        var currentParam = int.tryParse(element);
        if (currentParam != null) {
          moveParameters.add(currentParam);
        }
      });

      // number moveParameters[0]
      int number = moveParameters[0];

      // stack index start moveParameters[1]
      int stackIndexStart = moveParameters[1] - 1;

      // stack index dest moveParameters[2]
      int stackIndexDest = moveParameters[2] - 1;

      for (int i = 0; i < number; i++) {
        var removed = crateStacks[stackIndexStart].removeLast();
        crateStacks[stackIndexDest].addLast(removed);
      }

      print('$replace');
      for (int i = 0; i < crateStacks.length; i++) {
        print('${crateStacks[i]}');
      }
    }
  }

  var result = '';
  for (int i = 0; i < crateStacks.length; i++) {
    result += crateStacks[i].last;
  }

  return '$result';
}

String day5_2(List<String> contents) {
  bool isStacksPart = true;
  var crateStacks = <Queue>[];

  for (int i = 0; i < contents.length; i++) {
    var line = contents[i];
    // Fill empty cell
    var replace = line.replaceAll('    ', '.[#]').replaceAll(' ', '.');

    if (replace.isEmpty) {
      print('Stack part ended');
      isStacksPart = false;
    }

    if (isStacksPart && replace.startsWith('[')) {
      // Parse stacks
      var crateLine = replace.split('.');
      if (crateStacks.isEmpty) {
        for (int i = 0; i < crateLine.length; i++) {
          crateStacks.add(new Queue());
        }
      }

      for (int i = 0; i < crateLine.length; i++) {
        if (crateLine[i] != '[#]') {
          crateStacks[i].addFirst(crateLine[i].substring(1, 2));
        }
      }
    } else if (replace.startsWith('move.')) {
      var moveParameters = <int>[];
      replace.split('.').forEach((element) {
        var currentParam = int.tryParse(element);
        if (currentParam != null) {
          moveParameters.add(currentParam);
        }
      });

      // number moveParameters[0]
      int number = moveParameters[0];

      // stack index start moveParameters[1]
      int stackIndexStart = moveParameters[1] - 1;

      // stack index dest moveParameters[2]
      int stackIndexDest = moveParameters[2] - 1;

      // Specific part 2
      var stackPart = new Queue();
      for (int i = 0; i < number; i++) {
        var removed = crateStacks[stackIndexStart].removeLast();
        stackPart.addFirst(removed);
      }
      crateStacks[stackIndexDest].addAll(stackPart);
      // End Specific part 2

      print('$replace');
      for (int i = 0; i < crateStacks.length; i++) {
        print('${crateStacks[i]}');
      }
    }
  }

  var result = '';
  for (int i = 0; i < crateStacks.length; i++) {
    result += crateStacks[i].last;
  }

  return '$result';
}
