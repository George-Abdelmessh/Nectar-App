import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view/screens/home_screen_content.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit(): super(NavBarInitState());

  static NavBarCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreenContent(),
    const Center(
      child: Text('Explore'),
    ),
    const Center(
      child: Text('Cart'),
    ),
    const Center(
      child: Text('Favourite'),
    ),
    const Center(
      child: Text('Account'),
    ),
  ];

  void changeNavBarIndex (int index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

}