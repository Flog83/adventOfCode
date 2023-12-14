import 'dart:io';

import '../lib/2023/day3.dart';


void main(List<String> arguments) {
  var fileName = 'day3';
  Function(List<String> contents) dayFunction = day3_2;

  File('lib/2023/resources/$fileName.txt').readAsLines().then((List<String> contents) {
    //print('File Contents\n---------------');
    //print(contents);

    String result = dayFunction.call(contents);

    print('Result $result');
  });
}
