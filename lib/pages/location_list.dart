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

  
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
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
                                icon: Image.asset(gridSelectedIcon,width: 35,)),
                          ),
                          SizedBox(
                            width: 35,
                            height: 40,
                            child: IconButton(
                                onPressed: () {
                                  print("cllcik");
                                  showBottomSheet(context);
                                }, icon: Image.asset(listIcon,width: 24,)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 91.0,
                      height: 34.0,
                      margin: const EdgeInsets.only(right: 16),
                      child: TextButton.icon(
                        style: locationActiveElatedBtnStyle,
                        onPressed: () {},
                        icon: Image.asset(
                          nearMe,
                          width: 12.0,
                          height: 12.0,
                          color: AppColors.white,
                        ),
                        label: Text(
                          Strings.nearMe,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: 91.0,
                      height: 34.0,
                      margin: const EdgeInsets.only(right: 16),
                      child: TextButton.icon(
                        style: locationInActiveElatedBtnStyle,
                        onPressed: () {},
                        icon: Image.asset(recent, width: 12.0, height: 12.0),
                        label: Text(
                          Strings.recent,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black5),
                        ),
                      ),
                    ),
                  ],
                ),
            ),
            countrySelected ? Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(children: [
                Text(Strings.newYork,style: customTextStyle(20, FontWeight.w500, AppColors.black1, 0),),
                Text(Strings.countryCount,style: customTextStyle(14, FontWeight.w400, AppColors.black4, 1.5),)
              ],),
            ):SizedBox(),
            inCorrectSearch ? Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(children: [
                Text(Strings.incorrectSearchText,style: customTextStyle(14, FontWeight.w400, AppColors.black3, 0),),
              ],),
            ):SizedBox(),
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
                      child: locationCards()
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
  showBottomSheet(context) 
{
    return showModalBottomSheet<void>(
            // context and builder are
            // required properties in this widget
            context: context,
     isScrollControlled: true,
     useRootNavigator: true,
            builder: (BuildContext context) {
              return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState ) 
          {
              return Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child:  Center(
                    child: Column(
                      children:  <Widget>[
                        Container(
                          height: 48,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            child: Stack(

                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextButton(
                                    child: Text(Strings.buttonCloseText, style: TextStyle(
                                    color: AppColors.black5,fontSize: 12.0,fontWeight: FontWeight.w400)),
                                    onPressed:(){
                                      Navigator.pop(context);
                                    }
                                 )
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    Strings.carParkTitle,
                                  style: TextStyle(
                                    color: AppColors.black2,fontSize: 12.0,fontWeight: FontWeight.w600),),
                                ),
                              ],
                            ),
                            
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(16,24,16,0),
                          child: Column(
                            children: [
                              Container(
                                child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(Strings.locationDetailTitle,
                                          style: customTextStyle(
                                              18.0,
                                              FontWeight.w600,
                                              AppColors.black1,
                                              0)),
                                      InkWell(
                                        child: Image.asset(starSelected?selectedStar:star),onTap: (){
                                          setModalState(() {
                                            print("clicked $starSelected");
                                            starSelected = !starSelected;
                                          });
                                        },)
                                    ],
                                  ),
                                  Text(Strings.locationDetailAddress,
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w400,
                                        AppColors.black5,
                                        1.5)),
                                        Row(
                                          children: [
                                            Text(Strings.operatorText,
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w400,
                                        AppColors.black5,
                                        1.5)),
                                            Text(Strings.operatorTitle,
                                    style: customTextStyle(
                                            14.0,
                                            FontWeight.w400,
                                            AppColors.black5,
                                            1.5)),
                                          ],
                                        ),
                                  ]),
                              ),
                              SizedBox(height: 12,),
                              Container
                              (
                        // height: 157,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Strings.daysandTimesText,
                                style: customTextStyle(
                                    16.0,
                                    FontWeight.w600,
                                    AppColors.black1,
                                    0)),
                            
                           Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.weekDayText,
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w400,
                                        AppColors.black5,
                                        1.5)),
                                Text("09:00 - 22:00",
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w600,
                                        AppColors.black5,
                                        1.5)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.weekEndText,
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w400,
                                        AppColors.black5,
                                        1.5)),
                                Text("11:00 - 18:00",
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w600,
                                        AppColors.black5,
                                        1.5)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.weekEndText,
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w400,
                                        AppColors.black5,
                                        1.5)),
                                Text("FREE",
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w600,
                                        AppColors.black5,
                                        1.5)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.timeFrequencyText,
                                    style: customTextStyle(14.0,
                                        FontWeight.w400, AppColors.black5, 1.5)),
                                Text('\$0.14',
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w600,
                                        AppColors.black5,
                                        1.5)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.oneHourText,
                                    style: customTextStyle(14.0,
                                        FontWeight.w400, AppColors.black5, 1.5)),
                                Text("\$1.40",
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w600,
                                        AppColors.black5,
                                        1.5)),
                              ],
                            )
                            
                          ],
                        ),
                      ),
                              SizedBox(height: 12,),
                              Container
                              (
                        // height: 157,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Strings.policiesText,
                                style: customTextStyle(
                                    16.0,
                                    FontWeight.w600,
                                    AppColors.black1,
                                    0)),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.minimumStay,
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w400,
                                        AppColors.black5,
                                        1.5)),
                                Text(Strings.temMinText,
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w600,
                                        AppColors.black5,
                                        1.5)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.noReturnwithin,
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w400,
                                        AppColors.black5,
                                        1.5)),
                                Text(Strings.thirtyMinText,
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w600,
                                        AppColors.black5,
                                        1.5)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.extentable,
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w400,
                                        AppColors.black5,
                                        1.5)),
                                Text(Strings.extentableText,
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w600,
                                        AppColors.black5,
                                        1.5)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.minCancellationTime,
                                    style: customTextStyle(14.0,
                                        FontWeight.w400, AppColors.black5, 1.5)),
                                Text(Strings.cancellationText,
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w600,
                                        AppColors.black5,
                                        1.5)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.depGap,
                                    style: customTextStyle(14.0,
                                        FontWeight.w400, AppColors.black5, 1.5)),
                                Text(Strings.fiveMinText,
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w600,
                                        AppColors.black5,
                                        1.5)),
                              ],
                            )
                          ],
                        ),
                      ),

                      SizedBox(height: 12,),
                              Container
                              (
                        // height: 157,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Strings.notesText,
                                style: customTextStyle(
                                    16.0,
                                    FontWeight.w600,
                                    AppColors.black1,
                                    0)),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.notes,
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w400,
                                        AppColors.black5,
                                        1.5)),
                              ],
                            ),
                            
                          ],
                        ),
                      ),
                      SizedBox(height: 12,),
                              Container
                              (
                        // height: 157,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Strings.aboutLocation,
                                style: customTextStyle(
                                    16.0,
                                    FontWeight.w600,
                                    AppColors.black1,
                                    0)),
                            
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.permittedVehicles,
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w400,
                                        AppColors.black5,
                                        1.5)),
                                Text(Strings.anyText,
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w600,
                                        AppColors.black5,
                                        1.5)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.locType,
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w400,
                                        AppColors.black5,
                                        1.5)),
                                Text(Strings.carParkText,
                                    style: customTextStyle(
                                        14.0,
                                        FontWeight.w600,
                                        AppColors.black5,
                                        1.5)),
                              ],
                            ),
                          ],
                        ),
                      )
                            ],
                          ),
                        ),

                        
                      ],
                    ),
                  ),
                ),
              );});});
  }
}




