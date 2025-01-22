import 'package:book_store/Core/errors/failures.dart';
import 'package:book_store/Core/errors/firebase_auth_exceptions.dart';
import 'package:book_store/Core/errors/firebase_firestore_exceptions.dart';
import 'package:book_store/Features/Authentication/data/models/user_model.dart';
import 'package:book_store/Features/Authentication/data/repos/auth_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImplementation implements AuthRepo {
  @override
  Future<Either<Failure, UserModel>> signUp({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return right(UserModel(name: userName, email: email));
    } on FirebaseAuthException catch (e) {
      return left(firebaseAuthErrorMap[e.code] ?? UnknownError());
    } catch (e) {
      return left(UnknownError());
    }
  }

  @override
  Future<Either<Failure, String>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return right(email);
    } on FirebaseAuthException catch (e) {
      return left(firebaseAuthErrorMap[e.code] ?? UnknownError());
    } catch (e) {
      return left(UnknownError());
    }
  }

  @override
  Future<Either<Failure, Unit>> forgotPassword(
    String email,
  ) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(firebaseAuthErrorMap[e.code] ?? UnknownError());
    } catch (e) {
      return left(UnknownError());
    }
  }

  @override
  Future<Either<Failure, Unit>> createUser(
    UserModel user,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.email)
          .set(UserModel(name: user.name, email: user.email).toMap());
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(firestoreErrorMap[e.code] ?? Unknown());
    } catch (e) {
      return left(Unknown());
    }
  }
}
