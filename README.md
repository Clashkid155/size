<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# Disk Size for Desktop

A simple plugin that can display disk size on *Linux and Windows*.
**Mac not supported yet.**

## Features

* Available disk space.

* Free disk space.

* Disk capacity/size.

* is_empty extension on io::Directory.

### To get available disk space

```dart
import 'package:size/size.dart';
void main() async{
  var x = Sizes();
  print(x.getAvailableDiskSpace('/home'));  // 800007566 -> int
  print(x.getFreeDiskSpace('/home'));  // 800002566 -> int
  print(x.getDiskCapacity('/home'));  // 4540002566 -> int
  print(await Directory.current.is_empty()); // true -> bool
```

**Note:** On linux, if your home, root and any other directory are on the different partition, you partiton size will returned

## Additional information

Each get.. function return an int which is actally the disk size in byte

### Difference between getFreeDiskSpace and getAvailableDiskSpace

Arrcording to AlexP on [askubuntu](https://askubuntu.com/a/867073)

> * Free memory is the amount of memory which is currently not used for anything. This number should be small, because memory which is not used is simply wasted.
> * Available memory is the amount of memory which is available for allocation to a new process or to existing processes.
