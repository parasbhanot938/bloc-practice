import 'package:bloc_practice/features/login/bloc/login_bloc.dart';
import 'package:bloc_practice/features/todos/ui/todo_screen.dart';
import 'package:bloc_practice/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  var emailNode = FocusNode();
  var passwordNode = FocusNode();
  var loginBloc = LoginBloc();
  final _formKey = GlobalKey<FormState>();
  var switchVal = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginBloc.add(LoginInitialEvent());
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.emoji_emotions_outlined),
          title: Text("Login With Bloc")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: BlocConsumer<LoginBloc, LoginState>(
            bloc: loginBloc,
            buildWhen: (previous, current) => current is! LoginActionState,
            listenWhen: (previous, current) => current is LoginActionState,
            listener: (context, state) {
              if (state is LoginSnackBarActionState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("${state.token}"),
                ));
              } else if (state is NavigateToDosActionState) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TodoScreen()));
              }
            },
            builder: (context, state) {
              switch (state.runtimeType) {
                case LoginInitialState:
                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        commonTextField(
                          controller: emailController,
                          focusNode: emailNode,
                          padding: EdgeInsets.all(0),
                          placeholder: "Enter Email",
                          onChanged: (value) {},
                          title: "Email",
                          validation: (value) {
                            if (value.toString().isEmpty) {
                              return 'Email cannot be empty';
                            }
                          },
                          isMandatory: true,
                          keyboardTyoe: TextInputType.emailAddress,
                          inputFormatter: <TextInputFormatter>[],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        commonTextField(
                          controller: passwordController,
                          focusNode: passwordNode,
                          validation: (value) {
                            if (value.toString().isEmpty) {
                              return 'Password cannot be empty';
                            }
                          },
                          padding: EdgeInsets.all(0),
                          placeholder: "Enter Password",
                          onChanged: (value) {},
                          title: "Password",
                          isMandatory: true,
                          keyboardTyoe: TextInputType.emailAddress,
                          inputFormatter: <TextInputFormatter>[],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate())
                                loginBloc.add(LoginButtonClickedEvent(
                                    email: emailController.text,
                                    password: passwordController.text));
                            },
                            child: Text("Login")),
                        TextButton(
                            onPressed: () {
                              loginBloc.add(NavigateTodoScreenButtonEvent());
                            },
                            child: Text("Go to Todos")),
                        TextButton(
                            onPressed: () {
                              scanQR();
                            },
                            child: Text("Scan")),
                        Neumorphic(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            style: NeumorphicStyle(
                                shape: NeumorphicShape.concave,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(12)),
                                depth: 8,
                                lightSource: LightSource.topLeft,
                                color: Colors.grey),
                            child: NeumorphicSwitch(
                              value: switchVal,
                              style: NeumorphicSwitchStyle(
                                  disableDepth: true,
                                  inactiveThumbColor: Colors.black,
                                  thumbBorder: NeumorphicBorder(
                                    color: Colors.green,
                                  ),
                                  activeThumbColor: Colors.pink,
                                  activeTrackColor: Colors.blue),
                              isEnabled: true,
                              height: 20,
                              duration: Duration(seconds: 1),
                              onChanged: (value) {
                                switchVal = value;
                                setState(() {});
                              },
                            ))
                      ],
                    ),
                  );
                case LoginSuccessState:
                  final successState = state as LoginSuccessState;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SliverAppBar(
                      //     centerTitle: true,
                      //     iconTheme: const IconThemeData(color: Colors.black),
                      //     backgroundColor: Colors.pink,
                      //     expandedHeight: 200.0,
                      //     title: Text("Paras"),
                      //     shape: const RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.only(
                      //         bottomLeft: Radius.circular(20.0),
                      //         bottomRight: Radius.circular(20.0),
                      //       ),
                      //     )),
                      Center(
                          child: Text(
                              "Token Fetched : ${successState.token.toString()}")),
                      TextButton(
                          onPressed: () {
                            loginBloc.add(TryAgainButtonClickedEvent());
                          },
                          child: Text("Try Again?"))
                    ],
                  );

                case LoginLoadingState:
                  return Center(child: CircularProgressIndicator());
                case LoginErrorState:
                  final errorstate = state as LoginErrorState;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Text("Error: ${errorstate.message}")),
                      TextButton(
                          onPressed: () {
                            loginBloc.add(TryAgainButtonClickedEvent());
                          },
                          child: Text("Try Again?"))
                    ],
                  );

                default:
                 return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> scanQR() async {
    // String barcodeScanRes;
    // // Platform messages may fail, so we use a try/catch PlatformException.
    // try {
    //   barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
    //       '#ff6666', 'Cancel', true, ScanMode.QR);
    //   print("bar code output---$barcodeScanRes");
    // } on PlatformException {
    //   barcodeScanRes = 'Failed to get platform version.';
    // }
    //
    // // If the widget was removed from the tree while the asynchronous platform
    // // message was in flight, we want to discard the reply rather than calling
    // // setState to update our non-existent appearance.
    // if (!mounted) return;
    //
    // setState(() {
    //   _scanBarcode = barcodeScanRes;
    // });
  }
}

/*
*
* {
    "email": "eve.holt@reqres.in",
    "password": "cityslicka"
}
*
*
* */
