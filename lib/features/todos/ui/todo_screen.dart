import 'dart:developer';
import 'package:bloc_practice/features/login/bloc/login_bloc.dart';
import 'package:bloc_practice/features/todo_detail/ui/todo_detail_screen.dart';
import 'package:bloc_practice/features/todos/bloc/todo_bloc.dart';
import 'package:bloc_practice/utils/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var todoBloc = TodoBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoBloc.add(TodoInitialEvent());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text("Todo With Bloc"),
      ),
      body: BlocConsumer<TodoBloc, TodoState>(
        bloc: todoBloc,
        buildWhen: (previous, current) => current is! TodoActionState,
        listenWhen: (previous, current) => current is TodoActionState,
        listener: (context, state) {
          if (state is NavigateTodoDetailActionState) {
            final navigateToDetailState =
                state as NavigateTodoDetailActionState;

            log("paras");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TodoDetailScreen(
                          id: navigateToDetailState.id,
                        )));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case TodoLoadingState:
              return shimmerView();
            case TodoSuccessState:
              final successState = state as TodoSuccessState;
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        todoBloc.add(NavigateTodoDetailEvent(
                            id: successState.list[index].id.toString()));
                      },
                      leading: Text(successState.list[index].id.toString()),
                      title: Text(successState.list[index].title.toString()),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: successState.list.length);

            case TodoErrorState:
              final errorState = state as TodoErrorState;
              return Text(errorState.message);
            default:
              return SizedBox();
          }
        },
      ),
    );
  }

  shimmerView() {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                ShimmerWidget.rectangular(
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 10, child: ShimmerWidget.rectangular(height: 20)),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 20,
          );
        },
        itemCount: 50);
  }
}

