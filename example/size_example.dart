import 'dart:io';

import 'package:size/size.dart';

void main() async {
  var x = Sizes();
  print(await Directory.current.is_empty());
  print(x.getAvailableDiskSpace('/home'));
  print(x.getAvailableDiskSpace('/home/francis/Projects/Filesize/D'));
  print(x.getDiskCapacity('/'));
  var size = Sizes();
  print(
      'Your Disk capacity is: ${size.getDiskCapacity(Directory.current.path)}');
}
