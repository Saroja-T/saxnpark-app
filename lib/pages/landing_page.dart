import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/pages/location_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingBloc, LandingState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return  Scaffold(       
            body: contentWidget(state.tabIndex,state.tabLabel),
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
                switch(index){
                  case 0:  context.read<LandingBloc>().add(TabChangeEvent(tabIndex: index,tabLabel:Strings.home));
                  case 1:  context.read<LandingBloc>().add(TabChangeEvent(tabIndex: index,tabLabel:Strings.session));
                  case 2:  context.read<LandingBloc>().add(TabChangeEvent(tabIndex: index,tabLabel:Strings.permit));
                  case 3:  context.read<LandingBloc>().add(TabChangeEvent(tabIndex: index,tabLabel:Strings.account));
                }
                
              },
            ),
          );
      
      },
    ); 
  }
  
  Widget contentWidget(int tabIndex, String tabLabel) {
    print("tabLabel==>${tabLabel}");
     if (tabIndex==0 && tabLabel==Strings.home){
        return const HomePage();
     }else if (tabIndex==0 && tabLabel==Strings.location){
        return const LocationPage();
     }else if (tabIndex== 1) {
        return Container();
     }else{
        return Center(child: Text(Strings.home));
     }

  }
}