import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/custom_widgets.dart';
import '../../../utils/strings.dart';
import '../../../utils/styles.dart';

class ItemPastVisitRequest extends StatefulWidget {
  const ItemPastVisitRequest({super.key});

  @override
  State<ItemPastVisitRequest> createState() => ItemPastVisitRequestState();
}

class ItemPastVisitRequestState extends State<ItemPastVisitRequest> {
  LatLng initialLocation = const LatLng(37.422131, -122.084801);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    print((h! * 0.3).ceilToDouble());

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: GestureDetector(
        onTap: () {
          print("clicked");
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: AppColors.grey4)),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(164, 164, 164, 0.4),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Text(
                        Strings.rejected,
                        style: customTextStyle(
                            10, FontWeight.w600, AppColors.black6, 0),
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
                        style: customTextStyle(
                            10, FontWeight.w600, AppColors.black6, 0),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h! * 0.03,
                ),
                Row(
                  children: [
                    Text(
                      Strings.carParkName,
                      style: customTextStyle(
                          16, FontWeight.w600, AppColors.black6, 0),
                    ),
                    const Spacer(),
                    Image.asset(star)
                  ],
                ),
                SizedBox(
                  height: h! * 0.02,
                ),
                commonWidget(Strings.hostText, "Barclays Bank"),
                SizedBox(
                  height: h! * 0.025,
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
                      style: customTextStyle(
                          16, FontWeight.w400, AppColors.black6, 0),
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
                      style: customTextStyle(
                          16, FontWeight.w400, AppColors.black6, 0),
                    ),
                  ],
                ),
                SizedBox(
                  height: h! * 0.01,
                ),
                commonWidget(Strings.reasonForRejection,
                    "${Strings.dummyPurpose} postponded"),
              ]),
        ),
      ),
    );
  }
}
