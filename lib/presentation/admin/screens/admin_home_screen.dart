import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:goodfood_mobile/presentation/admin/screens/add_user_screen.dart';
import 'package:goodfood_mobile/presentation/admin/widgets/custom_list_item.dart';
import 'package:goodfood_mobile/presentation/common/widgets/custom_app_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdminHomeScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Espace administration'),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          CustomListItem(
              route: AddUserScreen(),
              icon: Icon(
                Icons.person_add,
                color: Colors.white,
                size: 24.0,
              ))
        ],
      ),
    );
  }
}
