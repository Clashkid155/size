import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:path/path.dart' as path;

typedef RootSpaceFun = Int64 Function();
typedef RootSpaceDart = int Function();
typedef SizeFun = Int64 Function(Pointer<Utf8>);
typedef SizeDart = int Function(Pointer<Utf8>);
var libraryPath = 'lib/shared/libsize.so';

//var libraryPath = 'lib/shared/libsize.so';

///home/francis/Projects/Size/size/lib/shared/libsize.so
class Sizes {
  Sizes() {
    if (Platform.isWindows) {
      libraryPath = path.join('lib', 'shared', 'size.dll');
    } else if (Platform.isMacOS) {
      libraryPath = path.join('lib', 'shared', 'libsize.dylib');
    }
  }
  final _dylib = DynamicLibrary.open(libraryPath);

  int getAvailableDiskSpace(String path) {
    var root = _dylib
        .lookupFunction<SizeFun, SizeDart>('getAvailableDiskSpace')
        .call(path.toNativeUtf8());
    if (root == -1) {
      throw Exception('Invalid File Path');
    }
    return root;
  }

  /// Return the free disk space from the part supplied
  /// This doesn't check Directory/File size
  int getFreeDiskSpace(String path) {
    var root = _dylib
        .lookupFunction<SizeFun, SizeDart>('getFreeDiskSpace')
        .call(path.toNativeUtf8());
    if (root == -1) {
      throw Exception('Invalid File Path');
    }
    return root;
  }

  /// Return the disk space from the part supplied
  /// This doesn't check Directory/File size
  int getDiskCapacity(String path) {
    var root = _dylib
        .lookupFunction<SizeFun, SizeDart>('getDiskCapacity')
        .call(path.toNativeUtf8());
    if (root == -1) {
      throw Exception('Invalid File Path');
    }
    return root;
  }

  bool _empty(String path) {
    var root = _dylib
        .lookupFunction<SizeFun, SizeDart>('empty')
        .call(path.toNativeUtf8());
    if (root == -1) {
      throw Exception('Invalid File Path');
    } else if (root == 0) {
      return false;
    } else {
      return true; // 1 is empty while 0 is not empty
    }
    //return root;
  }
}

extension Empty on Directory {
  // ignore: non_constant_identifier_names
  Future<bool> is_empty() async {
    return Sizes()._empty(this.path.toString());
  }
}
