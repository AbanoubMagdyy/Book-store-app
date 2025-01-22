import 'failures.dart';

class WeakPassword implements Failure {
  @override
  final String errorMessage;

  WeakPassword() : errorMessage = 'The password is too weak.';
}

class NetworkRequestFailed implements Failure {
  @override
  final String errorMessage;

  NetworkRequestFailed()
      : errorMessage = 'There is a problem with your Internet.';
}

class EmailAlreadyInUse implements Failure {
  @override
  final String errorMessage;

  EmailAlreadyInUse() : errorMessage = 'The email is already registered.';
}

class InvalidEmail implements Failure {
  @override
  final String errorMessage;

  InvalidEmail() : errorMessage = 'The email address is invalid.';
}

class UserNotFound implements Failure {
  @override
  final String errorMessage;

  UserNotFound() : errorMessage = 'No user found with this email.';
}

class WrongPassword implements Failure {
  @override
  final String errorMessage;

  WrongPassword() : errorMessage = 'Incorrect password.';
}

class OperationNotAllowed implements Failure {
  @override
  final String errorMessage;

  OperationNotAllowed() : errorMessage = 'Operation not allowed.';
}

class UnknownError implements Failure {
  @override
  final String errorMessage;

  UnknownError() : errorMessage = 'Opps There was an Error, Please try again';
}

final Map<String, Failure> firebaseAuthErrorMap = {
  'weak-password': WeakPassword(),
  'network-request-failed': NetworkRequestFailed(),
  'email-already-in-use': EmailAlreadyInUse(),
  'invalid-email': InvalidEmail(),
  'user-not-found': UserNotFound(),
  'operation-not-allowed': OperationNotAllowed(),
  'wrong-password': WrongPassword(),
};
