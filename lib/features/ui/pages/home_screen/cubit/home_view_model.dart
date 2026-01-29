import 'package:e_commerce/features/ui/pages/home_screen/cubit/home_states.dart';
import 'package:e_commerce/features/ui/pages/home_screen/taps/categories_tap/category_tap_.dart';
import 'package:e_commerce/features/ui/pages/home_screen/taps/favorate_tap/favorate_tap.dart';
import 'package:e_commerce/features/ui/pages/home_screen/taps/home_tap/home_tap.dart';
import 'package:e_commerce/features/ui/pages/home_screen/taps/pofile_tap/profile_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel() : super(InitialState());
  int selectedIndex = 0;

  List<Widget> homeTaps = [
    HomeTap(),
    CategoryTap(),
    FavorateTap(),
    ProfileTap(),
  ];
  pageChange(int index) {
    selectedIndex = index;
    emit(PageChanged());
  }
}
