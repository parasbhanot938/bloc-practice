import 'dart:developer';

import 'package:bloc_practice/features/counter/bloc/counter_bloc.dart';
import 'package:bloc_practice/features/posts/ui/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CounterScreen extends StatelessWidget {
  CounterScreen({Key? key}) : super(key: key);

  var counterBloc = CounterBloc();

  int val = 0;
  bool isChanged = false;

  Widget build(BuildContext context) {
    counterBloc.add(CounterIncrementEvent());

    return Scaffold(
      appBar: AppBar(title: Text("Counter Page")),
      body: Column(
        children: [
          // BlocBuilder<CounterBloc, CounterState>(
          //   bloc: counterBloc,
          //   builder: (context, state) {
          //     switch (state.runtimeType) {
          //       case CounterIncrementState:
          //         final successState = state as CounterIncrementState;
          //         return Text(successState.value.toString());
          //
          //       case CounterDecrementState:
          //         final successState = state as CounterDecrementState;
          //         return Text(successState.value.toString());
          //
          //       default:
          //         return Text("Not Found");
          //     }
          //   },
          // ),
          /*   Center(
              child: TextButton(
                  onPressed: () {
                    counterBloc.add(CounterIncrementEvent());
                  },
                  child: Text("Increment"))),
          SizedBox(
            height: 10,
          ),
          Center(
              child: TextButton(
                  onPressed: () {
                    counterBloc.add(CounterDecrementEvent());
                  },
                  child: Text("Decrement")))*/

          BlocConsumer<CounterBloc, CounterState>(
            bloc: counterBloc,
            buildWhen: (previous, current) => current is! CounterActionState,
            listenWhen: (previous, current) => current is CounterActionState,
            listener: (context, state) {
              if (state is NavigateNextScreenActionState) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PostsScreen()));
              } else if (state is CounterSnackBarActionState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Snack bar")));
              }
            },
            builder: (context, state) {
              switch (state.runtimeType) {
                case CounterIncrementState:
                  final successState = state as CounterIncrementState;

                  return Text(successState.value.toString());

                case CounterDecrementState:
                  final successState = state as CounterDecrementState;

                  return Text(successState.value.toString());

                default:
                  return Text("Not Found");
              }
            },
          ),
          Center(
              child: TextButton(
                  onPressed: () {
                    counterBloc.add(CounterIncrementEvent());
                  },
                  child: Text("Increment"))),
          Center(
              child: TextButton(
                  onPressed: () {
                    counterBloc.add(CounterDecrementEvent());
                  },
                  child: Text("Decrement"))),
          Center(
              child: TextButton(
                  onPressed: () {
                    counterBloc.add(NavigateNextScreenEvent());
                  },
                  child: Text("Go to Next Screen  "))),
          Center(
              child: TextButton(
                  onPressed: () {
                    counterBloc.add(CounterSnackBarEvent());
                  },
                  child: Text("Show Snack Bar "))),
        ],
      )
      /*BlocListener<CounterBloc, CounterState>(
        bloc: counterBloc,
        listener: (context, state) {
          // TODO: implement listener}

          if (state is CounterSnackBarActionState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Added")));
          } else if (state is CounterIncrementActionState) {
            val = val + 1;
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Added!")));

            setState(() {});
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(val.toString()),
            Center(
                child: TextButton(
                    onPressed: () {
                      counterBloc.add(CounterSnackBarEvent());
                    },
                    child: Text("Increment"))),
            Center(
                child: TextButton(
                    onPressed: () {
                      counterBloc.add(CounterSnackBarEvent());
                    },
                    child: Text("Snack bar"))),

            // BlocBuilder<CounterBloc, CounterState>(
            //   bloc: counterBloc,
            //   builder: (context, state) {
            //     switch (state.runtimeType) {
            //       case CounterIncrementState:
            //         final successState = state as CounterIncrementState;
            //         return Text(successState.value.toString());
            //
            //       case CounterDecrementState:
            //         final successState = state as CounterDecrementState;
            //         return Text(successState.value.toString());
            //
            //       default:
            //         return Text("Not Found");
            //     }
            //   },
            // ),
            // Center(
            //     child: TextButton(
            //         onPressed: () {
            //           counterBloc.add(CounterIncrementEvent());
            //         },
            //         child: Text("Increment"))),
            // SizedBox(
            //   height: 10,
            // ),
            // Center(
            //     child: TextButton(
            //         onPressed: () {
            //           counterBloc.add(CounterDecrementEvent());
            //         },
            //         child: Text("Decrement")))
          ],
        ),
      )*/
      ,
    );
  }
}


