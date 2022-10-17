import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:goodfood_mobile/core/failure.dart';
import 'package:goodfood_mobile/domain/entities/user/restaurant.dart';
import 'package:goodfood_mobile/domain/use_cases/get_restaurants_usecase.dart';
import 'package:goodfood_mobile/presentation/common/widgets/custom_app_bar.dart';
import 'package:goodfood_mobile/presentation/common/widgets/restaurant_list.dart';
import 'package:goodfood_mobile/presentation/home/viewmodels/home_screen_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(homeScreenViewModelProvider);
    var restaurantsResult = viewModel.getRestaurants();

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

                    return Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: restaurant?[index].providerImage),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.bold),
                                      restaurant?[index].name ?? 'Inconnu')
                                ],
                              )
                            ]));
                  }));
            }));
  }
}
