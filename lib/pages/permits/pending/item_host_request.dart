import 'package:flutter/material.dart';
import 'package:saxnpark_app/utils/buttons/custom_button.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/custom_widgets.dart';
import '../../../utils/strings.dart';
import '../../../utils/styles.dart';

class ItemHostRequest extends StatefulWidget {
  const ItemHostRequest({super.key});

  @override
  State<ItemHostRequest> createState() => ItemHostRequestState();
}

class ItemHostRequestState extends State<ItemHostRequest> {
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(252, 217, 91, 0.4),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Text(
                  Strings.pending,
                  style:
                      customTextStyle(10, FontWeight.w600, AppColors.black6, 0),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(color: AppColors.black6)),
                child: Text(
                  Strings.hostRequest,
                  style:
                      customTextStyle(10, FontWeight.w600, AppColors.black6, 0),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          commonWidget(Strings.driversName, "John Smith"),
          commonWidget(Strings.location, Strings.dummyBookingLocation),
          commonWidget1(Strings.vehicle, Strings.dummyCategory1,
              Strings.dummyvehicle1, true),
          commonWidget(Strings.purposeOfVisit, Strings.dummyPurpose),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            buttonText: Strings.view,
            onTap: () {},
          ),
        ]);
  }
}
