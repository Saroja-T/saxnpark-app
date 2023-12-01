import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class ExpiredPermits extends StatefulWidget {
  const ExpiredPermits({super.key});

  @override
  State<ExpiredPermits> createState() => ExpiredPermitsState();
}

class ExpiredPermitsState extends State<ExpiredPermits> {
  LatLng initialLocation = const LatLng(37.422131, -122.084801);
  int visibleItemCount = 5;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: visibleItemCount + 1,
      physics: ClampingScrollPhysics(), 
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
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(164, 164, 164, 0.4),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Text(
                        Strings.complete,
                        style: customTextStyle(
                            10, FontWeight.w600, AppColors.black6, 0),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          Strings.dummyBookingLocation,
                          style: customTextStyle(
                              16, FontWeight.w600, AppColors.black6, 0),
                        ),
                        const Spacer(),
                        Image.asset(star)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              home,
                              color: AppColors.black6,
                            ),
                            Flexible(
                                child: customRow(Strings.dummyCategory1,
                                    Strings.dummyvehicle1)),
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Row(
                            children: [
                              Image.asset(
                                calender,
                                color: AppColors.black6,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                Strings.dummyDate,
                                style: customTextStyle(14, FontWeight.w400,
                                    AppColors.black6, 0),
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
                                Strings.dummyTime,
                                style: customTextStyle(14, FontWeight.w400,
                                    AppColors.black6, 0),
                              ),
                              const Text(" - "),
                              Text(
                                Strings.dummyDate,
                                style: customTextStyle(14, FontWeight.w400,
                                    AppColors.black6, 0),
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
                                Strings.dummyTime,
                                style: customTextStyle(14, FontWeight.w400,
                                    AppColors.black6, 0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              mapPin,
                              color: AppColors.black6,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${Strings.space} ",
                              style: customTextStyle(
                                  14, FontWeight.w400, AppColors.black6, 0),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              Strings.dummySpace,
                              style: customTextStyle(
                                  14, FontWeight.w400, AppColors.black6, 0),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              coins,
                              color: AppColors.black6,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              Strings.dummyCost,
                              style: customTextStyle(
                                  14, FontWeight.w400, AppColors.black6, 0),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12)),
                                color: AppColors.black6),
                            child: Center(
                              child: Text(
                                Strings.parkNow,
                                style: customTextStyle(16, FontWeight.w700,
                                    AppColors.white, 0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12)),
                                border:
                                    Border.all(color: AppColors.black6)),
                            child: Center(
                              child: Text(
                                Strings.getReceipt,
                                style: customTextStyle(16, FontWeight.w700,
                                    AppColors.black6, 0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          );
        }
      },
    );
  }

  Widget customRow(String title, String title1) {
    return Row(children: [
      const SizedBox(
        width: 5,
      ),
      Text(
        title,
        style: customTextStyle(14, FontWeight.w400, AppColors.black6, 0),
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
        title1,
        style: customTextStyle(14, FontWeight.w400, AppColors.black6, 0),
      )
    ]);
  }
}
