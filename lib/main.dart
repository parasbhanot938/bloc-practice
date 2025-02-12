import 'package:bloc_practice/features/home/ui/home.dart';
import 'package:bloc_practice/features/login/ui/login_screen.dart';
import 'package:bloc_practice/features/users/ui/users_screen.dart';
import 'package:bloc_practice/image_picker_example/image_picker_view.dart';
import 'package:flutter/material.dart';

// List<CameraDescription>? camera;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // camera = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserScreen(),
    );
  }
}

