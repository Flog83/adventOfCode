import 'dart:collection';

String day5_1(List<String> contents) {
  for (int i = 0; i < contents.length; i++) {
    var pairs = contents[i];
    var repalce = pairs.replaceAll(' ', '.');

    print('$repalce');
  }

  return '';
}
