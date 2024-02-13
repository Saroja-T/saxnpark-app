import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saxnpark_app/utils/buttons/custom_border_botton.dart';
import 'package:saxnpark_app/utils/buttons/custom_button.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class PastSessions extends StatefulWidget {
  const PastSessions({super.key});

  @override
  State<PastSessions> createState() => PastSessionsState();
}

class PastSessionsState extends State<PastSessions> {
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
                                style: customTextStyle(
                                    14, FontWeight.w400, AppColors.black6, 0),
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
                                style: customTextStyle(
                                    14, FontWeight.w400, AppColors.black6, 0),
                              ),
                              const Text(" - "),
                              Text(
                                Strings.dummyDate,
                                style: customTextStyle(
                                    14, FontWeight.w400, AppColors.black6, 0),
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
                                style: customTextStyle(
                                    14, FontWeight.w400, AppColors.black6, 0),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                            fit: FlexFit.loose,
                            child: CustomBorderButton(
                              onTap: () {
                                showBottomSheet(
                                    context, (h! * 0.44).ceilToDouble());
                              },
                              buttonText: Strings.getReceipt,
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: CustomButton(
                            buttonText: Strings.parkAgain,
                            onTap: () {
                              
                            },),
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

  void showBottomSheet(BuildContext context, double d) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0), // Adjust the radius as needed
          topRight: Radius.circular(20.0), // Adjust the radius as needed
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding:
              const EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          height: d,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Center(
                          child: Text(
                            "Receipt no. 0002341",
                            style: customTextStyle(
                                12.0, FontWeight.w600, AppColors.black2, 0),
                          ),
                        )),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: AppColors.grey14,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Icon(
                            Icons.close,
                            color: AppColors.grey13,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: h! * 0.02,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 18, 16, 8),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      border: Border.all(color: AppColors.grey3)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.sessionDetails,
                          style: customTextStyle(
                              10, FontWeight.w400, AppColors.black6, 0),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          Strings.dummyBookingLocation,
                          style: customTextStyle(
                              16, FontWeight.w600, AppColors.black6, 0),
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
                        SizedBox(
                          height: h! * 0.01,
                        ),
                        Divider(
                          color: AppColors.grey3,
                        ),
                        SizedBox(
                          height: h! * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Strings.amountPaid,
                              style: customTextStyle(
                                  16.0, FontWeight.w600, AppColors.black6, 0),
                            ),
                            Text(
                              Strings.dummyCost,
                              style: customTextStyle(
                                  16.0, FontWeight.w600, AppColors.black6, 0),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h! * 0.01,
                        ),
                      ]),
                ),
                SizedBox(
                  height: h! * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              border: Border.all(color: AppColors.black6)),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.ios_share_outlined),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  Strings.shareText,
                                  style: customTextStyle(
                                      16, FontWeight.w700, AppColors.black6, 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            border: Border.all(color: AppColors.black6)),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.file_download_outlined),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                Strings.download,
                                style: customTextStyle(
                                    16, FontWeight.w700, AppColors.black6, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ]),
        );
      },
    );
  }
}
