import 'package:bloc_practice/features/posts/bloc/posts_bloc.dart';
import 'package:bloc_practice/features/posts/ui/see_all.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  var postBloc = PostsBloc();

  @override
  void initState() {
    // TODO: implement initState
    postBloc.add(PostInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts")),
      body: BlocConsumer<PostsBloc, PostsState>(
        bloc: postBloc,
        listenWhen: (previous, current) => current is PostActionState,
        buildWhen: (previous, current) => current is! PostActionState,
        listener: (context, state) {
          if (state is PostNavigationSeeAllActionState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SeeAll()));
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case PostFetchingSuccessState:
              final successState = state as PostFetchingSuccessState;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _seeAll(),
                    ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: successState.postList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.teal.withOpacity(0.2)),
                            child:
                                Text("${successState.postList[index].title}"));
                      },
                    ),
                  ],
                ),
              );

            case PostFetchingLoadingState:
              return Center(
                child: CircularProgressIndicator(),
              );

            case PostFetchingErrorState:
              return Container(
                alignment: Alignment.center,
                child: Text("Something went wrong"),
              );
          }

          return SizedBox();
        },
      ),
    );
  }

  Widget _seeAll() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Align(
          alignment: Alignment.topRight,
          child: InkWell(
              onTap: () {
                postBloc.add(PostSeeAllButtonClickedEvent());
              },
              child: Text("See All"))),
    );
  }
}
