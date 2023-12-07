String day1_1(List<String> contents) {
  int result = 0;
  for (int i = 0; i < contents.length; i++) {
    String current = contents[i];

    String value = "";
    value += current[current.indexOf(RegExp('[0-9]'))];
    value += current[current.lastIndexOf(RegExp('[0-9]'))];

    print('Value read for line : $current => $value');

    result += int.parse(value);
  }
  return result.toString();
}

String day1_2(List<String> contents) {
  Map<String, String> map = {
    'one': '1',
    'two': '2',
    'three': '3',
    'four': '4',
    'five': '5',
    'six': '6',
    'seven': '7',
    'eight': '8',
    'nine': '9',
    'eno': '1',
    'owt': '2',
    'eerht': '3',
    'ruof': '4',
    'evif': '5',
    'xis': '6',
    'neves': '7',
    'thgie': '8',
    'enin': '9'
  };

  int result = 0;
  for (int i = 0; i < contents.length; i++) {
    String current = contents[i];

    String value = "";

    var regExp = RegExp(
        '[0-9]|one|two|three|four|five|six|seven|eight|nine');
    var matches = regExp.allMatches(current);

    matches.forEach((element) {print('${element.start} ${element.end} : ${element.input.substring(element.start, element.end)}');});

    String firstMatch = matches.first.input.substring(matches.first.start, matches.first.end);
    try {
      int.parse(firstMatch);
      value += firstMatch;
    } on FormatException {
      value += map[firstMatch]!;
    }

    String reverseCurrent = current.split('').reversed.join();
    var reverseRegExp = RegExp(
        '[0-9]|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin');
    var reverseMatches = reverseRegExp.allMatches(reverseCurrent);

    reverseMatches.forEach((element) {print('${element.start} ${element.end} : ${element.input.substring(element.start, element.end)}');});

    String firstReverseMatch = reverseMatches.first.input.substring(reverseMatches.first.start, reverseMatches.first.end);
    try {
      int.parse(firstReverseMatch);
      value += firstReverseMatch;
    } on FormatException {
      value += map[firstReverseMatch]!;
    }

    print('Value read for line : $current => $value');

    result += int.parse(value);
    
  }
  return result.toString();
}
