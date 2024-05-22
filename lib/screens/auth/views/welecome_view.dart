import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/blocs/bloc/authentication_bloc.dart';
import 'package:pizza/screens/auth/blocs/signInBloc/sign_in_bloc.dart';
import 'package:pizza/screens/auth/blocs/signUpBloc/sign_up_bloc.dart';
import 'package:pizza/screens/auth/views/sign_in_screen.dart';
import 'package:pizza/screens/auth/views/sign_up_screen.dart';

class WelcomView extends StatefulWidget {
  const WelcomView({super.key});

  @override
  State<WelcomView> createState() => _WelcomViewState();
}

class _WelcomViewState extends State<WelcomView> with TickerProviderStateMixin {

  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(
      initialIndex: 0,
      length: 2, 
      vsync:this );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(20, -1.2),
                child: Container(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.tertiary),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(2.7, -1.2),
                child: Container(
                  height: MediaQuery.of(context).size.width / 1.3,
                  width: MediaQuery.of(context).size.width / 1.3,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
              BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                  child: Container()),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.9,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: TabBar(
                        controller: tabController,
                        labelColor: Theme.of(context).colorScheme.onBackground,
                        unselectedLabelColor:Theme.of(context).colorScheme.onBackground.withOpacity(0.5) ,
                        indicatorColor: Theme.of(context).colorScheme.primary,
                        dividerColor: Colors.white,
                        tabs: const [
                          Padding(
                            padding:  EdgeInsets.all(10),
                            child: Text("Sign In"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("Sign Up"),
                          )
                        ]),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            BlocProvider<SignInBloc>(
                              create: (context) => SignInBloc(
                                context.read<AuthenticationBloc>().userRepository
                              ),
                              child: SignInScreen(),
                            ),
                            BlocProvider(
                              create: (context) => SignUpBloc(
                                context.read<AuthenticationBloc>().userRepository
                              ),
                              child: SignUpScreen(),
                            )
                          ]),
                      ),
                      ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
