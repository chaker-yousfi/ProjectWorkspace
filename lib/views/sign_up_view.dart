import 'dart:developer' as developer;

import 'package:ecommerce_app/utilities/regex_utility.dart';
import 'package:ecommerce_app/views/homepage_view.dart';
import 'package:ecommerce_app/views/login_view.dart';
import 'package:ecommerce_app/widgets/mytextformField_widget.dart';
import 'package:ecommerce_app/widgets/passwordtextformfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/mybutton_widget.dart';

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
String? email;
String? password;

class _SignUpViewState extends State<SignUpView> {
  void validation() async {
    final FormState? _form = _formKey.currentState;
    if (!_form!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email!,
          password: password!,
        );
        // User creation successful
        User? user = userCredential.user;
        if (user != null) {
          print('User created: ${user.uid}');
        }
      } catch (e) {
        print('Error creating user: $e');
        ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.toString()),
                duration: Duration(seconds: 2),
          ),
        );
      }
    } else {
      developer.log("No");
    }
  }

  Widget _buildAllTextFormField() {
    return Container(
      height: 330,
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
            onChanged: (value) {
              setState(() {
                email = value;
                print(email);
              });
              return '';
            },
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
            onChanged: (value) {
              setState(() {
                password = value;
                print(password);
              });
              return '';
            },
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
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return Container(
      height: 500,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildAllTextFormField(),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 20),
            child: Row(
              children: <Widget>[
                const Text("Already have an account?"),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => LoginView(),
                      ),
                    );
                  },
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
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MyButton(
              name: "Create Account",
              onPressed: () {
                validation();
                Navigator.pushNamed(context, HomePageView.pageRoute);
              }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 180,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Sign up",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 40,
                            color: const Color(0xFF1B1A1A),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _buildBottomPart(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
