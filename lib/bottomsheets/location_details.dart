import 'package:flutter/material.dart';
import 'package:saxnpark_app/pages/landing_page.dart';
import 'package:saxnpark_app/utils/colors.dart';
import 'package:saxnpark_app/utils/constants.dart';
import 'package:saxnpark_app/utils/strings.dart';
import 'package:saxnpark_app/utils/styles.dart';




showLocationBottomSheet(context,starSelected) 
{
  
  controller = scaffoldKey.currentState!.showBottomSheet((_) => Container(
                        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) 
          {
              return Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child:  Center(
                    child: Column(
                      children:  <Widget>[
                        SizedBox(
                          height: 48,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
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
                        Container(
                          height: 1,
                          color: AppColors.grey4,
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(16,24,16,0),
                          child: Column(
                            children: [
                              Column(
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
                              const SizedBox(height: 12,),
                              Column(
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

                      const SizedBox(height: 12,),
                              Column(
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
              );
              }),
                      ));
    
  }