import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/pages/accounts_page.dart';
import 'package:saxnpark_app/pages/my_locations.dart';


import '../pages/location_list.dart';
import '../pages/location_page.dart';
import '../utils/colors.dart';
import '../bloc/landing/landing_bloc.dart';
import '../commons/bottom_icons.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';

import 'home_page.dart';
import 'nearme_page.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
 PersistentBottomSheetController? controller;


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<BottomNavigationBarItem> bottomNavItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: const BottomIcons(name: home),
      activeIcon: const BottomIcons(name: homeActive),
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
  late PersistentBottomSheetController _sheetController;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingBloc, LandingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          body: contentWidget(state.tabIndex, state.tabLabel),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.black2,
            type: BottomNavigationBarType.fixed,
            items: bottomNavItems,
            currentIndex: state.tabIndex,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: Colors.white,
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0,
            onTap: (index) {
              if (controller != null) {
    controller?.close();
   // controller = null;
  }
              switch (index) 
              {
                case 0:
                  context.read<LandingBloc>().add(
                      TabChangeEvent(tabIndex: index, tabLabel: Strings.rHome));
                case 1:
                  context.read<LandingBloc>().add(TabChangeEvent(
                      tabIndex: index, tabLabel: Strings.rSession));
                // case 1:  { _scaffoldKey.currentState?.showBottomSheet((_) => Container(
                //     child: showBrandsBottomSheet(),
                //   ))};
                case 2:
                  context.read<LandingBloc>().add(TabChangeEvent(
                      tabIndex: index, tabLabel: Strings.rPermit));
                case 3:
                  context.read<LandingBloc>().add(TabChangeEvent(
                      tabIndex: index, tabLabel: Strings.rAccount));
              }
            },
          ),
        );
      },
    );
  }

  Widget contentWidget(int tabIndex, String tabLabel) {
    print("tabLabel==>${tabLabel}");
    if (tabIndex == 0 && tabLabel == Strings.rHome) 
    {
      return const HomePage();
    } else if (tabIndex == 0 && tabLabel == Strings.rLocationGridList) {
      return const LocationPage();
    } else if (tabIndex == 0 &&
        (tabLabel == Strings.rLocationList ||
            tabLabel == Strings.rNearMeList ||
            tabLabel == Strings.rRecentList ||
            tabLabel == Strings.rLocationSearchList)) {
      return const LocationList();
    } else if (tabIndex == 0 && tabLabel == Strings.rNearMeMapList) {
      return const NearMePage();
    } else if (tabIndex == 1) 
    {
      if(tabLabel == Strings.rMyLocation)
      {
        return const MyLocation();
      }
      else
      {
        return const AccountsPage();
      }
    }
    
     else {
      return Center(child: Text(Strings.home));
    }
  }
}
