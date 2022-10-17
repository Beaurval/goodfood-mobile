import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:goodfood_mobile/core/failure.dart';
import 'package:goodfood_mobile/data/repository/auth_repository_impl.dart';
import 'package:goodfood_mobile/domain/repository/auth_repository.dart';
import 'package:riverpod/riverpod.dart';

var signInUseCaseProvider = Provider<SignInUseCase>(
    (ref) => SignInUseCase(ref.read(authRepositoryProvider)));

class SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  Future<Either<Failure, UserCredential>> execute(
      String email, String password) {
    return _authRepository.signInUser(email, password);
  }
}
