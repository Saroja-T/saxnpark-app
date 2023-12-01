import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../bottomsheets/list_view_bottom_sheet.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/custom_widgets.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';


class UpdateDriverDetails extends StatefulWidget {
  const UpdateDriverDetails({super.key});
  @override
  State<UpdateDriverDetails> createState() => _UpdateDriverDetailsState();
}

class _UpdateDriverDetailsState extends State<UpdateDriverDetails> {
  final TextEditingController driverNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController vehicleMakeController = TextEditingController();
  final TextEditingController vehicleTypeController = TextEditingController();
  final TextEditingController vehicleRegistrationController = TextEditingController();

  //validations varialbles
  bool isNameEntered = false;
  bool isNameWithinLimit = false;
  bool isVehicleMakeEnterd = false;
  bool isVehicleTypeEntered = false;

  List<String> titleList = ["Mr", "Mrs", "Ms", "Miss"];
  List<String> countryList = [
    "United States",
    "United Kingtom",
    "United Arab Emirates",
    "Country",
    "Country",
    "Country",
    "Country",
    "Country",
    "Country",
    "Country"
  ];
  String selectedTitle = "";

  @override
  void initState() {
    selectedTitle = titleList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return BlocConsumer<LandingBloc, LandingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: CustomAppBarWithBack(title: Strings.driversDetails,backText: Strings.buttonCloseText,tabIndex: 4,redirectionKey: Strings.rDriversDetails,),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      driverAccountCreationLabel(Strings.driversName, h),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            border: Border.all(color: AppColors.grey3)),
                        child: Row(
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () async {
                                var result = await showListBottomSheet(context,
                                    Strings.title, titleList, selectedTitle);
                                if (result != null) {
                                  setState(() {
                                    selectedTitle = result;
                                  });
                                }
                              },
                              child: SizedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      selectedTitle,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.black3),
                                    ),
                                    arrowDownIcon(),
                                    Text(
                                      "|",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.grey10),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: TextField(
                                controller: driverNameController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))
                                ],
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: Strings.enterDriverName,
                                    hintStyle: TextStyle(
                                        fontSize: 14, color: AppColors.grey10)),
                                onChanged: (val) {
                                  if (driverNameController.text.isNotEmpty) {
                                    setState(() {
                                        isNameEntered = false;
                                      });
                                  }else{
                                     setState(() {
                                        isNameEntered = true;
                                      });
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      // verticalSizedWidget10(h),
                      if (isNameEntered || isNameWithinLimit)
                        Column(
                          children: [
                            Text(
                              isNameWithinLimit
                                  ? Strings.errorNameLength
                                  : Strings.errorName,
                              style: customTextStyle(
                                  12, FontWeight.w400, AppColors.red1, 1),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                     
                      driverAccountCreationLabel(Strings.contactNumber, h),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            border: Border.all(color: AppColors.grey3)),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  countryImageIcon(usIcon),
                                  arrowDownIcon(),
                                ],
                              ),
                            ),
                            Text(
                              "+1",
                              style: customTextStyle(
                                  14, FontWeight.w400, AppColors.black5, 1),
                            ),
                            SizedBox(width: (w! * 0.015).ceilToDouble()),
                            Expanded(
                              child: TextField(
                                controller: phoneController,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                               
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '908 612 422',
                                    hintStyle: TextStyle(
                                        fontSize: 14, color: AppColors.grey10)),
                                onChanged: (val) {
                                  setState(() {});
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      verticalSizedWidget10(h),
                     
                      driverAccountCreationLabel(Strings.vehicleMake, h),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            border: Border.all(color: AppColors.grey3)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: vehicleMakeController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: Strings.enterVehicleMake,
                                    hintStyle: TextStyle(
                                        fontSize: 14, color: AppColors.grey10)),
                                onChanged: (val) {
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isVehicleMakeEnterd)
                        Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              Strings.errorVehicleMake1,
                              style: customTextStyle(
                                  12, FontWeight.w400, AppColors.red1, 1),
                            ),
                          ],
                        ),
                      driverAccountCreationLabel(Strings.vehicleType, h),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            border: Border.all(color: AppColors.grey3)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: vehicleTypeController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: Strings.enterVehicleType,
                                    hintStyle: TextStyle(
                                        fontSize: 14, color: AppColors.grey10)),
                                onChanged: (val) {
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      
                        if (isVehicleTypeEntered)
                        Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              Strings.errorVehicleType1,
                              style: customTextStyle(
                                  12, FontWeight.w400, AppColors.red1, 1),
                            ),
                          ],
                        ),
                      driverAccountCreationLabel(Strings.vehicleRegistration, h),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            border: Border.all(color: AppColors.grey3)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: vehicleRegistrationController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: Strings.enterVehicleNumber,
                                    hintStyle: TextStyle(
                                        fontSize: 14, color: AppColors.grey10)),
                                onChanged: (val) {
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      
                      SizedBox(
                        height: (h! * 0.03).ceilToDouble(),
                      ),
                      ElevatedButton(
                        style: registerBtnStyle,
                        onPressed: () {
                          setState(() {
                             context.read<LandingBloc>().add(TabChangeEvent(
                              tabIndex: 4, tabLabel: Strings.rAccount));
                            //validation();
                          });
                        },
                        child: Text(
                          Strings.submitChanges,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white),
                        ),
                      ),
                    ]),
              ),
            )));
      },
    );
  }

  void validation() {
    if (driverNameController.text.isNotEmpty &&
        vehicleTypeController.text.isNotEmpty &&
        vehicleMakeController.text.isNotEmpty &&
        vehicleRegistrationController.text.isNotEmpty) {
      if (driverNameController.text.length >= 3 && driverNameController.text.length <= 70) {
        //Navigator.pushNamed(context, '/vehicleNumberSearch');
      } else {
        setState(() {
          isNameWithinLimit = true;
        });
      }
    } else {
      setState(() {
        isNameEntered = driverNameController.text.isEmpty;
        isVehicleTypeEntered = vehicleTypeController.text.isEmpty;
        isVehicleMakeEnterd = vehicleMakeController.text.isEmpty;
        print(isNameEntered);
      });
    }
  }
}
