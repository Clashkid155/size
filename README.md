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

A simple package which displays disk size on *Linux and Windows*.
**Mac not supported, yet.**

## Features

* Available disk space.

* Free disk space.

* Disk capacity/size.

* is_empty extension on io::Directory.

### To get available disk space

```dart
import 'package:size/size.dart';
void main() async{
  await Size.init(); // Initialize plugin
  var x = Size();
  print(x.getAvailableDiskSpace('/home'));  // 800007566 -> int
  print(x.getFreeDiskSpace('/home'));  // 800002566 -> int
  print(x.getDiskCapacity('/home'));  // 4540002566 -> int
  print(await Directory.current.is_empty()); // false -> bool
```

Always use `await Size.init();` to initialize package before trying any other method. This will download the required libs since they can't be bundled with this Package.

**Note:** On linux, if your home, root and any other directory are on different partitions, your partition size will be returned.

## Additional information

Each get.. function returns an int which is actually the disk size in byte.

### Difference between getFreeDiskSpace and getAvailableDiskSpace

According to AlexP on [askubuntu](https://askubuntu.com/a/867073)

> * Free memory is the amount of memory which is currently not used for anything. This number should be small, because memory which is not used is simply wasted.
> * Available memory is the amount of memory which is available for allocation to a new process or to existing processes.

## Building lib

If you what to build the lib.

```bash
cd size
mkdir build && cd build
cmake -S ..
make
```

### **Create an issue if you've any problem.**
