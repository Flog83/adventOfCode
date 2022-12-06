import 'dart:io';

import '../lib/day1.dart';
import '../lib/day2.dart';
import '../lib/day3.dart';
import '../lib/day4.dart';

void main(List<String> arguments) {
  var fileName = 'day4';
  Function(List<String> contents) dayFunction = day4_2;

  File('resources/${fileName}.txt').readAsLines().then((List<String> contents) {
    print('File Contents\n---------------');
    print(contents);

    String result = dayFunction.call(contents);

    print(result);
  });
}
