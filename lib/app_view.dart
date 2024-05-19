import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/blocs/bloc/authentication_bloc.dart';
import 'package:pizza/screens/auth/views/welecome_view.dart';
import 'package:pizza/screens/home/views/home_view.dart';

class Myappview extends StatelessWidget {
  const Myappview({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
              title: 'Pizza Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.light(
              background: Colors.grey.shade200,
              onBackground: Colors.black,
              primary: Colors.blue,
              onPrimary: Colors.white)),
              home: Scaffold(appBar: AppBar(title: Text("pizza"),),),
      //  home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
      //   builder: (context, state) {
      //     if(state is AuthenticationSuccess){
      //        return HomeView();
      //     } else {
      //       return WelcomView();
      //     }
      //   },
      //  ),       
    );
  }
}
