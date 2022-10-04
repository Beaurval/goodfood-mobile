import 'package:either_dart/either.dart';
import 'package:goodfood_mobile/core/failure.dart';
import 'package:goodfood_mobile/data/models/request/create_user_request.dart';

import '../entities/user/user_account.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserAccount>> signUpUser(CreateUserRequest user);

  Future<void> signInUser(String mail, String password);
}
