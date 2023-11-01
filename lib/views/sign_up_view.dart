import 'package:flutter/material.dart';
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
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your username";
                          } else if (value.length < 6) {
                            return "Username is too short";
                          }
                          return "";
                        },
                        decoration: const InputDecoration(
                          hintText: "Username",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your email";
                          } else if (!regExp.hasMatch(value)) {
                            return "Invalid email";
                          }
                          return "";
                        },
                        decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        obscureText: isObscureText,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your password";
                          } else if (value.length < 8) {
                            return "Password is too short. Enter at least 8 characters";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              developer.log(isObscureText.toString());
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                              FocusScope.of(context).unfocus();
                            },
                            child: Icon(
                              isObscureText == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          ),
                          hintStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your phone number";
                          } else if (value.length < 10) {
                            return "Phone number must be 10 digits";
                          }
                          return "";
                        },
                        decoration: const InputDecoration(
                          hintText: "Phone Number",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            validation();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey),
                          child: const Text("Register"),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          const Text("I already have an account"),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
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
