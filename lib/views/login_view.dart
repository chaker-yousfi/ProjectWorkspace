import 'package:ecommerce_app/utilities/regex_utility.dart';
import 'package:ecommerce_app/views/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool isObscureText = true;

class _LoginViewState extends State<LoginView> {
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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 250,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
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
                            return "Please enter your email";
                          } else if (!emailRegex.hasMatch(value)) {
                            return ("Invalid email");
                          }
                          return ("");
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      TextFormField(
                        obscureText: isObscureText,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Enter your password");
                          } else if (value.length < 8) {
                            return ("Your password is too short");
                          }
                          return ("");
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: Icon(
                              isObscureText == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          ),
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
                            child: Text("Login")),
                      ),
                      Row(
                        children: <Widget>[
                          Text("I do not have an account"),
                          SizedBox(
                            width: 20,
                            
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (ctx) => SignUpView(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.cyan,
                              ),
                            ),
                          ),
                        ],
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
