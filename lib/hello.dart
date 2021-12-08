library hello;

import 'package:flutter/material.dart';

/// A Calculator.
class Utils {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;

  static Widget helloWord() => const Text("hello world");
}
