import 'package:book_store/Features/Authentication/presentation/view_model/auth_cubit/auth_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationCubit extends Cubit<AuthenticationStates> {
  AuthenticationCubit() : super(InitialState());

  static AuthenticationCubit get(context) => BlocProvider.of(context);

  int currentScreen = 0;

  changeSlider(int value) {
    currentScreen = value;
    emit(ChangeSlider());
  }

  Future<void> signInMethod({
    required String email,
    required String password,
  }) async {
    emit(LoadingSignIn());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
      (value) {
        emit(SuccessSignIn());
      },
    ).catchError(
      (error) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(ErrorSignIn());
      },
    );
  }

  Future<void> signUpMethod({
    required String email,
    required String password,
  }) async {
    emit(LoadingSignUp());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
      (value) {
        emit(SuccessSignUp());
      },
    ).catchError(
      (error) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(ErrorSignUP(error.toString()));
      },
    );
  }

  Future<void> forgotPasswordMethod({
    required String email,
  }) async {
    emit(LoadingForgotPassword());
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then(
      (value) {
        emit(SuccessForgotPassword());
      },
    ).catchError(
      (error) {
        if (kDebugMode) {
          print(error.toString());
        }
        emit(ErrorForgotPassword());
      },
    );
  }
}
