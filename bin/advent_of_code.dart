import 'dart:io';

import 'package:advent_of_code/day1.dart';
import 'package:advent_of_code/day2.dart';

void main(List<String> arguments) {
  File('resources/day2_2.txt').readAsLines().then((List<String> contents) {
    print('File Contents\n---------------');
    print(contents);

    String result = day2_2(contents);

    print(result);
  });
}
