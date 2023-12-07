String day2_1(List<String> contents) {
  int result = 0;

  Map<String, int> map = {'red' : 12, 'green' : 13, 'blue' : 14};

  for (int i = 0; i < contents.length; i++) {
    String current = contents[i];

    List<String> splitted = current.split(':');

    String gameNbPart = splitted[0];
    String gamePlayPart = splitted[1];
   
    var regExp = RegExp(r'Game (?<number>[0-9]*)');
    var matches = regExp.allMatches(gameNbPart.trim());
    int gameNbId = int.parse(matches.first.namedGroup('number')!);

    print('Game : $gameNbId');
    splitted = gamePlayPart.split(';');

    regExp = RegExp(r'(?<number>[0-9]*)\s+(?<color>(red|green|blue))');
    int id = 0;
    bool invalidGame = false;
    for(String entry in splitted) {
      
      matches = regExp.allMatches(entry.trim());
      print('Set $id');
      for(RegExpMatch match in matches.toList()) {

        int colorValue = int.parse(match.namedGroup('number')!);
        String colorName = match.namedGroup('color')!;

        if(colorValue > map[colorName]!) {
          invalidGame = true;
        }
        print('$colorName : $colorValue => $invalidGame');
        if(invalidGame) {
          break;
        }
      }
      id++;
      print('---');
      if(invalidGame) {
        break;
      }
    }
    if(!invalidGame) {
      result += gameNbId;
    }
    print('interm : $result');
    print('---------------');
  }
  return result.toString();
}

String day2_2(List<String> contents) {
  int result = 0;

  for (int i = 0; i < contents.length; i++) {
    String current = contents[i];

    List<String> splitted = current.split(':');

    String gameNbPart = splitted[0];
    String gamePlayPart = splitted[1];
   
    var regExp = RegExp(r'Game (?<number>[0-9]*)');
    var matches = regExp.allMatches(gameNbPart.trim());
    int gameNbId = int.parse(matches.first.namedGroup('number')!);

    print('Game : $gameNbId');
    splitted = gamePlayPart.split(';');

    regExp = RegExp(r'(?<number>[0-9]*)\s+(?<color>(red|green|blue))');
    int id = 0;

    Map<String, int> map = {'red' : 0, 'green' : 0, 'blue' : 0};

    for(String entry in splitted) {
      
      matches = regExp.allMatches(entry.trim());
      print('Set $id');
      for(RegExpMatch match in matches.toList()) {

        int colorValue = int.parse(match.namedGroup('number')!);
        String colorName = match.namedGroup('color')!;

        int oldValue = map[colorName]!;

        if(colorValue > oldValue) {
          map[colorName] = colorValue;
          print('$colorName : $colorValue => keep it');
        } else {
          print('$colorName : $colorValue => reject it');
        }
      }
      id++;
      print('---');
    }
    int multiplication = 1;
    for(int value in map.values) {
      multiplication *= value;
    }

    result += multiplication;

    print('interm : $result');
    print('---------------');
  }
  return result.toString();
}
