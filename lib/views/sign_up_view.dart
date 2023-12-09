import 'package:ecommerce_app/utilities/regex_utility.dart';
import 'package:ecommerce_app/views/homepage_view.dart';
import 'package:ecommerce_app/views/login_view.dart';
import 'package:ecommerce_app/widgets/changescreen_widget.dart';
import 'package:ecommerce_app/widgets/mytextformField_widget.dart';
import 'package:ecommerce_app/widgets/passwordtextformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/mybutton_widget.dart';
import 'dart:developer' as developer;

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = RegExp(p);
bool isObscureText = true;

class _SignUpViewState extends State<SignUpView> {
  void validation() {
    final FormState? _form = _formKey.currentState;
    if (_form!.validate()) {
      developer.log("Yes");
    } else {
      developer.log("No");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 250,
                  width: double.infinity,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 400,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MyTextFormField(
                        name: "Username",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your username";
                          } else if (value.length < 6) {
                            return "Username is too short";
                          }
                          return "";
                        },
                      ),
                      MyTextFormField(
                        name: "Email",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your email";
                          } else if (!emailRegex.hasMatch(value)) {
                            return ("Invalid email");
                          }
                          return ("");
                        },
                      ),
                      PasswordTextFormField(
                        obserText: isObscureText,
                        name: "Password",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Enter your password");
                          } else if (value.length < 8) {
                            return ("Your password is too short");
                          }
                          return ("");
                        },
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                      ),
                      MyTextFormField(
                        name: "Phone Number",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your phone number";
                          } else if (value.length < 10) {
                            return "Phone number must be 10 digits";
                          }
                          return "";
                        },
                      ),
                      MyButton(
                        name: "Register",
                        onPressed: () {
                          validation();
                        },
                      ),
                      ChangeScreen(
                        name: 'Login',
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (ctx) => LoginView(),
                            ),
                          );
                        },
                        whichAccount: 'I already have an account',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
