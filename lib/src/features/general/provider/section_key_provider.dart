import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'section_key_provider.g.dart';

@riverpod
GlobalKey homeSectionKey(Ref ref) {
  return GlobalKey();
}

@riverpod
GlobalKey aboutSectionKey(Ref ref) {
  return GlobalKey();
}

@riverpod
GlobalKey experienceSectionKey(Ref ref) {
  return GlobalKey();
}

@riverpod
GlobalKey projectSectionKey(Ref ref) {
  return GlobalKey();
}
