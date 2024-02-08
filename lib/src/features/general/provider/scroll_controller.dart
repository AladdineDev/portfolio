import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scrollControllerProvider = Provider<ScrollController>((ref) {
  return ScrollController();
});
