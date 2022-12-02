
String day1_1(List<String> contents) {

    int currentSum = 0;
    int mostCalories = 0;
    for (int i = 0; i < contents.length; i++) {
      String current = contents[i];
      if(current.isEmpty) {
        if(currentSum > mostCalories) {
          mostCalories = currentSum;
        }
        currentSum = 0;
      } else {
        currentSum += int.parse(current);
      }
    }
    return mostCalories.toString();
}

String day1_2(List<String> contents) {

    int currentSum = 0;
    final top3 = <int>[0,0,0];
    
    for (int i = 0; i < contents.length; i++) {
      String current = contents[i];
      if(current.isEmpty) {
        if(top3.any((element) => element < currentSum)) {
          top3.add(currentSum);
          if(top3.length > 3) {
            // remove minor value
            top3.sort();
            top3.removeAt(0);
          }
          print('TOP 3 UPDATED $top3');
        }
        currentSum = 0;
      } else {
        currentSum += int.parse(current);
      }
    }
    return top3.reduce((value, element) => value + element).toString();
}