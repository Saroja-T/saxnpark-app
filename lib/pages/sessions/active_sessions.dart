import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class ActiveSessions extends StatefulWidget {
  const ActiveSessions({super.key});

  @override
  State<ActiveSessions> createState() => ActiveSessionsState();
}

class ActiveSessionsState extends State<ActiveSessions> {
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

    return Flexible(
      fit: FlexFit.loose,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                // context.read<LandingBloc>().add(TabChangeEvent(
                //     tabIndex: 2, tabLabel: Strings.rSessionTransfer));
                print("clicked");
                // context.read<LandingBloc>().add(TabChangeEvent(
                //         tabIndex: 2, tabLabel: Strings.rSessionTransfer));
                showBottomSheet(context, (h! * 0.4).ceilToDouble());
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
                          color: Color.fromRGBO(77, 235, 159, 0.4),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Text(
                          Strings.confirmed,
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
                      Text(
                        Strings.dummyBookingLocation1,
                        style: customTextStyle(
                            14, FontWeight.w400, AppColors.black6, 0),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 109,
                        child: GoogleMap(
                          onTap: (LatLng) {
                            print("dfdfdf");
                          },
                          initialCameraPosition: CameraPosition(
                            target: initialLocation,
                            zoom: 14,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
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
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: AppColors.black6)),
                        child: Center(
                          child: Text(
                            Strings.getDirections,
                            style: customTextStyle(
                                16, FontWeight.w700, AppColors.black6, 0),
                          ),
                        ),
                      ),
                    ]),
              ),
            );
          },
        ),
      ),
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
              const EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 16),
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
                    const Spacer(),
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
                  height: h! * 0.01,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      mapPin,
                      color: AppColors.black6,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      Strings.location,
                      style: customTextStyle(
                          14, FontWeight.w400, AppColors.black6, 0),
                    ),
                  ],
                ),
                SizedBox(
                  height: h! * 0.015,
                ),
                Text(
                  Strings.dummyBookingLocation,
                  style:
                      customTextStyle(16, FontWeight.w600, AppColors.black6, 0),
                ),
                SizedBox(
                  height: h! * 0.04,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      clock,
                      color: AppColors.black6,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      Strings.timeLeft,
                      style: customTextStyle(
                          14, FontWeight.w400, AppColors.black6, 0),
                    ),
                  ],
                ),
                SizedBox(
                  height: h! * 0.01,
                ),
                Text(
                  Strings.dummyTimeLeft,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black5),
                ),
                SizedBox(
                  height: h! * 0.03,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.black6),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ))),
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<LandingBloc>().add(TabChangeEvent(
                        tabIndex: 2, tabLabel: Strings.rSessionTransfer));
                      },
                      child: Text(
                        Strings.transferSession,
                        style: customTextStyle(
                            14, FontWeight.w600, AppColors.white, 1),
                      )),
                ),
              ]),
        );
      },
    );
  }
}
