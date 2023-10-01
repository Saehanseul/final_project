import 'dart:async';

import 'package:final_project/features/post/models/post_model.dart';
import 'package:final_project/features/post/repos/post_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimelineViewModel extends AsyncNotifier<List<PostModel>> {
  late final PostRepo _postRepo;
  final List<PostModel> _posts = [];

  Future<List<PostModel>> _getPosts() async {
    final results = await _postRepo.getPosts();
    final res = results.docs
        .map((doc) => PostModel.fromJson({"id": doc.id, ...doc.data()}))
        .toList();

    print(res);
    return res;
  }

  @override
  FutureOr<List<PostModel>> build() async {
    _postRepo = ref.read(postRepo);
    return await _getPosts();
  }

  Future<void> fetch() async {
    final posts = await _getPosts();
    state = AsyncValue.data(posts);
  }
}

final timelineProvider =
    AsyncNotifierProvider<TimelineViewModel, List<PostModel>>(
  () => TimelineViewModel(),
);
