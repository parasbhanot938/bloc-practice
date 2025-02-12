import 'package:bloc_practice/features/todo_detail/bloc/todo_detail_bloc.dart';
import 'package:bloc_practice/utils/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoDetailScreen extends StatefulWidget {
  final String id;

  TodoDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<TodoDetailScreen> createState() => _TodoDetailScreenState();
}

class _TodoDetailScreenState extends State<TodoDetailScreen> {
  var todoDetailBloc = TodoDetailBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoDetailBloc.add(TodoDetailInitialEvent(id: widget.id));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo Detail by Bloc")),
      body: BlocConsumer<TodoDetailBloc, TodoDetailState>(
        bloc: todoDetailBloc,
        buildWhen: (previous, current) => current is! TodoDetailActionState,
        listenWhen: (previous, current) => current is TodoDetailActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case TodoDetailLoadingState:
              return Center(child: shimmerView());

            case ToDoDetailSuccessState:
              final successState = state as ToDoDetailSuccessState;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(successState.todoModel.id.toString() ?? "")),
                  Center(
                      child:
                          Text(successState.todoModel.title.toString() ?? ""))
                ],
              );

            case TodoDetailErrorState:
              final errorState = state as TodoDetailErrorState;
              return Text(errorState.message.toString());

            default:
              return Text("no data found");
          }
        },
      ),
    );
  }

  shimmerView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: ShimmerWidget.rectangular(
            height: 20,
            width: 20,
          )),
          SizedBox(
            height: 10,
          ),
          ShimmerWidget.rectangular(height: 20),
        ],
      ),
    );
  }
}
