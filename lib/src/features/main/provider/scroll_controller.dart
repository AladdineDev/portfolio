import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scrollControllerProvider =
    NotifierProvider<Scroll, ScrollController>(Scroll.new);

class Scroll extends Notifier<ScrollController> {
  @override
  ScrollController build() {
    return ScrollController();
  }

  bool checkEndOfScroll() {
    final scrollPosition = state.position;
    return scrollPosition.pixels >= scrollPosition.maxScrollExtent - 64;
  }
}
