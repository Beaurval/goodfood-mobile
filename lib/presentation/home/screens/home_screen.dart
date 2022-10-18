import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:goodfood_mobile/core/failure.dart';
import 'package:goodfood_mobile/domain/entities/user/restaurant.dart';
import 'package:goodfood_mobile/presentation/common/widgets/custom_app_bar.dart';
import 'package:goodfood_mobile/presentation/home/viewmodels/home_screen_view_model.dart';
import 'package:goodfood_mobile/presentation/restaurant/screens/restaurant_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(homeScreenViewModelProvider);
    return Scaffold(
        appBar: const CustomAppBar(),
        body: FutureBuilder<Either<Failure, List<Restaurant>>>(
            future: viewModel.getRestaurants(),
            builder: (BuildContext context,
                AsyncSnapshot<Either<Failure, List<Restaurant>>> restaurants) {
              return ListView.builder(
                      itemCount: restaurants.data?.right.length,
                      itemBuilder: ((context, index) {
                        var restaurant = restaurants.data?.right;
                        return restaurants.data != null ? ListTile(
                            leading: ClipRRect(
                                borderRadius: BorderRadius.circular(4.0),
                                child: restaurant?[index].providerImage),
                            title: Text(restaurant?[index].name ?? ''),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RestaurantScreen()));
                            }) : null;
                      }));
            }));
  }
}
