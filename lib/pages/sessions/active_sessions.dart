import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../utils/buttons/custom_border_botton.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/buttons/custom_button.dart';
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

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
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
                                Strings.dummyDate1,
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
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: InkWell(
                            onTap: () {
                              showBottomSheet(context, h!);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              child: Center(
                                child: Text(
                                  Strings.cancelBooking,
                                  style: customTextStyle(
                                      14, FontWeight.w700, AppColors.red1, 0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: CustomButton(
                            onTap: () {
                              // Handle button tap
                            },
                            buttonText: Strings.getDirections,
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          );
        },
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
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0), // Adjust the radius as needed
          topRight: Radius.circular(20.0), // Adjust the radius as needed
        ),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: d * 0.07,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              child: Text(Strings.buttonCloseText,
                                  style: TextStyle(
                                      color: AppColors.black5,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400)),
                              onPressed: () {
                                Navigator.pop(context);
                              })),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          Strings.cancelBooking,
                          style: TextStyle(
                              color: AppColors.black2,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: AppColors.grey4,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Text(
                  Strings.reasonForCancellation,
                  style: customTextStyle(
                      14.0, FontWeight.w400, AppColors.black1, 0),
                ),
                SizedBox(
                  height: d * 0.03,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: AppColors.grey12)),
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(96, 96, 96, 1), fontSize: 14.0),
                      hintText: "",
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  height: d * 0.04,
                ),
                CustomButton(
                  onTap: () {
                    // Handle button tap
                  },
                  buttonText: Strings.cancelBooking,
                ),
                SizedBox(
                  height: d * 0.02,
                ),
                CustomBorderButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonText: Strings.cancellationPolicy,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
