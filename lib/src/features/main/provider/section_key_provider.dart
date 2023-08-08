import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'section_key_provider.g.dart';

@riverpod
GlobalKey homeSectionKey(HomeSectionKeyRef ref) {
  return GlobalKey();
}

@riverpod
GlobalKey aboutSectionKey(AboutSectionKeyRef ref) {
  return GlobalKey();
}

@riverpod
GlobalKey experienceSectionKey(ExperienceSectionKeyRef ref) {
  return GlobalKey();
}

@riverpod
GlobalKey projectSectionKey(ProjectSectionKeyRef ref) {
  return GlobalKey();
}
