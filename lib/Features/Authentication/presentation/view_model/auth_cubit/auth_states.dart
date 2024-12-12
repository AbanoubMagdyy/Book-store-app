abstract class AuthenticationStates {}

class InitialState extends AuthenticationStates {}

class ChangeSlider extends AuthenticationStates {}

class ChangeVisibility extends AuthenticationStates {}

class LoadingSignIn extends AuthenticationStates {}

class SuccessSignIn extends AuthenticationStates {}

class ErrorSignIn extends AuthenticationStates {}

class LoadingSignUp extends AuthenticationStates {}

class SuccessSignUp extends AuthenticationStates {}

class ErrorSignUP extends AuthenticationStates {
  String error;
  ErrorSignUP(this.error);
}

class LoadingForgotPassword extends AuthenticationStates {}

class SuccessForgotPassword extends AuthenticationStates {}

class ErrorForgotPassword extends AuthenticationStates {}
