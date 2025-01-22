import 'package:book_store/Core/constants/constants.dart';
import 'package:book_store/Core/utils/shared_preferences.dart';
import 'package:book_store/Features/Authentication/data/models/user_model.dart';
import 'package:book_store/Features/Authentication/data/repos/auth_repo.dart';
import 'package:book_store/Features/Authentication/data/repos/auth_repo_implementation.dart';
import 'package:book_store/Features/Authentication/presentation/view_model/auth_cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationCubit extends Cubit<AuthenticationStates> {
  AuthenticationCubit() : super(InitialState());

  static AuthenticationCubit get(context) => BlocProvider.of(context);

  int currentScreen = 0;

  AuthRepo auth = AuthRepoImplementation();

  changeSlider(int value) {
    currentScreen = value;
    emit(ChangeSlider());
  }

  Future<void> signInMethod({
    required String email,
    required String password,
  }) async {
    emit(LoadingSignIn());
    var result = await auth.signIn(email: email, password: password);
    result.fold((failure) {
      emit(ErrorSignIn(failure.errorMessage));
    }, (email) {
      saveEmail(email);
    userEmail = email;
      emit(SuccessSignIn());
    });
  }

  Future<void> signUpMethod({
    required String email,
    required String password,
    required String userName,
  }) async {
    emit(LoadingSignUp());
    var result = await auth.signUp(email: email, password: password, userName: userName);
    result.fold((failure) {
      emit(ErrorSignUp(failure.errorMessage));
    }, (user) async {
      await createUserMethod(userModel: user);
            saveEmail(email);
                userEmail = email;

      emit(SuccessSignUp());
    });
  }

  Future<void> forgotPasswordMethod({
    required String email,
  }) async {
    var result = await auth.forgotPassword(email);
    emit(LoadingForgotPassword());
    result.fold((failure) {
      emit(ErrorForgotPassword(failure.errorMessage));
    }, (unit) {
      emit(SuccessForgotPassword());
    });
  }

  Future<void> createUserMethod({
    required UserModel userModel,
  }) async {
    var result = await auth.createUser(userModel);
    result.fold((failure) {
      emit(ErrorCreateUser(failure.errorMessage));
    }, (unit) {
      emit(SuccessCreateUser());
    });
  }

  Future<void> saveEmail(String email) async {
    await Shared.saveDate(key: 'email', value: email);
  }
}
