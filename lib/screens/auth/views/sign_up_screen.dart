import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/components/mytext_field.dart';
import 'package:pizza/screens/auth/blocs/signUpBloc/sign_up_bloc.dart';
import 'package:user_repository/user_repository.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formkey = GlobalKey<FormState>();
  bool obsecurepassword = true;
  bool signUprequired = false;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  IconData iconPassword = CupertinoIcons.eye_fill;
  String? errmessage;

  bool containsUpperCase = false;
  bool containslowerCase = false;
  bool containsnumber = false;
  bool containsspecialChar = false;
  bool contains8length = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          setState(() {
            signUprequired = false;
          });
        } else if (state is SignUpFailure) {
          setState(() {
            signUprequired = false;
            errmessage = 'Invalid email or password';
          });
        } else if (state is SignUpLoading) {
          setState(() {
            signUprequired = true;
          });
        }
      },
      child: Form(
        key: formkey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
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
                prifixicon: const Icon(CupertinoIcons.lock_fill),
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
                onchange: (val) {
                  if (val.contains(RegExp(r'[A-Z]'))) {
                    setState(() {
                      containsUpperCase = true;
                    });
                  } else {
                    setState(() {
                      containsUpperCase = false;
                    });
                  }
                  ////////
                  if (val.contains(RegExp(r'[a-z]'))) {
                    setState(() {
                      containslowerCase = true;
                    });
                  } else {
                    setState(() {
                      containslowerCase = false;
                    });
                  }
                  ////////////
                  if (val.contains(RegExp(r'[0-9]'))) {
                    setState(() {
                      containsnumber = true;
                    });
                  } else {
                    setState(() {
                      containsnumber = false;
                    });
                  }
                  ////////////
                  if (val.contains(RegExp(
                      r'^(?=.*?[!@#$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^])'))) {
                    setState(() {
                      containsspecialChar = true;
                    });
                  } else {
                    setState(() {
                      containsspecialChar = false;
                    });
                  }
                  //////////
                  if (val.length >= 8) {
                    setState(() {
                      contains8length = true;
                    });
                  } else {
                    setState(() {
                      contains8length = false;
                    });
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
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "⚈  1 uppercase",
                        style: TextStyle(
                            color: containsUpperCase
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground),
                      ),
                      Text(
                        "⚈  1 lowercase",
                        style: TextStyle(
                            color: containslowerCase
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground),
                      ),
                      Text(
                        "⚈  1 number",
                        style: TextStyle(
                            color: containsnumber
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "⚈  1 special character",
                        style: TextStyle(
                            color: containsspecialChar
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground),
                      ),
                      Text(
                        "⚈  8 minimum character",
                        style: TextStyle(
                            color: contains8length
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground),
                      ),
                    ],
                  )
                ],
              ),
               const  SizedBox(
                height: 20,
              ),
              MytextField(
                obsecuretext: false,
                controller: namecontroller,
                keyboardtype: TextInputType.name,
                errmessage: errmessage,
                hinttext: "Your Name",
                prifixicon: const Icon(CupertinoIcons.person_fill),
                validation: (val) {
                  if (val!.isEmpty) {
                    return 'Please fill in this field';
                  } else if (val.length > 30) {
                    return "the name is too long";
                  }
                  return null;
                },
              ),
             const  SizedBox(
                height: 20,
              ),
              !signUprequired
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            MyUser myuser = MyUser.empty;
                            myuser.name = namecontroller.text;
                            myuser.email = emailcontroller.text;
                            context.read<SignUpBloc>().add(SignUpRequired(
                                password: passwordcontroller.text,
                                user: myuser));
                          }
                        },
                         child: Text(
                          "Sign In",
                          style:  TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            elevation: 3,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60))),
                      ),
                    )
                  : const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
