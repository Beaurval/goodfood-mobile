// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:goodfood_mobile/presentation/common/widgets/custom_button.dart';

class Error extends StatelessWidget {
  final String message;
  final VoidCallback callback;

  const Error({
    super.key,
    required this.message,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomButton(title: 'Retry', onTap: () => callback)
        ],
      ),
    );
  }
}
