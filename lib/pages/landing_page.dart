import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/reponsive.dart';
import 'package:saxnpark_app/utils/colors.dart';

import '../bloc/landing/landing_bloc.dart';
import '../commons/bottom_icons.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';
import 'home_page.dart';



class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<BottomNavigationBarItem> bottomNavItems =  <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon:const BottomIcons(name: home),
    activeIcon:const BottomIcons(name: homeActive),
    label: Strings.home,
  ),
  BottomNavigationBarItem(
    icon: const BottomIcons(name: session),
    activeIcon: const BottomIcons(name: sessionActive),
    label: Strings.session,
  ),
  BottomNavigationBarItem(
    icon: const BottomIcons(name: permit),
    activeIcon: const BottomIcons(name: permitActive),
    label: Strings.permit,
  ),
  BottomNavigationBarItem(
    icon: const BottomIcons(name: account),
    activeIcon: const BottomIcons(name: accountActive),
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
          mobile: Container(),
          tablet: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              shadowColor: AppColors.toolbarShadow,
              title: Align(
                alignment: Alignment.bottomCenter,
                child: Text(Strings.home,
                style: const TextStyle(color: Colors.black,
                fontSize: 12.0),),
              )),
            body: contentWidget(state.tabIndex),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColors.bottomNavigationBg,
              type: BottomNavigationBarType.fixed,
              items: bottomNavItems,
              currentIndex: state.tabIndex,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: Colors.white,
              selectedFontSize: 12.0,
              unselectedFontSize: 12.0,
              onTap: (index) {
                BlocProvider.of<LandingBloc>(context)
                    .add(TabChangeEvent(tabIndex: index));
              },
            ),
          ),
        );
      },
    ); 
  }
  
  Widget contentWidget(int tabIndex) {
     if (tabIndex==0) {
       return const HomePage();
     }else if (tabIndex== 1) {
       return Container();
     }else{
      return Center(child: Text(Strings.home));
     }

  }
}