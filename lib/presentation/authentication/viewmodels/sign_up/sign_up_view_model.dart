import 'package:flutter/cupertino.dart';
import 'package:goodfood_mobile/data/models/request/create_user_request.dart';
import 'package:goodfood_mobile/domain/use_cases/sign_up_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';

final signUpViewModelProvider = ChangeNotifierProvider.autoDispose(((ref) {
  final useCase = ref.watch(signUpUserUseCaseProvider);
  return SignUpViewModel(useCase);
}));

class SignUpViewModel extends ChangeNotifier {
  final SignUpUser _signUpUser;

  SignUpViewModel(this._signUpUser);

  void signUp(CreateUserRequest userRequest) async {
    await _signUpUser.execute(userRequest);
  }
}
