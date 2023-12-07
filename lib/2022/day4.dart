String day4_1(List<String> contents) {
  int sum = 0;


  for (int i = 0; i < contents.length; i++) {

    var pairs = contents[i].split(',');

    // first pair
    var bounds1 = pairs[0].split('-');

    Set<int> set1 = Set();
    for(int i = int.parse(bounds1[0]); i <= int.parse(bounds1[1]); i++) {
      set1.add(i);
    }

    // second pair
    var bounds2 = pairs[1].split('-');

    Set<int> set2 = Set();
    for(int i = int.parse(bounds2[0]); i <= int.parse(bounds2[1]); i++) {
      set2.add(i);
    }

    if(set1.containsAll(set2) || set2.containsAll(set1)) {
      sum+=1;
      print('----------------------------------');
      print('$pairs');
    }

  }

  return '$sum';
}

String day4_2(List<String> contents) {
  int sum = 0;


  for (int i = 0; i < contents.length; i++) {

    var pairs = contents[i].split(',');

    // first pair
    var bounds1 = pairs[0].split('-');

    Set<int> set1 = Set();
    for(int i = int.parse(bounds1[0]); i <= int.parse(bounds1[1]); i++) {
      set1.add(i);
    }

    // second pair
    var bounds2 = pairs[1].split('-');

    Set<int> set2 = Set();
    for(int i = int.parse(bounds2[0]); i <= int.parse(bounds2[1]); i++) {
      set2.add(i);
    }

    if(set1.intersection(set2).isNotEmpty) {
      sum+=1;
      print('----------------------------------');
      print('$pairs');
    }

  }

  return '$sum';
}
