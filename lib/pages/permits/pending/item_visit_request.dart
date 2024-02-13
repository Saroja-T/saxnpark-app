import 'package:flutter/material.dart';

import '../../../utils/buttons/custom_border_botton.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/custom_widgets.dart';
import '../../../utils/strings.dart';
import '../../../utils/styles.dart';

class ItemVisitRequest extends StatefulWidget {
  const ItemVisitRequest({super.key});

  @override
  State<ItemVisitRequest> createState() => ItemVisitRequestState();
}

class ItemVisitRequestState extends State<ItemVisitRequest> {
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
                  Strings.visitRequest,
                  style:
                      customTextStyle(10, FontWeight.w600, AppColors.black6, 0),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          commonWidget(Strings.location, Strings.dummyBookingLocation),
          commonWidget(Strings.hostText, "John Smith"),
          SizedBox(
            height: h! * 0.02,
          ),
          Row(
            children: [
              Image.asset(
                home,
                color: AppColors.black6,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                Strings.dummyCategory1,
                style:
                    customTextStyle(16, FontWeight.w400, AppColors.black6, 0),
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                Icons.circle,
                color: AppColors.black6,
                size: 4,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                Strings.dummyvehicle1,
                style:
                    customTextStyle(16, FontWeight.w400, AppColors.black6, 0),
              ),
            ],
          ),
          commonWidget(Strings.purposeOfVisit, Strings.dummyPurpose),
          const SizedBox(
            height: 20,
          ),
          CustomBorderButton(
            buttonText: Strings.getDirections,
            onTap: () {},
          ),
          const SizedBox(
            height: 5,
          ),
        ]);
  }
}
