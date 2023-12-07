String day2_1(List<String> contents) {

  // Opponent : A = Rock, B = Paper, C = Scissors
  // My choice : X = Rock, Y = Paper, Z = Scissors
  // Score My choice : Rock = 1, Paper = 2, Scissors = 3
  // Outcome : Lost = 0, Draw = 3, Won = 6

  var map = <String, int>{
    "A X": 4,
    "A Y": 8,
    "A Z": 3,
    "B X": 1,
    "B Y": 5,
    "B Z": 9,
    "C X": 7,
    "C Y": 2,
    "C Z": 6,
  };

  int sum = 0;
  for (int i = 0; i < contents.length; i++) {
    sum += map[contents[i]]!;
  }

  return "$sum";
}

String day2_2(List<String> contents) {

  // Opponent : A = Rock, B = Paper, C = Scissors
  // My choice : X = lose, Y = draw, Z = win
  // Score My choice : Rock = 1, Paper = 2, Scissors = 3
  // Outcome : Lost = 0, Draw = 3, Won = 6

  var map = <String, int>{
    "A X": 3,
    "A Y": 4,
    "A Z": 8,
    "B X": 1,
    "B Y": 5,
    "B Z": 9,
    "C X": 2,
    "C Y": 6,
    "C Z": 7,
  };

  int sum = 0;
  for (int i = 0; i < contents.length; i++) {
    sum += map[contents[i]]!;
  }

  return "$sum";
}