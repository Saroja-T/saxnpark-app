import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/pages/accounts_page.dart';
import 'package:saxnpark_app/pages/bookings/booking_details.dart';
import 'package:saxnpark_app/pages/bookings/parking_time.dart';
import 'package:saxnpark_app/pages/bookings/purpose_of_visit.dart';
import 'package:saxnpark_app/pages/bookings/vehicle_type.dart';
import 'package:saxnpark_app/pages/bookings/visitor_booking_confirmation.dart';
import 'package:saxnpark_app/pages/bookings/visitor_booking_details.dart';
import 'package:saxnpark_app/pages/bookings/visitor_screen.dart';
import 'package:saxnpark_app/pages/my_locations.dart';


import '../pages/location_list.dart';
import '../pages/location_page.dart';
import '../utils/colors.dart';
import '../bloc/landing/landing_bloc.dart';
import '../commons/bottom_icons.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';

import 'bookings/booking_confirmation.dart';
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
  
 
  late PersistentBottomSheetController _sheetController;
  @override
  Widget build(BuildContext context) {
     List<BottomNavigationBarItem> bottomNavItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: const BottomIcons(name: home),
      activeIcon: const BottomIcons(name: homeActive),
      label: Strings.home,
      //label: context.watch<LandingBloc>().state.tabLabel==Strings.rPark?Strings.rPark:Strings.home,
    ),
    BottomNavigationBarItem(
      icon: const BottomIcons(name: home),
      activeIcon: const BottomIcons(name: homeActive),
      label: Strings.rPark,
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
                      tabIndex: index, tabLabel: Strings.rPark));
                case 2:
                  context.read<LandingBloc>().add(TabChangeEvent(
                      tabIndex: index, tabLabel: Strings.rSession));
                // case 1:  { _scaffoldKey.currentState?.showBottomSheet((_) => Container(
                //     child: showBrandsBottomSheet(),
                //   ))};
                case 3:
                  context.read<LandingBloc>().add(TabChangeEvent(
                      tabIndex: index, tabLabel: Strings.rPermit));
                case 4:
                  context.read<LandingBloc>().add(TabChangeEvent(
                      tabIndex: index, tabLabel: Strings.rAccount));
                
              }
            },
          ),
        );
      },
    );
  }

  Widget contentWidget(int tabIndex, String tabLabel) 
  {
    if (tabIndex == 0 && tabLabel == Strings.rHome) {
      return const HomePage();
    } else if (tabIndex == 0 && tabLabel == Strings.rLocationGridList) {
      return const LocationPage();
    }else if (tabIndex == 0 && tabLabel == Strings.rPark) {
      return const VehicleType();
    } else if (tabIndex == 0 &&
        (tabLabel == Strings.rLocationList ||
            tabLabel == Strings.rNearMeList ||
            tabLabel == Strings.rRecentList ||
            tabLabel == Strings.rLocationSearchList)) {
      return const LocationList();
    } else if (tabIndex == 0 && tabLabel == Strings.rNearMeMapList) {
      return const NearMePage();
    }else if (tabIndex == 4 && tabLabel == Strings.rMyLocation){
       return const MyLocation();
    }else if(tabIndex == 4 && tabLabel==Strings.rAccount){
      return const AccountsPage();
    }
    else if (tabIndex == 1 && tabLabel == Strings.rVehicleType) {
      return const VehicleType();
    }
    else if (tabIndex == 1 && tabLabel == Strings.rParkTime) {
      return const ParkingTime();
    }
    else if (tabIndex == 1 && tabLabel == Strings.rBookingDetails) {
      return const BookingPreview();
    }else if (tabIndex == 1 && tabLabel == Strings.rBookingConfirmation) {
      return const BookingConfirmation();
    }
    else if (tabIndex == 1) {
      return const PurposeOfVisit();
    }
    else if (tabIndex == 1) {
      return const PurposeOfVisit();
    }
    else 
    {
      return Center(child: Text(Strings.home));
    }
  }
}
