import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/pages/accounts/delete_vehicle.dart';
import 'package:saxnpark_app/pages/accounts/my_details.dart';
import 'package:saxnpark_app/pages/authentication/signout.dart';
import 'package:saxnpark_app/pages/bookings/visitor_booking_confirmation.dart';
import 'package:saxnpark_app/pages/bookings/visitor_booking_details.dart';
import 'package:saxnpark_app/pages/bookings/visitor_screen.dart';

import '../bloc/landing/landing_bloc.dart';
import '../commons/bottom_icons.dart';
import '../pages/bookings/vehicle_type.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';

import 'accounts/accounts_page.dart';
import 'accounts/faq.dart';
import 'accounts/help.dart';
import 'accounts/my_vehicles.dart';
import 'accounts/settings.dart';
import 'bookings/booking_confirmation.dart';
import 'bookings/booking_details.dart';
import 'bookings/parking_time.dart';
import 'bookings/purpose_of_visit.dart';
import 'home_page.dart';
import 'locations/location_list.dart';
import 'locations/location_page.dart';
import 'locations/my_locations.dart';
import 'locations/nearme_page.dart';
import 'permits/add_permit.dart';
import 'permits/my_permits.dart';
import 'permits/permit_driver_details.dart';
import 'permits/update_driver_details.dart';
import 'sessions/my_sessions.dart';
import 'sessions/session_transfer.dart';
import 'drive_account/vehicle_details.dart' as drive_account;

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
 PersistentBottomSheetController? controller;


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
      label: Strings.sessions,
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

  Widget contentWidget(int tabIndex, String tabLabel) {
    if (tabIndex == 0 && tabLabel == Strings.rHome) {
      // return const HomePage();
      return const AccountsPage();
    } else if (tabIndex == 0 && tabLabel == Strings.rLocationGridList) {
      return const LocationPage();
    } else if (tabIndex == 0 && tabLabel == Strings.rPark) {
      return const VehicleType();
    } else if (tabIndex == 0 && (
            tabLabel == Strings.rLocationList ||
            tabLabel == Strings.rLocationListWithoutSelection ||
            tabLabel == Strings.rNearMeList ||
            tabLabel == Strings.rRecentList ||
            tabLabel == Strings.rLocationSearchList)) {
      return const LocationList();
    } else if (tabIndex == 0 && tabLabel == Strings.rNearMeMapList) {
      return const NearMePage();
    }else if (tabIndex == 4 && tabLabel == Strings.rDeleteVehicle){
       return const DeleteVehicle();
    }else if (tabIndex == 4 && tabLabel == Strings.rMyLocation){
       return const MyLocation();
    }else if (tabIndex == 4 && tabLabel == Strings.rMyVehicles){
       return const MyVehicles();
    }else if (tabIndex == 4 && tabLabel == Strings.rMySettings){
       return const Settings();
    }else if(tabIndex == 4 && tabLabel==Strings.rMyDetails){
      return const MyDetails();
    }else if(tabIndex == 4 && tabLabel==Strings.rAccount){
      return const AccountsPage();
    }else if(tabIndex == 4 && tabLabel==Strings.rAddPermit){
      return const AddPermit();
    }else if(tabIndex == 4 && (tabLabel==Strings.rDriversDetails || tabLabel==Strings.rConfirmedDriversDetails)){
      return const PermitDriversDetaills();
    }else if(tabIndex == 4 && tabLabel==Strings.rVehicleDetails){
      return const drive_account.VehicleDetails();
    }else if(tabIndex == 4 && tabLabel==Strings.rUpdateDriverDetails){
      return const UpdateDriverDetails();
    }else if (tabIndex == 1 && tabLabel == Strings.rVehicleType) {
      return const VehicleType();
    }else if (tabIndex == 1 && tabLabel == Strings.rParkTime) {
      return const ParkingTime();
    }else if (tabIndex == 1 && tabLabel == Strings.rBookingDetails) {
      return const BookingPreview();
    }else if (tabIndex == 1 && tabLabel == Strings.rBookingConfirmation) {
      return const BookingConfirmation();
    }else if (tabIndex == 1 && tabLabel == Strings.rVisitorScreen) {
      return const VisitorScreen();
    }else if (tabIndex == 1 && tabLabel == Strings.rVisitorBookingDetails) {
      return const VisitorBookingDetaills();
    }else if (tabIndex == 1 && tabLabel == Strings.rVisitorBookingConfirmation) {
      return const VisitorBookingConfirmation();
    }else if (tabIndex == 1) {
      return const PurposeOfVisit();
    }else if (tabIndex == 4 && tabLabel == Strings.rHelp) {
      return const HelpPage();
    }else if (tabIndex == 4 && tabLabel == Strings.rFaq) {
      return const FAQPage();
    }else if(tabIndex == 2 && tabLabel == Strings.rSessionTransfer){
      return const SessionTransfer();
    }else if (tabIndex == 2 && tabLabel == Strings.rSession) {
     // return const MySessions();
      return const SignOut();
    }else if(tabIndex == 3 && tabLabel == Strings.rPermit){
      return const MyPermits();
    }
    else{
      return Center(child: Text(Strings.home));
    }
  }
  
  onBackPressed(int tabIndex) {
    if(tabIndex!=0){
      context.read<LandingBloc>().add(TabChangeEvent(
                        tabIndex:0, tabLabel: Strings.rHome));
    }else{
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }
}
