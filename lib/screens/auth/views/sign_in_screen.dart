import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/components/mytext_field.dart';
import 'package:pizza/screens/auth/blocs/signInBloc/sign_in_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool obsecuretext = false;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  bool signInRequire = false;
  bool obsecurepassword = true;
  final formkey = GlobalKey<FormState>();
  IconData iconPassword = CupertinoIcons.eye_fill;
  String? errmessage;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInSucess) {
            setState(() {
              signInRequire = false;
            });
          } else if (state is SignInFailure) {
            setState(() {
              signInRequire = false;
              errmessage = 'Invalid email or password';
            });
          } else if (state is SignInLoading) {
            setState(() {
              signInRequire = true;
            });
          }
        },
        child: Form(
          key: formkey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                MytextField(
                  hinttext: "Email",
                  errmessage: errmessage,
                  keyboardtype: TextInputType.emailAddress,
                  prifixicon: Icon(CupertinoIcons.mail_solid),
                  obsecuretext: false,
                  controller: emailcontroller,
                  validation: (val) {
                    if (val!.isEmpty) {
                      return 'Please fill in this field';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$')
                        .hasMatch(val)) {
                      return 'Please enter a valid password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                MytextField(
                  obsecuretext: obsecurepassword,
                  controller: passwordcontroller,
                  keyboardtype: TextInputType.visiblePassword,
                  errmessage: errmessage,
                  prifixicon: Icon(CupertinoIcons.lock_fill),
                  hinttext: "Password",
                  validation: (val) {
                    if (val!.isEmpty) {
                      return 'Please fill in this field';
                    } else if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,}$')
                        .hasMatch(val)) {
                      return 'Please enter a valid password';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obsecurepassword = !obsecurepassword;
                          if (obsecurepassword) {
                            iconPassword = CupertinoIcons.eye_fill;
                          } else {
                            iconPassword = CupertinoIcons.eye_slash_fill;
                          }
                        });
                      },
                      icon: Icon(iconPassword)),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextButton(
                    onPressed: () {
                      if(formkey.currentState!.validate()){
                          context.read<SignInBloc>().add(SignInRequired(email: emailcontroller.text, password: passwordcontroller.text));
                      }
                    },
                    child: Text("Sign In",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      elevation:3,
                       foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
