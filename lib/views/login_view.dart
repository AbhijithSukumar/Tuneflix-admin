// ignore_for_file: avoid_print


import 'package:admin_ui/models/login_model.dart';
import 'package:admin_ui/utilities/routes/routes.dart';
import 'package:admin_ui/view_models/login_view_model.dart';
import 'package:admin_ui/widgets/tuneflix_form_button.dart';
import 'package:admin_ui/widgets/tuneflix_form_field.dart';
import 'package:admin_ui/widgets/tuneflix_form_label.dart';
import 'package:admin_ui/widgets/tuneflix_form_title.dart';
import 'package:flutter/material.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    RegExp passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Center(
                        child: Icon(
                      Icons.play_circle_filled,
                      size: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.green,
                    )),
                  ),
                  TuneFlixFormTitle(
                    formTitle: "Tuneflix admin",
                    titleTopPadding: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const TuneFlixFormLabel(label: "Email"),
                  TuneFlixFormField(
                    maximumLines: 1,
                    obscureText: false,
                    formController: emailController,
                    validatorFunc: (value) {
                      if (value.isEmpty || value == null) {
                        return "username is required";
                      }
                      return null;
                    },
                    hint: "Enter your username",
                  ),
                  const TuneFlixFormLabel(label: "Password"),
                  TuneFlixFormField(
                    maximumLines: 1,
                    obscureText: true,
                    formController: passwordController,
                    validatorFunc: (value) {
                      if (value.isEmpty || value == null) {
                        return "password is required";
                      }
                      if (!passwordRegex.hasMatch(value)) {
                        return "password is weak";
                      }
                      return null;
                    },
                    hint: "Enter your password",
                  ),
                  TuneFlixFormButton(
                    onFormSubmit: () async {
                      if (formKey.currentState!.validate()) {
                        String email = emailController.text.trim();
                        String password = passwordController.text.trim();

                        var loginData =
                            LoginModel(username: email, password: password);
                        adminLogin(loginData).then((value) {
                          if (value["status"] == true) {
                           Navigator.pushNamed(context, Routes.dashboard);
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.green,
                                    title: const Text(
                                      "Login failed",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    content: const Text("invalid credentials",
                                        style: TextStyle(color: Colors.white)),
                                    actions: [
                                      TextButton(
                                        child: const Text('OK',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                });
                          }
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
