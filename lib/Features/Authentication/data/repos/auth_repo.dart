import 'package:dartz/dartz.dart';
import '../../../../Core/errors/failures.dart';
import '../models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> signUp({
    required String email,
    required String password,
    required String userName,
  });
  Future<Either<Failure, String>> signIn({
    required String email,
    required String password,
  });
  Future<Either<Failure, Unit>> forgotPassword(String email);
  Future<Either<Failure, Unit>> createUser(UserModel user);
}
