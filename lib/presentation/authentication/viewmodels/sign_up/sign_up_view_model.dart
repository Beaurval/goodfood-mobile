import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:goodfood_mobile/core/failure.dart';
import 'package:goodfood_mobile/data/models/request/create_user_request.dart';
import 'package:goodfood_mobile/domain/entities/user/user_account.dart';
import 'package:goodfood_mobile/domain/use_cases/sign_up_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final signUpViewModelProvider = ChangeNotifierProvider.autoDispose(((ref) {
  final useCase = ref.watch(signUpUserUseCaseProvider);
  return SignUpViewModel(useCase);
}));

class SignUpViewModel extends ChangeNotifier {
  final SignUpUseCase _signUpUser;

  SignUpViewModel(this._signUpUser);

  Future<Either<Failure, UserAccount>> signUp(
      CreateUserRequest userRequest) async {
    Either<Failure, UserAccount> singUpResult =
        await _signUpUser.execute(userRequest);

    if (singUpResult.isLeft) {
      return Left(singUpResult.left);
    }

    return Right(singUpResult.right);
  }

  void showSnackBar(String message, BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
