abstract class AuthenticationStates {}

class InitialState extends AuthenticationStates {}

class ChangeSlider extends AuthenticationStates {}

class LoadingSignIn extends AuthenticationStates {}

class SuccessSignIn extends AuthenticationStates {}

class ErrorSignIn extends AuthenticationStates {
  final String error;

  ErrorSignIn(this.error);
}

class LoadingSignUp extends AuthenticationStates {}

class SuccessSignUp extends AuthenticationStates {}

class ErrorSignUp extends AuthenticationStates {
  String error;
  ErrorSignUp(this.error);
}

class LoadingForgotPassword extends AuthenticationStates {}

class SuccessForgotPassword extends AuthenticationStates {}

class ErrorForgotPassword extends AuthenticationStates {

  String error;
  ErrorForgotPassword(this.error);
}


class SuccessCreateUser extends AuthenticationStates {}

class ErrorCreateUser extends AuthenticationStates {
  String error;
  ErrorCreateUser(this.error);
}