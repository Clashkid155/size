import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:path/path.dart' as path;

//typedef _RootSpaceFun = Int64 Function();
//typedef _RootSpaceDart = int Function();
typedef _SizeFun = Int64 Function(Pointer<Utf8>);
typedef _SizeDart = int Function(Pointer<Utf8>);

/// Base class
///
/// Each method throws an Invalid File Path exception when provided path does not exist.
class Sizes {
  late final DynamicLibrary _dylib;
  late final String _libraryPath;
  Size() {
    if (Platform.isWindows) {
      _libraryPath = 'size.dll';
    } else if (Platform.isLinux) {
      _libraryPath = 'libsize.so';
    } else if (Platform.isMacOS) {
      throw Exception("Mac Os not yet supported");
    }
    _dylib = DynamicLibrary.open(_libraryPath);
  }

  /// Return an int of the available disk space from the path supplied.
  /// This doesn't check Directory/File size.
  int getAvailableDiskSpace(String path) {
    var root = _dylib
        .lookupFunction<_SizeFun, _SizeDart>('getAvailableDiskSpace')
        .call(path.toNativeUtf8());
    if (root == -1) {
      throw Exception('Invalid File Path');
    }
    return root;
  }

  /// Return an int of the free disk space from the path supplied
  /// This doesn't check Directory/File size.
  int getFreeDiskSpace(String path) {
    var root = _dylib
        .lookupFunction<_SizeFun, _SizeDart>('getFreeDiskSpace')
        .call(path.toNativeUtf8());
    if (root == -1) {
      throw Exception('Invalid File Path');
    }
    return root;
  }

  /// Return an int of the disk space from the path supplied
  /// This doesn't check Directory/File size
  int getDiskCapacity(String path) {
    var root = _dylib
        .lookupFunction<_SizeFun, _SizeDart>('getDiskCapacity')
        .call(path.toNativeUtf8());
    if (root == -1) {
      throw Exception('Invalid File Path');
    }
    return root;
  }

  /// Check if Directory is empty. => bool
  bool _empty(String path) {
    var root = _dylib
        .lookupFunction<_SizeFun, _SizeDart>('empty')
        .call(path.toNativeUtf8());
    if (root == -1) {
      throw Exception('Invalid File Path');
    } else if (root == 0) {
      return false;
    } else {
      return true; // 1 is empty while 0 is not empty
    }
  }
}

/// Adds is_empty  on dart Directory class
extension Empty on Directory {
  // ignore: non_constant_identifier_names
  Future<bool> is_empty() async {
    return Sizes()._empty(this.path.toString());
  }
}
