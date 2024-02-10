import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/custom_widgets.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class PastPermits extends StatefulWidget {
  const PastPermits({super.key});

  @override
  State<PastPermits> createState() => PastPermitsState();
}

class PastPermitsState extends State<PastPermits> {
  LatLng initialLocation = const LatLng(37.422131, -122.084801);
  int visibleItemCount = 5;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: visibleItemCount + 1,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        if (index == visibleItemCount) {
          // Last item is the "View More" button
          return InkWell(
            onTap: () {
              // Load more items
              setState(() {
                visibleItemCount += 5; // Increase the visible item count
              });
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  Strings.viewMore,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.black6,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              // context.read<LandingBloc>().add(TabChangeEvent(
              //     tabIndex: 0, tabLabel: Strings.location));
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
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(164, 164, 164, 0.4),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Text(
                            Strings.expired,
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
                            Strings.parkingPermit,
                            style: customTextStyle(
                                10, FontWeight.w600, AppColors.black6, 0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    commonWidget(
                        Strings.location, Strings.dummyBookingLocation),
                    commonWidget(
                        Strings.hostText, Strings.dummyBookingLocation2),
                    commonWidget1(
                        Strings.vehicle, Strings.dummyCategory1,Strings.dummyvehicle1),
                    commonWidget1(
                        Strings.validFrom, Strings.today,"16:00"),
                    commonWidget1(
                        Strings.validUntil, Strings.today,"17:00"),
                    
                    const SizedBox(
                      height: 5,
                    ),
                  ]),
            ),
          );
        }
      },
    );
  }

  

}
