import 'dart:io';

import '../lib/2023/day4.dart';


void main(List<String> arguments) {
  var fileName = 'day4';
  Function(List<String> contents) dayFunction = day4_2;

  File('lib/2023/resources/$fileName.txt').readAsLines().then((List<String> contents) {
    //print('File Contents\n---------------');
    //print(contents);

    String result = dayFunction.call(contents);

    print('Result $result');
  });
}
