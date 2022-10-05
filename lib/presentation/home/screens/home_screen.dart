import 'package:flutter/material.dart';
import 'package:goodfood_mobile/presentation/common/widgets/custom_app_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(appBar: CustomAppBar());
  }
}
