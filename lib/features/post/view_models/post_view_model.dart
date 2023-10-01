import 'dart:async';

import 'package:final_project/features/post/repos/post_repo.dart';
import 'package:final_project/features/post/view_models/timeline_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostViewModel extends AsyncNotifier<void> {
  late final PostRepo _postRepo;

  @override
  FutureOr<void> build() {
    _postRepo = ref.read(postRepo);
  }

  Future<void> postUpload(String text, String mood) async {
    state = const AsyncValue.loading();
    await AsyncValue.guard(() async {
      await _postRepo.addPost(text: text, mood: mood);
      await ref.read(timelineProvider.notifier).fetch();
    });
  }

  Future<void> deletePost(String docId) async {
    state = const AsyncValue.loading();
    await AsyncValue.guard(() async {
      await _postRepo.deletePost(docId);
      await ref.read(timelineProvider.notifier).fetch();
    });
  }
}

final postProvider =
    AsyncNotifierProvider<PostViewModel, void>(() => PostViewModel());
