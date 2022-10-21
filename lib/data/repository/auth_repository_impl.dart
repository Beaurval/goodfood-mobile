// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goodfood_mobile/data/models/request/create_user_with_role_request.dart';
import 'package:goodfood_mobile/data/models/response/user_response.dart';
import 'package:riverpod/riverpod.dart';

import 'package:goodfood_mobile/data/api/user_api.dart';
import 'package:goodfood_mobile/data/models/request/create_user_request.dart';
import 'package:goodfood_mobile/domain/entities/user/user_account.dart';

import '../../core/failure.dart';
import '../../domain/repository/auth_repository.dart';
import '../models/response/create_user__with_role_response.dart';

final authRepositoryProvider = Provider<AuthRepository>(
    (ref) => AuthRepositoryImpl(ref.read(userApiProvider)));

class AuthRepositoryImpl implements AuthRepository {
  final UserApi _userApi;

  AuthRepositoryImpl(this._userApi);

  @override
  Future<Either<Failure, UserCredential>> signInUser(
      String mail, String password) async {
    if (mail.isEmpty || password.isEmpty) {
      return const Left(Failure(message: 'Veuillez remplir les champs.'));
    }

    try {
      var signInResult = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail, password: password);
      if (signInResult.user?.emailVerified ?? true) {
        return Right(signInResult);
      }
      return const Left(Failure(message: "Veuillez vérifier votre email."));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Left(Failure(message: 'Ce compte n\'existe pas.'));
      } else if (e.code == 'wrong-password') {
        return const Left(Failure(message: 'Mot de passe incorrect.'));
      } else if (e.code == 'invalid-email') {
        return const Left(Failure(message: 'Veuillez saisir un email valide.'));
      }
    }

    return const Left(Failure(message: 'Une erreur s\'est produite'));
  }

  @override
  Future<Either<Failure, UserAccount>> signUpUser(
      CreateUserRequest user) async {
    if ((user.passwordConfirmation != user.password) ||
        (user.password?.isEmpty ?? true) ||
        (user.passwordConfirmation?.isEmpty ?? true)) {
      return const Left(
          Failure(message: 'Les mots de passes ne correspondent pas'));
    }
    if (user.email?.isEmpty ?? true) {
      return const Left(Failure(message: 'Veuillez renseigner un email'));
    }

    var firebaseRegistrationResult =
        await addUserToFirebase(user.email ?? '', user.password ?? '');

    if (firebaseRegistrationResult.isLeft) {
      return Left(firebaseRegistrationResult.left);
    }

    await firebaseRegistrationResult.right.user?.sendEmailVerification();

    try {
      return Right((await _userApi.createUser(
              user, firebaseRegistrationResult.right.user!.uid))
          .toEntity());
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
      if (e.code == 'invalid-email') {
        return const Left(Failure(message: 'L\'email n\'est pas valide'));
      }
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

  @override
  Future<Failure?> createUserWithRole(CreateUserWithRoleRequest model) async {
    CreateUserWithRoleResponse userResponse;
    try {
      userResponse = await _userApi.createUserWithRole(model);
    } on Failure catch (err) {
      return err;
    }
    var a = 1;
    if (model.email != null && userResponse.password != null) {
      var newUser = CreateUserRequest(
          email: model.email,
          firstName: model.firstName,
          lastName: model.lastName,
          password: userResponse.password,
          passwordConfirmation: userResponse.password,
          phoneNumber: model.phoneNumber,
          roleId: model.roleId);

      var singUpResult = await signUpUser(newUser);

      if (singUpResult.isLeft) {
        return singUpResult.left;
      }
    }
    return null;
  }
}
