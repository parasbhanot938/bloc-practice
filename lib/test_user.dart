import 'package:bloc_practice/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auto_form/flutter_auto_form.dart';

class TestUser extends StatefulWidget {
  const TestUser({super.key});

  @override
  State<TestUser> createState() => _TestUserState();
}

class _TestUserState extends State<TestUser> {
  final List<Field> fields = [
    AFTextField(
      id: 'identifier',
      name: 'Identifier',
      validators: [
        MinimumStringLengthValidator(
          5,
          (e) => 'Min 5 characters, currently ${e?.length ?? 0} ',
        )
      ],
      type: AFTextFieldType.username,
    ),
    AFTextField(
      id: 'password',
      name: 'Password',
      validators: [
        MinimumStringLengthValidator(
          6,
          (e) => 'Min 6 characters, currently ${e?.length ?? 0} ',
        )
      ],
      type: AFTextFieldType.password,
    ),
    AFBooleanField(
      id: 'accept-condition',
      name: 'Accept terms',
      validators: [ShouldBeTrueValidator('Please accept terms to continue?')],
      value: false,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 50,
          child: Column(
            children: [Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [

                ],
              ),
            )
              // FormShowcaseTile(
              //   title: 'Registration form',
              //   child: AFWidget<RegistrationForm>(
              //     formBuilder: () => RegistrationForm(),
              //     submitButton: (Function() submit) {
              //       return Padding(
              //         padding: const EdgeInsets.only(top: 32),
              //         child: ElevatedButton(
              //           child: const Text('Submit'),
              //           onPressed: () {
              //             submit();
              //           },
              //         ),
              //       );
              //     },
              //     onSubmitted: (RegistrationForm form) {
              //       print(form.toMap());
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormShowcaseTile extends StatelessWidget {
  const FormShowcaseTile({Key? key, required this.child, required this.title})
      : super(key: key);

  final String title;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 16,
                  color: Colors.black12,
                  offset: Offset(0, 10),
                ),
              ],
              color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
