// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';

import 'package:goodfood_mobile/data/api/user_api.dart';
import 'package:goodfood_mobile/data/models/request/create_user_request.dart';
import 'package:goodfood_mobile/domain/entities/user/user_account.dart';

import '../../core/failure.dart';
import '../../domain/repository/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>(
    (ref) => AuthRepositoryImpl(ref.read(userApiProvider)));

class AuthRepositoryImpl implements AuthRepository {
  final UserApi _userApi;

  AuthRepositoryImpl(this._userApi);

  @override
  Future<void> signInUser(String mail, String password) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserAccount>> signUpUser(
      CreateUserRequest user) async {
    var firebaseRegistrationResult =
        await addUserToFirebase(user.email ?? '', user.password ?? '');

    if (firebaseRegistrationResult.isLeft) {
      return Left(firebaseRegistrationResult.left);
    }

    await firebaseRegistrationResult.right.user?.sendEmailVerification();

    try {
      return Right((await _userApi.createUser(user)).toEntity());
    } catch (e) {
      return const Left(Failure(message: 'Server error'));
    }
  }

  Future<Either<Failure, UserCredential>> addUserToFirebase(
      String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return const Left(Failure(message: 'Le mot de passe est trop faible.'));
      } else if (e.code == 'email-already-in-use') {
        return const Left(Failure(message: 'Le mail est déjà utilisé.'));
      }
      return const Left(
          Failure(message: 'Une erreur s\'est produite avec firebase'));
    } catch (e) {
      return const Left(
          Failure(message: 'Une erreur s\'est produite avec firebase'));
    }
  }
}
