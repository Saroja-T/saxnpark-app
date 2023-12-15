import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/utils/colors.dart';
import 'package:saxnpark_app/utils/custom_widgets.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class MyVehicles extends StatefulWidget {
  const MyVehicles({super.key});
  @override
  State<MyVehicles> createState() => MyVehiclesState();
}

class MyVehiclesState extends State<MyVehicles> {
  var searchedText;
  bool countrySelected = false;
  bool inCorrectSearch = true;
  bool starSelected = false;
  String tabLabel = "";
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    return Scaffold(
      appBar: CustomAppBarWithBack(
        title: Strings.myVehicles,
        backText: Strings.back,
        tabIndex: 4,
        redirectionKey: Strings.rAccount,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: AppColors.grey3)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<LandingBloc>().add(TabChangeEvent(
                            tabIndex: 4, tabLabel: Strings.rDeleteVehicle));
                      },
                      child: vehiclesItem(
                          Strings.dummyvehicle1, Strings.dummyCategory1),
                    ),
                    vehiclesItem(Strings.dummyvehicle2, Strings.dummyCategoey2),
                    const SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(add),
                          const SizedBox(width: 16),
                          Text(
                            Strings.addVehicle,
                            style: customTextStyle(
                                16, FontWeight.w400, AppColors.black6, 1),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  vehiclesItem(String title, String category) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: customTextStyle(
                        16, FontWeight.w400, AppColors.black6, 1),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    category,
                    style: customTextStyle(
                        16, FontWeight.w400, AppColors.grey6, 1),
                  ),
                ],
              ),
              Image.asset(rightArrow),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            color: AppColors.grey12,
            height: 1,
          ),
        ],
      ),
    );
  }
}
