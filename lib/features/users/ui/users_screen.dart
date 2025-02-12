import 'package:bloc_practice/features/users/bloc/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  var usersBloc = UsersBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usersBloc.add(FetchedInitialEvent());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('USERS')),
      body: BlocConsumer<UsersBloc, UsersState>(
        bloc: usersBloc,
        buildWhen: (previous, current) => current is !UsersActionState,
        listenWhen: (previous, current) => current is UsersActionState,
        listener: (context, state) {
          // if (state is LikedActionState) {
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Liked")));
          // }
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case UsersLoadingState:
              return CircularProgressIndicator();

            case UsersSuccessState:
              final successState = state as UsersSuccessState;
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                        trailing: IconButton(
                          onPressed: () {
                            usersBloc.add(LikedButtonClickedEvent(
                                usersData: successState.list, index: index));
                          },
                          icon: Icon(successState.list[index].isLiked == false
                              ? Icons.thumb_up_alt_outlined
                              : Icons.thumb_up),
                        ),
                        title:
                            Text(successState.list[index].firstName.toString()),
                        leading: Image.network(
                            successState.list[index].avatar.toString()));
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                  itemCount: successState.list.length);
            // case DisLikedUserState  :
            //
            //   final successState = state as DisLikedUserState;
            //   return ListView.separated(
            //       shrinkWrap: true,
            //       itemBuilder: (context, index) {
            //         return ListTile(
            //             trailing: IconButton(
            //               onPressed: () {
            //
            //                 usersBloc.add(DisLikedButtonClickedEvent(usersData:  successState.usersDataList,index: index));
            //
            //               },
            //               icon: Icon(successState.usersDataList[index].isLiked==true?Icons.thumb_up_alt_outlined:Icons.thumb_up),
            //             ),
            //             title:
            //             Text(successState.usersDataList[index].firstName.toString()),
            //             leading: Image.network(
            //                 successState.usersDataList[index].avatar.toString()));
            //       },
            //       separatorBuilder: (context, index) => SizedBox(
            //         height: 20,
            //       ),
            //       itemCount: successState.usersDataList.length);
            case LikedUserState:
              final successState = state as LikedUserState;
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                        trailing: IconButton(
                          onPressed: () {
                            usersBloc.add(LikedButtonClickedEvent(
                                usersData: successState.usersDataList,
                                index: index));
                          },
                          icon: Icon(
                              successState.usersDataList[index].isLiked == false
                                  ? Icons.thumb_up_alt_outlined
                                  : Icons.thumb_up),
                        ),
                        title: Text(successState.usersDataList[index].firstName
                            .toString()),
                        leading: Image.network(successState
                            .usersDataList[index].avatar
                            .toString()));
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                  itemCount: successState.usersDataList.length);
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}

