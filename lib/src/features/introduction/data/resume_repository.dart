import 'dart:async';
import 'dart:ui';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'resume_repository.g.dart';

@riverpod
ResumeRepository resumeRepository(ResumeRepositoryRef ref) {
  return ResumeRepository(FirebaseStorage.instance);
}

class ResumeRepository {
  ResumeRepository(this._storage);

  final FirebaseStorage _storage;

  Future<String> getResumeUrl(Locale locale) async {
    final resumeRef =
        _storage.ref().child("pdfs/resumes/${locale.languageCode}");
    final results = await resumeRef.list();
    final url = await results.items.first.getDownloadURL();
    return url;
  }
}
