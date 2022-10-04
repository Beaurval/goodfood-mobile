// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:either_dart/either.dart';
import 'package:riverpod/riverpod.dart';

import 'package:goodfood_mobile/data/api/user_api.dart';
import 'package:goodfood_mobile/data/models/request/create_user_request.dart';
import 'package:goodfood_mobile/domain/entities/user/user.dart';

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
  Future<Either<Failure, User>> signUpUser(
      CreateUserRequest user, String password, String passwordConfirm) async {
    try {
      return Right((await _userApi.createUser(user)).toEntity());
    } catch (e) {
      return const Left(Failure(message: 'Server error'));
    }
  }
}
