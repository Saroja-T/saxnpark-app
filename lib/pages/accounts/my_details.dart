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

class MyDetails extends StatefulWidget {
  const MyDetails({super.key});
  @override
  State<MyDetails> createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetails> {
  final TextEditingController driverNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  //validations varialbles
  bool isNameEntered = false;
  bool isNameWithinLimit = false;
  bool hasSelectedCountry = false;
  bool hasSelectedState = false;

  List<String> titleList = ["Mr", "Mrs", "Ms", "Miss"];
  
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
            appBar: CustomAppBarWithBack(
                title: Strings.details,
                backText: Strings.buttonCloseText,
                tabIndex: 4,
                redirectionKey: Strings.rAccount),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      driverAccountCreationLabel(Strings.name, h),
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
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[a-zA-Z\s]'))
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
                                  } else {
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
                      verticalSizedWidget10(h),
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
                     
                      driverAccountCreationLabel(Strings.phoneNumber, h),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        decoration: BoxDecoration(
                            color: AppColors.grey12,
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
                                readOnly: true,
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
                      Text(
                        Strings.numberChangeMsg,
                        style: customTextStyle(
                            12, FontWeight.w400, AppColors.black5, 1),
                      ),
                      driverAccountCreationLabel(Strings.emailAddress, h),
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
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: Strings.enterEmailAddress,
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
                            validation();
                          });
                        },
                        child: Text(
                          Strings.saveChanges,
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
    if (driverNameController.text.isNotEmpty ) {
      if (driverNameController.text.length >= 3 &&
          driverNameController.text.length <= 70) {
        Navigator.pushNamed(context, '/vehicleNumberSearch');
      } else {
        setState(() {
          isNameWithinLimit = true;
        });
      }
    } else {
      setState(() {
        isNameEntered = driverNameController.text.isEmpty;
        print(isNameEntered);
      });
    }
  }
}
