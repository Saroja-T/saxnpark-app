import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../bottomsheets/country_list_bottom_sheet.dart';
import '../../bottomsheets/list_view_bottom_sheet.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/custom_widgets.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class VehicleDetails extends StatefulWidget {
  const VehicleDetails({super.key});
  @override
  State<VehicleDetails> createState() => VehicleDetailsState();
}

class VehicleDetailsState extends State<VehicleDetails> {
  String tabLabel = "";
  final formKey = GlobalKey<FormState>();
  final TextEditingController driverNumberController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController vehicleNickNameController =
      TextEditingController();

  //validations varialbles
  bool isNumberEntered = false;
  bool isNameWithinLimit = false;
  bool hasSelectedVehicleType = false;
  bool hasSelectedVehicleMake = false;
  bool isVehicleModelSelected = false;

  List<String> vehicleTypeList = ["Car", "Lorry"];
  List<String> vehicleMakeList = [
    "BMW",
    "Ford",
    "Kia",
    "Option",
    "Option",
    "Option",
    "Option",
    "Option",
    "Option",
    "Option",
    "Option",
    "Option",
  ];
  List<String> vehicleModelList = [
    "1 Series",
    "2 Series",
    "3 Series",
    "x1",
    "Option",
    "Option",
    "Option",
    "Option",
    "Option",
    "Option",
    "Option",
    "Option",
  ];
  String chosenVehicleType = "";
  String selectedVehicleMake = "";
  String chosenVehicleModel = "";

  @override
  void initState() {
    chosenVehicleType = vehicleTypeList[0];
    //selectedVehicleMake = countryList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    print((h! * 0.006).ceilToDouble());
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    return BlocConsumer<LandingBloc, LandingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: CustomAppBarWithBackAndSkip(
              title: Strings.createAccount,
              backText: Strings.back,
            ),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (searchResultNotAvailable)
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                color: AppColors.red1.withOpacity(0.1),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(warning),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Flexible(
                                        child: Text(
                                          Strings.enterManuallyMsg,
                                          softWrap: true,
                                          maxLines: 3,
                                          style: customTextStyle(
                                              12,
                                              FontWeight.w400,
                                              AppColors.black5,
                                              1.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: (h! * 0.02).ceilToDouble(),
                            ),
                          ],
                        ),
                      Text(
                        Strings.vehicleDetails,
                        style: TextStyle(
                            color: AppColors.black1,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                      driverAccountCreationLabel(Strings.vehicleNumber, h),
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
                                controller: driverNumberController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: Strings.example,
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
                      verticalSizedWidget10(h),
                      if (isNumberEntered)
                        Column(
                          children: [
                            Text(
                              isNameWithinLimit
                                  ? Strings.errorNameLength
                                  : Strings.errorName,
                              style: customTextStyle(
                                  12, FontWeight.w400, AppColors.red1, 1),
                            ),
                            verticalSizedWidget5(h),
                          ],
                        ),
                      driverAccountCreationLabel(Strings.vehicleType, h),
                      InkWell(
                        onTap: () async {
                          var result = await showListBottomSheet(
                              context,
                              Strings.vehicleType,
                              vehicleTypeList,
                              chosenVehicleType);
                          if (result != null) {
                            setState(() {
                              chosenVehicleType = result;
                            });
                          }
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
                                chosenVehicleType == ""
                                    ? Strings.searchVehicleType
                                    : chosenVehicleType,
                                style: customTextStyle(
                                    14,
                                    FontWeight.w400,
                                    chosenVehicleType == ""
                                        ? AppColors.grey10
                                        : AppColors.black5,
                                    1),
                              ),
                              const Spacer(),
                              arrowDownIcon(),
                            ],
                          ),
                        ),
                      ),
                      if (hasSelectedVehicleType)
                        Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  warning,
                                  color: AppColors.red1,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  Strings.errorVehicleType,
                                  style: customTextStyle(
                                      12, FontWeight.w400, AppColors.red1, 1),
                                ),
                              ],
                            ),
                          ],
                        ),
                      driverAccountCreationLabel(Strings.vehicleMake, h),
                      InkWell(
                        onTap: () {
                          showSearchVehicleMakeBottomSheet(context);
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
                                selectedVehicleMake == ""
                                    ? Strings.selectVehicleMake
                                    : selectedVehicleMake,
                                style: customTextStyle(
                                    14,
                                    FontWeight.w400,
                                    selectedVehicleMake == ""
                                        ? AppColors.grey10
                                        : AppColors.black5,
                                    1),
                              ),
                              const Spacer(),
                              arrowDownIcon(),
                            ],
                          ),
                        ),
                      ),
                      if (hasSelectedVehicleMake)
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
                      driverAccountCreationLabel(Strings.vehicleModel, h),
                      InkWell(
                        onTap: () {
                          showVehicleModelBottomSheet(context);
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
                                chosenVehicleModel == ""
                                    ? Strings.selectVehicleModel
                                    : chosenVehicleModel,
                                style: customTextStyle(
                                    14,
                                    FontWeight.w400,
                                    chosenVehicleModel == ""
                                        ? AppColors.grey10
                                        : AppColors.black5,
                                    1),
                              ),
                              const Spacer(),
                              arrowDownIcon(),
                            ],
                          ),
                        ),
                      ),
                      if (isVehicleModelSelected)
                        Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              Strings.errorVehicleModel,
                              style: customTextStyle(
                                  12, FontWeight.w400, AppColors.red1, 1),
                            ),
                          ],
                        ),
                      driverAccountCreationLabel(Strings.vehicleNick, h),
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
                                controller: vehicleNickNameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: Strings.example1,
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
                        height: (h! * 0.04).ceilToDouble(),
                      ),
                      ElevatedButton(
                        style: registerBtnStyle,
                        onPressed: () {
                          if (isFromBookingPage) {
                            validation();
                          }
                          context.read<LandingBloc>().add(TabChangeEvent(
                              tabIndex: 0, tabLabel: Strings.rHome));
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/landingpage', (route) => false);
                        },
                        child: Text(
                          Strings.saveAndContinue,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white),
                        ),
                      ),
                      SizedBox(
                        height: (h! * 0.02).ceilToDouble(),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            height: (h! * 0.06).ceilToDouble(),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                border: Border.all(color: AppColors.black6)),
                            child: Center(
                                child: Text(
                              Strings.enterManually,
                              style: customTextStyle(
                                  16, FontWeight.w700, AppColors.black6, 1),
                            )),
                          ),
                        ),
                      ),
                    ]),
              ),
            )));
      },
    );
  }

  void showVehicleModelBottomSheet(BuildContext context) {
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
          selectedCountry: chosenVehicleModel,
          dataList: vehicleModelList,
          title: Strings.vehicleModel,
          hint: Strings.searchVehicleModel,
          onItemSelected: (item) {
            setState(() {
              chosenVehicleModel =
                  item; // Update the selected item in the main widget
            });
          },
        );
      },
    );
  }

  void showSearchVehicleMakeBottomSheet(BuildContext context) {
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
          selectedCountry: selectedVehicleMake,
          dataList: vehicleMakeList,
          title: Strings.vehicleMake,
          hint: Strings.searchVehicleMake,
          onItemSelected: (item) {
            setState(() {
              selectedVehicleMake =
                  item; // Update the selected item in the main widget
            });
          },
        );
      },
    );
  }

  void validation() {
    if (driverNumberController.text.isNotEmpty &&
        selectedVehicleMake.isNotEmpty &&
        chosenVehicleModel.isNotEmpty &&
        chosenVehicleModel.isNotEmpty) {
    } else {
      setState(() {
        isNumberEntered = driverNumberController.text.isEmpty;
        hasSelectedVehicleMake = selectedVehicleMake.isNotEmpty;
        hasSelectedVehicleType = chosenVehicleType.isNotEmpty;
        isVehicleModelSelected = chosenVehicleModel.isNotEmpty;
        print(isNumberEntered);
      });
    }
  }
}
