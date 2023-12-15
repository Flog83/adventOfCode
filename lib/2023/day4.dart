String day4_1(List<String> contents) {
  int result = 0;

  for (int i = 0; i < contents.length; i++) {
    print('Game ${i + 1}');
    String current = contents[i];

    var split = current.split(':');

    String cardGame = split[0].trim();
    String game = split[1].trim();

    split = game.split('|');

    String winningCards = split[0].trim();
    String ourCards = split[1].trim();

    var winningCardsSplit = winningCards.split(RegExp(r'\s+'));
    var ourCardsSplit = ourCards.split(RegExp(r'\s+'));

    int point = 0;

    for (String ourCard in ourCardsSplit) {
      if (winningCardsSplit.contains(ourCard)) {
        if (point == 0) {
          point = 1;
        } else {
          point = 2 * point;
        }
        print('Match card $ourCard give me : $point points');
      }
    }

    print('Add $point points');
    result += point;
  }

  return result.toString();
}

String day4_2(List<String> contents) {
  int result = 0;

  Map<String, int> numberOfCardByCard = <String, int>{};
  Map<String, int> numberOfWinByCard = <String, int>{};

  for (int i = 0; i < contents.length; i++) {
    print('Game ${i + 1}');
    String current = contents[i];

    var split = current.split(':');

    String cardGame = split[0].trim();
    String game = split[1].trim();

    String cardNumber = cardGame.split(RegExp(r'\s+'))[1];

    if (numberOfCardByCard[cardNumber] == null) {
      numberOfCardByCard[cardNumber] = 1;
    } else {
      numberOfCardByCard[cardNumber] = numberOfCardByCard[cardNumber]! + 1;
    }
    int numberOfCard = numberOfCardByCard[cardNumber]!;

    split = game.split('|');

    String winningCards = split[0].trim();
    String ourCards = split[1].trim();

    var winningCardsSplit = winningCards.split(RegExp(r'\s+'));
    var ourCardsSplit = ourCards.split(RegExp(r'\s+'));

    int winNumber = 0;

    for (String ourCard in ourCardsSplit) {
      if (winningCardsSplit.contains(ourCard)) {
        winNumber++;
      }
    }
    numberOfWinByCard.putIfAbsent(cardNumber, () => winNumber);
    print(
        'Card $cardNumber win $winNumber * $numberOfCard = ${winNumber * numberOfCard}');

    int cardNumberInt = int.parse(cardNumber);
    for (int i = cardNumberInt + 1; i <= cardNumberInt + winNumber; i++) {
      if (numberOfCardByCard['$i'] == null) {
        numberOfCardByCard['$i'] = numberOfCardByCard[cardNumber]!;
      } else {
        numberOfCardByCard['$i'] = numberOfCardByCard['$i']! + numberOfCardByCard[cardNumber]!;
      }
    }

    result += numberOfCard;
  }

  return result.toString();
}
 /*for (int i = 0; i < contents.length; i++) {
    int cardNumberInt = int.parse(cardNumber);
    for(int i = cardNumberInt+1; i <=  cardNumberInt+winNumber; i++) {
      numberOfCardByCard['$i'] = numberOfCardByCard['$i']!+1;
    }
    }*/