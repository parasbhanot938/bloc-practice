part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

abstract class PostsActionState extends PostsState {}

class PostsInitial extends PostsState {}

abstract class PostActionState extends PostsState {}

class PostFetchingLoadingState extends PostsState {}

class PostFetchingErrorState extends PostsState {}

class PostFetchingSuccessState extends PostsState {
  final List<PostModel> postList;

  PostFetchingSuccessState({required this.postList});
}

class PostNavigationSeeAllActionState extends PostActionState {

}
