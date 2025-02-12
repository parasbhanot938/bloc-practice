import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/features/posts/models/post_model.dart';
import 'package:bloc_practice/features/posts/repos/post_repo.dart';

import 'package:meta/meta.dart';

part 'posts_event.dart';

part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
    on<PostSeeAllButtonClickedEvent>(postSeeAllButtonClickedEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostsState> emit) async {

    emit(PostFetchingLoadingState());
    List<PostModel> postDataList = await PostRepo.fetchPostsApi();

    if (postDataList.isNotEmpty) {
      emit(PostFetchingSuccessState(postList: postDataList));
    } else {
      emit(PostFetchingErrorState());
    }
  }

  FutureOr<void> postSeeAllButtonClickedEvent(
      PostSeeAllButtonClickedEvent event, Emitter<PostsState> emit) {
    emit(PostNavigationSeeAllActionState());
  }
}
