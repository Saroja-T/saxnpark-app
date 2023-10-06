import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/utils/colors.dart';
import 'package:saxnpark_app/utils/custom_widgets.dart';

import '../bloc/landing/landing_bloc.dart';
import '../commons/custom_app_bar.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class LocationList extends StatefulWidget {
  const LocationList({super.key});
  @override
  State<LocationList> createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  var searchedText;
  bool _showModal = false;
  late PersistentBottomSheetController _bottomSheetController;
  bool countrySelected = false;
  bool inCorrectSearch = true;
  bool starSelected = false;
  String tabLabel = "";

  
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    return Scaffold(
      appBar: CustomAppBar(title: Strings.location),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 36,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              borderSide: BorderSide.none),
                          prefixIcon: Image.asset(searchIcon),
                          filled: true,
                          fillColor: const Color.fromRGBO(239, 239, 239, 1),
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(96, 96, 96, 1),
                              fontSize: 14.0),
                          hintText: Strings.locationHint,
                        ),
                        onChanged: (text) {
                          setState(() {
                            searchedText = text;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            
            Padding(
              padding:  EdgeInsets.fromLTRB(16, 0, 16, 0),
              child:Row(
                  children: [
                    if(tabLabel==Strings.rNearMeList || tabLabel==Strings.rNearMeMapList)
                    Container(
                      width: 80,
                      height: 34,
                      margin:  EdgeInsets.only(right:12),
                      decoration:  BoxDecoration(
                        color: AppColors.grey4,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(gridIcon,width: 35,)),
                          ),
                          SizedBox(
                            width: 35,
                            height: 40,
                            child: IconButton(
                                onPressed: () {
                                  print("cllcik");
                                }, icon: Image.asset(tabLabel==Strings.rNearMeList?listSelectedIcon:listIcon,width: 24,)),
                          ),
                        ],
                      ),
                    ),
                    
                    Container(
                      width: 91.0,
                      height: 34.0,
                      margin: const EdgeInsets.only(right: 16),
                      child: TextButton.icon(
                        style: tabLabel==Strings.rNearMeList?locationActiveElatedBtnStyle:locationInActiveElatedBtnStyle,
                        onPressed: () {
                            context.read<LandingBloc>().add(TabChangeEvent(
                            tabIndex: 0, tabLabel: Strings.rNearMeMapList));
                        },
                        icon: Image.asset(
                          nearMe,
                          width: 12.0,
                          height: 12.0,
                          color: tabLabel==Strings.rNearMeList?AppColors.white:AppColors.black5,
                        ),
                        label: Text(
                          Strings.nearMe,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: tabLabel==Strings.rNearMeList?AppColors.white:AppColors.black5),
                        ),
                      ),
                    ),
                    Container(
                      width: 91.0,
                      height: 34.0,
                      margin: const EdgeInsets.only(right: 16),
                      child: TextButton.icon(
                        style: tabLabel==Strings.rRecentList?locationActiveElatedBtnStyle:locationInActiveElatedBtnStyle,
                        onPressed: () {
                           context.read<LandingBloc>().add(TabChangeEvent(
                            tabIndex: 0, tabLabel: Strings.rRecentList));
                        },
                        icon: Image.asset(recent, width: 12.0, height: 12.0, 
                        color: tabLabel==Strings.rRecentList?AppColors.white:AppColors.black5,),
                        label: Text(
                          Strings.recent,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: tabLabel==Strings.rRecentList?AppColors.white:AppColors.black5),
                        ),
                      ),
                    ),
                  ],
                ),
            ),
            if(tabLabel==Strings.rLocationList)
             Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(children: [
                Text(Strings.newYork,style: customTextStyle(20, FontWeight.w500, AppColors.black1, 0),),
                Text(Strings.countryCount,style: customTextStyle(14, FontWeight.w400, AppColors.black4, 1.5),)
              ],),
            ),
            if(tabLabel==Strings.rLocationSearchList)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(children: [
                Text(Strings.incorrectSearchText,style: customTextStyle(14, FontWeight.w400, AppColors.black3, 0),),
              ],),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // context.read<LandingBloc>().add(TabChangeEvent(
                        //     tabIndex: 0, tabLabel: Strings.location));
                        print("clicked");
                      },
                      child: LocationCards(btnClick: (){
                        showLocationBottomSheet(context, starSelected);
                      },)
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
  




