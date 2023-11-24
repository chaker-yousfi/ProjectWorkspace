import 'package:ecommerce_app/utilities/regex_utility.dart';
import 'package:ecommerce_app/views/login_view.dart';
import 'package:ecommerce_app/views/sign_up_view.dart';
import 'package:ecommerce_app/widgets/mytextformField.dart';
import 'package:ecommerce_app/widgets/passwordtextformfield.dart';
import 'package:flutter/material.dart';
import '../widgets/mybutton.dart';
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

  Widget _buildAllTextFormField() {
    return Container(
      height: 230,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MyTextFormField(
            name: "Email",
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your email";
              } else if (!emailRegex.hasMatch(value)) {
                return "Invalid email";
              }
              return null;
            },
          ),
          PasswordTextFormField(
            obserText: isObscureText,
            name: "Password",
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter your password";
              } else if (value.length < 8) {
                return "Your password is too short";
              }
              return null;
            },
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                isObscureText = !isObscureText;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return Container(
      height: 400,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildAllTextFormField(),
          MyButton(
              name: "Login",
              onPressed: () {
                validation();
              }),
          Row(
            children: <Widget>[
              const Text("I do not have an account"),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => SignUpView(),
                    ),
                  );
                },
                child: const Text(
                  "Sign up",
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
    );
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
                  child: const Column(
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
                const SizedBox(
                  height: 20,
                ),
                _buildBottomPart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
