import 'dart:io';

import '../lib/day1.dart';
import '../lib/day2.dart';
import '../lib/day3.dart';
import '../lib/day4.dart';
import '../lib/day5.dart';
import '../lib/day6.dart';
import '../lib/day7.dart';
import '../lib/day8.dart';

void main(List<String> arguments) {
  var fileName = 'day8';
  Function(List<String> contents) dayFunction = day8_2;

  File('resources/$fileName.txt').readAsLines().then((List<String> contents) {
    //print('File Contents\n---------------');
    //print(contents);

    String result = dayFunction.call(contents);

    print('Result $result');
  });
}
