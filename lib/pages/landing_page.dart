import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/reponsive.dart';
import 'package:saxnpark_app/utils/colors.dart';

import '../bloc/landing/landing_bloc.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';



class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<BottomNavigationBarItem> bottomNavItems =  <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Image.asset(home),
    activeIcon: Image.asset(homeActive),
    label: Strings.home,
  ),
  BottomNavigationBarItem(
    icon: Image.asset(session),
    activeIcon: Image.asset(sessionActive),
    label: Strings.session,
  ),
  BottomNavigationBarItem(
    icon: Image.asset(permit),
    activeIcon: Image.asset(permitActive),
    label: Strings.permit,
  ),
  BottomNavigationBarItem(
    icon: Image.asset(account),
    activeIcon: Image.asset(accountActive),
    label: Strings.account,
  ),
];

 List<Widget> bottomNavScreen = <Widget>[
  const Text('Index 0: Home'),
  const Text('Index 1: Category'),
  const Text('Index 2: Search'),
  const Text('Index 3: Favourite'),
  const Text('Index 4: Cart'),
];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingBloc, LandingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Responsive(
          tablet: Container(),
          mobile: Scaffold(
            body: Center(child: bottomNavScreen.elementAt(state.tabIndex)),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColors.bottomNavigationBg,
              type: BottomNavigationBarType.fixed,
              items: bottomNavItems,
              currentIndex: state.tabIndex,
              unselectedLabelStyle: const TextStyle(fontFamily: 'PublicSans'),
              selectedItemColor: AppColors.primary,
              unselectedItemColor: Colors.white,
              selectedFontSize: 12.0,
              unselectedFontSize: 12.0,
              onTap: (index) {
                print('LandingPage(Index: $index)');
                BlocProvider.of<LandingBloc>(context)
                    .add(TabChangeEvent(tabIndex: index));
              },
            ),
          ),
        );
      },
    ); 
  }
}