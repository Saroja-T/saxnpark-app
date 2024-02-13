import 'package:flutter/material.dart';

import '../../../utils/buttons/custom_border_botton.dart';
import '../../../utils/buttons/custom_button.dart';
import '../../../utils/colors.dart';
import '../../../utils/custom_widgets.dart';
import '../../../utils/strings.dart';
import '../../../utils/styles.dart';

class ItemParkingPermit extends StatefulWidget {
  const ItemParkingPermit({super.key});

  @override
  State<ItemParkingPermit> createState() => ItemParkingPermitState();
}

class ItemParkingPermitState extends State<ItemParkingPermit> {
  @override
  Widget build(BuildContext context) {
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
                  Strings.pendingActivation,
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
                  Strings.parkingPermit,
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
          commonWidget1(Strings.validFrom, Strings.today, "16:00", false),
          commonWidget1(Strings.validUntil, Strings.today, "17:00", false),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Flexible(
                child: CustomBorderButton(
                  buttonText: Strings.cancel,
                  onTap: () {},
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Flexible(
                child: CustomButton(
                  buttonText: Strings.activate,
                  onTap: () {},
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ]);
  }
}
