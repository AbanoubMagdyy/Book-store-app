import 'package:book_store/Core/errors/failures.dart';

class PermissionDenied implements Failure {
  @override
  final String errorMessage;

  PermissionDenied() : errorMessage = 'The caller does not have permission to execute the specified operation.';
}

class Unavailable implements Failure {
  @override
  final String errorMessage;

  Unavailable() : errorMessage = 'The service is currently unavailable.';
}

class NotFound implements Failure {
  @override
  final String errorMessage;

  NotFound() : errorMessage = 'The requested document was not found.';
}

class AlreadyExists implements Failure {
  @override
  final String errorMessage;

  AlreadyExists() : errorMessage = 'The document already exists.';
}

class Aborted implements Failure {
  @override
  final String errorMessage;

  Aborted() : errorMessage = 'The operation was aborted, typically due to a concurrency issue.';
}

class Cancelled implements Failure {
  @override
  final String errorMessage;

  Cancelled() : errorMessage = 'The operation was cancelled.';
}

class DataLoss implements Failure {
  @override
  final String errorMessage;

  DataLoss() : errorMessage = 'Unrecoverable data loss or corruption.';
}

class DeadlineExceeded implements Failure {
  @override
  final String errorMessage;

  DeadlineExceeded() : errorMessage = 'The deadline expired before the operation could complete.';
}

class Internal implements Failure {
  @override
  final String errorMessage;

  Internal() : errorMessage = 'Internal errors. This means some invariants expected by the underlying system have been broken.';
}

class InvalidArgument implements Failure {
  @override
  final String errorMessage;

  InvalidArgument() : errorMessage = 'Client specified an invalid argument.';
}

class OutOfRange implements Failure {
  @override
  final String errorMessage;

  OutOfRange() : errorMessage = 'Operation was attempted past the valid range.';
}

class ResourceExhausted implements Failure {
  @override
  final String errorMessage;

  ResourceExhausted() : errorMessage = 'Some resource has been exhausted, perhaps a per-user quota, or perhaps the entire file system is out of space.';
}

class Unauthenticated implements Failure {
  @override
  final String errorMessage;

  Unauthenticated() : errorMessage = 'The request does not have valid authentication credentials for the operation.';
}

class Unknown implements Failure {
  @override
  final String errorMessage;

  Unknown() : errorMessage = 'Unknown error occurred.';
}

final Map<String, Failure> firestoreErrorMap = {
  'permission-denied': PermissionDenied(),
  'unavailable': Unavailable(),
  'not-found': NotFound(),
  'already-exists': AlreadyExists(),
  'aborted': Aborted(),
  'cancelled': Cancelled(),
  'data-loss': DataLoss(),
  'deadline-exceeded': DeadlineExceeded(),
  'internal': Internal(),
  'invalid-argument': InvalidArgument(),
  'out-of-range': OutOfRange(),
  'resource-exhausted': ResourceExhausted(),
  'unauthenticated': Unauthenticated(),
  'unknown': Unknown(),
};