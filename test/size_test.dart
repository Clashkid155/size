import 'dart:io';

import 'package:size/size.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = '/';

    setUp(() {
      // Additional setup goes here.
    });

    test('false', () async {
      expect(await Directory(awesome).is_empty(), isFalse);
    });
  });
}
