import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goodfood_mobile/core/failure.dart';
import 'package:goodfood_mobile/domain/use_cases/sign_in_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final signInViewModelProvider = ChangeNotifierProvider.autoDispose(((ref) {
  final useCase = ref.watch(signInUseCaseProvider);
  return SignInViewModel(useCase);
}));

class SignInViewModel extends ChangeNotifier {
  final SignInUseCase _useCase;

  SignInViewModel(this._useCase);

  Future<Either<Failure, UserCredential>> signIn(
      String email, String password) async {
    return await _useCase.execute(email, password);
  }

  void showSnackBar(String message, BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
