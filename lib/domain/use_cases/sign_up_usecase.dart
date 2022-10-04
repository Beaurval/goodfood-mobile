import 'package:either_dart/either.dart';
import 'package:goodfood_mobile/core/failure.dart';
import 'package:goodfood_mobile/data/models/request/create_user_request.dart';
import 'package:goodfood_mobile/data/repository/auth_repository_impl.dart';
import 'package:riverpod/riverpod.dart';

import '../entities/user/user_account.dart';
import '../repository/auth_repository.dart';

final signUpUserUseCaseProvider = Provider<SignUpUseCase>(
    ((ref) => SignUpUseCase(ref.read(authRepositoryProvider))));

class SignUpUseCase {
  SignUpUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<Either<Failure, UserAccount>> execute(
      CreateUserRequest userRequest) async {
    return await _authRepository.signUpUser(userRequest);
  }
}
