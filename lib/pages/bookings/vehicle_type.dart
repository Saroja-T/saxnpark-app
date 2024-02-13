import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/bottomsheets/location_details.dart';
import 'package:saxnpark_app/bottomsheets/my_locations.dart';
import 'package:saxnpark_app/pages/landing_page.dart';
import 'package:saxnpark_app/utils/colors.dart';
import 'package:saxnpark_app/utils/custom_widgets.dart';
import 'package:clipboard/clipboard.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/constants.dart';
import '../../utils/notification_banner.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class VehicleType extends StatefulWidget {
  const VehicleType({super.key});
  @override
  State<VehicleType> createState() => _VehicleTypeState();
}

class _VehicleTypeState extends State<VehicleType> {
  var searchedText;
  bool countrySelected = false;
  var selectedIndex = 0;
  bool inCorrectSearch = true;
  bool starSelected = false;
  String tabLabel = "";
  List<VehicleDetails> vehicleDetails = [
    VehicleDetails(
        vehicleName: Strings.dummyvehicle1,
        vehicleCategory: Strings.dummyCategory1),
    VehicleDetails(
        vehicleCategory: Strings.dummyCategoey2,
        vehicleName: Strings.dummyvehicle2)
  ];

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    return Scaffold(
      appBar: CustomAppBarWithBack(
        title: Strings.bookingDetails,
        backText: Strings.back,
        redirectionKey: Strings.rPurpose,
        tabIndex: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(Strings.isMaxVehicle || Strings.isMinVehicle)
              NotificationBanner(
                      message: Strings.isMaxVehicle?Strings.maxVehicle:Strings.minVehicle,
                      isCancelAvailable: true,
                      isErrorMsg: true,
                      onCancel: () {
                        setState(() {
                          if(Strings.isMaxVehicle){
                            Strings.isMaxVehicle = false;
                          }else if(Strings.isMinVehicle){
                            Strings.isMinVehicle = false;
                          }
                        });
                      },
                    ),
              if(Strings.isMaxVehicle)
              const SizedBox(height: 15,),
              Text(
                Strings.visitVehicle,
                style:
                    customTextStyle(20, FontWeight.w500, AppColors.black1, 1),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) => InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              border: Border.all(
                                  color: selectedIndex == index
                                      ? AppColors.black1
                                      : AppColors.grey4)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(selectedIndex == index
                                          ? radioSelected
                                          : radioUnselected),
                                      const SizedBox(width: 16),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            vehicleDetails[index].vehicleName!,
                                            style: customTextStyle(
                                                16,
                                                FontWeight.w400,
                                                AppColors.black6,
                                                1),
                                          ),
                                          Text(
                                            vehicleDetails[index]
                                                .vehicleCategory!,
                                            style: customTextStyle(
                                                14,
                                                FontWeight.w400,
                                                AppColors.grey6,
                                                1.5),
                                          ),
                                        ],
                                      )
                                      // Text(Strings.myDetails,style: customTextStyle(16, FontWeight.w400, AppColors.black6, 1),),
                                    ],
                                  ),
                                  if (index == 0)
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.delete_outline_rounded))
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: AppColors.grey4)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(add),
                        const SizedBox(width: 16),
                        Text(
                          Strings.addVehicle,
                          style: customTextStyle(
                              14, FontWeight.w400, AppColors.black6, 1),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 51,
                child: SizedBox.expand(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.black6),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ))),
                      onPressed: () {
                        print("identity ${Strings.identity}");
                        if (Strings.identity == self) {
                          context.read<LandingBloc>().add(TabChangeEvent(
                              tabIndex: 1, tabLabel: Strings.rParkTime));
                        } else {
                          context.read<LandingBloc>().add(TabChangeEvent(
                              tabIndex: 1,
                              tabLabel: Strings.rVisitorBookingDetails));
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Strings.next,
                            style: customTextStyle(
                                14, FontWeight.w600, AppColors.white, 1),
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VehicleDetails {
  String? vehicleName;
  String? vehicleCategory;
  VehicleDetails({required this.vehicleName, required this.vehicleCategory});
}

