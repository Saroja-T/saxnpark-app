import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../bottomsheets/search_bottom_sheet.dart';
import '../../bottomsheets/list_view_bottom_sheet.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/custom_widgets.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';


class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController driverNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  //validations varialbles
  bool isNameEntered = false;
  bool isNameWithinLimit = false;
  bool hasSelectedCountry = false;
  bool hasSelectedState = false;

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
  String selectedCountry = "";
  String selectedState = "";

  @override
  void initState() {
    selectedTitle = titleList[0];
    selectedCountry = countryList[0];
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
            appBar: CustomAppBarWithSkip(title: Strings.createAccount),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.driverDetails,
                        style: TextStyle(
                            color: AppColors.black1,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                      driverAccountCreationLabel(Strings.driverName, h),
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
                      Text(
                        Strings.driverLicenseMsg,
                        style: customTextStyle(
                            12, FontWeight.w400, AppColors.black5, 1),
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
                      driverAccountCreationLabel(Strings.country, h),
                      InkWell(
                        onTap: () async {
                          showSearchBottomSheet(context);
                        },
                        child: Container(
                          height: (h! * 0.062).ceil().toDouble(),
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              border: Border.all(color: AppColors.grey3)),
                          child: Row(
                            children: [
                              countryImageIcon(usIcon),
                              SizedBox(
                                width: w! * 0.03,
                              ),
                              Text(
                                selectedCountry==""?Strings.selectCountry:selectedCountry,
                                style: customTextStyle(
                                    14, FontWeight.w400, selectedCountry==""?AppColors.grey10:AppColors.black6, 1),
                              ),
                              const Spacer(),
                              arrowDownIcon(),
                            ],
                          ),
                        ),
                      ),
                      if (hasSelectedCountry)
                        Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              Strings.errorCountry,
                              style: customTextStyle(
                                  12, FontWeight.w400, AppColors.red1, 1),
                            ),
                          ],
                        ),
                      driverAccountCreationLabel(Strings.state, h),
                      InkWell(
                        onTap: () {
                           showStateSearchBottomSheet(context);
                        },
                        child: Container(
                          height: (h! * 0.062).ceil().toDouble(),
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              border: Border.all(color: AppColors.grey3)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: (w! * 0.01).ceil().toDouble(),
                              ),
                              Text(
                                selectedState==""?Strings.selectState:selectedState,
                                style: customTextStyle(
                                    14, FontWeight.w400, selectedState==""?AppColors.grey10:AppColors.black6, 1),
                              ),
                              const Spacer(),
                              arrowDownIcon(),
                            ],
                          ),
                        ),
                      ),
                      if (hasSelectedState)
                        Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              Strings.errorState,
                              style: customTextStyle(
                                  12, FontWeight.w400, AppColors.red1, 1),
                            ),
                          ],
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
                          Strings.saveAndContinue,
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

  void showSearchBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0), // Adjust the radius as needed
          topRight: Radius.circular(20.0), // Adjust the radius as needed
        ),
      ),
      builder: (BuildContext context) {
        return SearchBottomSheet(
          selectedItem: selectedCountry,
          dataList: countryList,
          title: Strings.country,
          hint: Strings.searchCountry,
          onItemSelected: (item) {
            setState(() {
              selectedCountry =
                  item; // Update the selected item in the main widget
            });
          },
        );
      },
    );
  }

  void showStateSearchBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0), // Adjust the radius as needed
          topRight: Radius.circular(20.0), // Adjust the radius as needed
        ),
      ),
      builder: (BuildContext context) {
        return SearchBottomSheet(
          selectedItem: selectedState,
          dataList: countryList,
          title: Strings.state,
          hint: Strings.searchState,
          onItemSelected: (item) {
            setState(() {
              selectedState =
                  item; // Update the selected item in the main widget
            });
          },
        );
      },
    );
  }

  void validation() {
    if (driverNameController.text.isNotEmpty &&
        selectedCountry.isNotEmpty &&
        selectedState.isNotEmpty) {
      if (driverNameController.text.length >= 3 && driverNameController.text.length <= 70) {
        Navigator.pushNamed(context, '/vehicleNumberSearch');
      } else {
        setState(() {
          isNameWithinLimit = true;
        });
      }
    } else {
      setState(() {
        isNameEntered = driverNameController.text.isEmpty;
        hasSelectedState = selectedCountry.isNotEmpty;
        hasSelectedCountry = selectedState.isNotEmpty;
        print(isNameEntered);
      });
    }
  }
}
