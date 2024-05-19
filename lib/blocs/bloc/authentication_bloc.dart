import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
    late final StreamSubscription<MyUser?> _userSubscription;

  AuthenticationBloc({required this.userRepository}) : super(Authenticationloading()) {
    _userSubscription = userRepository.user.listen((event) {
      add(authenticationchanged(user: event));
    },);
    on<authenticationchanged>((event, emit) {
        if(event.user != MyUser.empty){
          emit(AuthenticationSuccess(user: event.user!));
        }else{ emit(Authenticationfailure(errmessage: "there was an error"));
        }
    });
  } 
    @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
