import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../bottomsheets/search_bottom_sheet.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/custom_widgets.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class VisitorScreen extends StatefulWidget {
  const VisitorScreen({super.key});
  @override
  State<VisitorScreen> createState() => _VisitorScreenState();
}

class _VisitorScreenState extends State<VisitorScreen> {
  var searchedText;
  bool countrySelected = false;
  var selectedIndex = 0;
  bool inCorrectSearch = true;
  bool starSelected = false;
  String tabLabel = "";
  List<String> titleList = [Strings.justParking, Strings.visiting];
  // Initial Selected Value
  String? dropdownvalue;
  final TextEditingController purposeOfVisitController =
      TextEditingController();
  String selectedHost = "";
  List<String> hostList = [
    "Full Name",
    "Full Name",
    "Full Name",
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

 
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    return Scaffold(
      appBar: CustomAppBarWithBack(
        title: Strings.bookingDetails,
        backText: Strings.back,
        tabIndex: 0,
        redirectionKey: Strings.rHome,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.visitorTitle,
                style:
                    customTextStyle(20, FontWeight.w500, AppColors.black1, 1),
              ),
              const SizedBox(height: 16),
              Text(
                Strings.hostText,
                style:
                    customTextStyle(16, FontWeight.w400, AppColors.black6, 1),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () {
                  showSearchHostMakeBottomSheet(context);
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
                        selectedHost == ""
                            ? Strings.selectHost
                            : selectedHost,
                        style: customTextStyle(
                            14,
                            FontWeight.w400,
                            selectedHost == ""
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
              SizedBox(
                height: h! * 0.01,
              ),
              Text(
                Strings.purposeOfVisit,
                style:
                    customTextStyle(16, FontWeight.w400, AppColors.black6, 0),
              ),
              SizedBox(
                height: h! * 0.02,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(color: AppColors.grey3)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: purposeOfVisitController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        onChanged: (val) {
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h! * 0.04,
              ),
              SizedBox(
                height: 51,
                child: SizedBox.expand(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.black6),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ))),
                      onPressed: () {
                        context.read<LandingBloc>().add(TabChangeEvent(
                            tabIndex: 1, tabLabel: Strings.rVehicleType));
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

  void showSearchHostMakeBottomSheet(BuildContext context) {
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
          selectedItem: selectedHost,
          dataList: hostList,
          title: Strings.hostText,
          hint: Strings.searchHost,
          onItemSelected: (item) {
            setState(() {
              selectedHost =
                  item; // Update the selected item in the main widget
            });
          },
        );
      },
    );
  }
}
