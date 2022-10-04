import 'package:either_dart/either.dart';
import 'package:goodfood_mobile/core/failure.dart';
import 'package:goodfood_mobile/data/models/request/create_user_request.dart';
import 'package:goodfood_mobile/data/repository/auth_repository_impl.dart';
import 'package:riverpod/riverpod.dart';

import '../entities/user/user.dart';
import '../repository/auth_repository.dart';

final signUpUserUseCaseProvider = Provider<SignUpUser>(
    ((ref) => SignUpUser(ref.read(authRepositoryProvider))));

class SignUpUser {
  SignUpUser(this._authRepository);

  final AuthRepository _authRepository;

  Future<Either<Failure, User>> execute(CreateUserRequest userRequest,
      String password, String passwordConfirm) async {
    return await _authRepository.signUpUser(
        userRequest, password, passwordConfirm);
  }
}
