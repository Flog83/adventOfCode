import 'dart:io';

import '../lib/day1.dart';
import '../lib/day2.dart';
import '../lib/day3.dart';
import '../lib/day4.dart';
import '../lib/day5.dart';
import '../lib/day6.dart';

void main(List<String> arguments) {
  var fileName = 'day6';
  Function(List<String> contents) dayFunction = day6_2;

  File('resources/${fileName}.txt').readAsLines().then((List<String> contents) {
    //print('File Contents\n---------------');
    //print(contents);

    String result = dayFunction.call(contents);

    print('Result $result');
  });
}
