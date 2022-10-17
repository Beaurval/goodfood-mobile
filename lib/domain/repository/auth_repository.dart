import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goodfood_mobile/core/failure.dart';
import 'package:goodfood_mobile/data/models/request/create_user_request.dart';

import '../entities/user/user_account.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserAccount>> signUpUser(CreateUserRequest user);

  Future<Either<Failure, UserCredential>> signInUser(
      String mail, String password);
}
