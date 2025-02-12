import 'package:bloc_practice/features/create_users/bloc/create_user_bloc.dart';
import 'package:bloc_practice/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CreateUserScreen extends StatefulWidget {
  const
  CreateUserScreen({Key? dkey});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  var nameController = TextEditingController();
  var jobController = TextEditingController();

  var nameNode = FocusNode();
  var jobNode = FocusNode();
  var createUserBloc = CreateUserBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CreateUserBloc, CreateUserState>(
        bloc: createUserBloc,
        buildWhen: (previous, current) => current is! CreateUserActionState,
        listenWhen: (previous, current) => current is CreateUserActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CreateUserLoadingState:
              return Center(
                child: CircularProgressIndicator(),
              );

            case CreateUserSuccessState:
              final successState = state as CreateUserSuccessState;
              return Center(
                child: Text(style: TextStyle(),
                    "User Created with name : ${successState.createUserModel.name.toString()} "),
              );

            case CreateUserErrorState:
              return Text("Something went wrong");
            default:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonTextField(
                    controller: nameController,
                    focusNode: nameNode,
                    padding: EdgeInsets.all(0),
                    placeholder: "Enter Name",
                    onChanged: (value) {},
                    title: "Name",
                    validation: (value) {},
                    isMandatory: true,
                    keyboardTyoe: TextInputType.emailAddress,
                    inputFormatter: <TextInputFormatter>[],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  commonTextField(
                    controller: jobController,
                    focusNode: jobNode,
                    validation: (value) {
                      if (value.toString().isEmpty) {
                        return 'Password cannot be empty';
                      }
                    },
                    padding: EdgeInsets.all(0),
                    placeholder: "Enter Job",
                    onChanged: (value) {},
                    title: "Job",
                    isMandatory: true,
                    keyboardTyoe: TextInputType.emailAddress,
                    inputFormatter: <TextInputFormatter>[],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(

                      onPressed: () {
                        createUserBloc.add(CreateUserButtonClickedEvent(
                            name: nameController.text,
                            job: jobController.text));
                      },
                      child: Text("Create User")),
                ],
              );
          }
        },

      ),
    );
  }
}






