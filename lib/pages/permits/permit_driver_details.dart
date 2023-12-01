import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class PermitDriversDetaills extends StatefulWidget {
  const PermitDriversDetaills({super.key});

  @override
  State<PermitDriversDetaills> createState() => PermitDriversDetaillsState();
}

class PermitDriversDetaillsState extends State<PermitDriversDetaills> {
  String tabLabel = "";
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    return Scaffold(
      appBar: CustomAppBarWithBack(
        title: Strings.driversDetails,
        backText: Strings.back,
        tabIndex: 4,
        redirectionKey: tabLabel == Strings.rDriversDetails
            ? Strings.rAddPermit
            : Strings.rVehicleDetails,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.bookingConfirmationTitle,
                style:
                    customTextStyle(20, FontWeight.w500, AppColors.black1, 1),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: AppColors.grey4)),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.hostText,
                        style: customTextStyle(
                            14, FontWeight.w400, AppColors.black6, 0),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Flexible(
                          fit: FlexFit.loose,
                          child: Text(
                            Strings.dummyBookingLocation2,
                            style: customTextStyle(
                                16, FontWeight.w600, AppColors.black6, 0),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        Strings.driversName,
                        style: customTextStyle(
                            14, FontWeight.w400, AppColors.black6, 0),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Flexible(
                          fit: FlexFit.loose,
                          child: Text(
                            Strings.dummyDriversName,
                            style: customTextStyle(
                                16, FontWeight.w600, AppColors.black6, 0),
                          )),
                      SizedBox(
                        height: (h! * 0.024).ceilToDouble(),
                      ),
                      Text(
                        Strings.contactNumber,
                        style: customTextStyle(
                            14, FontWeight.w400, AppColors.black6, 0),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Flexible(
                          fit: FlexFit.loose,
                          child: Text(
                            Strings.dummyContactNumber,
                            style: customTextStyle(
                                16, FontWeight.w600, AppColors.black6, 0),
                          )),
                      if (tabLabel == Strings.rConfirmedDriversDetails)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: (h! * 0.024).ceilToDouble(),
                            ),
                            Text(
                              Strings.vehicleMake,
                              style: customTextStyle(
                                  14, FontWeight.w400, AppColors.black6, 0),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      Strings.dummyVehicleMake,
                                      style: customTextStyle(16,
                                          FontWeight.w600, AppColors.black6, 0),
                                    )),
                                const SizedBox(
                                  width: 4,
                                ),
                                GestureDetector(
                                  onTap: vehicleTypeChange,
                                  child: Text(
                                    Strings.change,
                                    style: customTextStyle(16, FontWeight.w400,
                                        AppColors.blue1, 0),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: (h! * 0.024).ceilToDouble(),
                            ),
                            Text(
                              Strings.vehicleModel,
                              style: customTextStyle(
                                  14, FontWeight.w400, AppColors.black6, 0),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      Strings.dummyVehicleModel,
                                      style: customTextStyle(16,
                                          FontWeight.w600, AppColors.black6, 0),
                                    )),
                                const SizedBox(
                                  width: 4,
                                ),
                                GestureDetector(
                                  onTap: vehicleTypeChange,
                                  child: Text(
                                    Strings.change,
                                    style: customTextStyle(16, FontWeight.w400,
                                        AppColors.blue1, 0),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: (h! * 0.024).ceilToDouble(),
                            ),
                            Text(
                              Strings.vehicleRegistration,
                              style: customTextStyle(
                                  14, FontWeight.w400, AppColors.black6, 0),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                      Strings.dummyCategory1,
                                      style: customTextStyle(16,
                                          FontWeight.w600, AppColors.black6, 0),
                                    )),
                                const SizedBox(
                                  width: 4,
                                ),
                                GestureDetector(
                                  onTap: vehicleTypeChange,
                                  child: Text(
                                    Strings.change,
                                    style: customTextStyle(16, FontWeight.w400,
                                        AppColors.blue1, 0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                    ]),
              ),
              SizedBox(height: h! * 0.04),
              SizedBox(
                height: 51,
                child: SizedBox.expand(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.black6),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ))),
                      onPressed: () {
                        if (tabLabel == Strings.rConfirmedDriversDetails) {
                          context.read<LandingBloc>().add(TabChangeEvent(
                              tabIndex: 4, tabLabel: Strings.rAccount));
                        } else {
                          vehicleDetailsFrom = Strings.rDriversDetails;
                          context.read<LandingBloc>().add(TabChangeEvent(
                              tabIndex: 4, tabLabel: Strings.rVehicleDetails));
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            tabLabel == Strings.rConfirmedDriversDetails
                                ? Strings.confirm
                                : Strings.theseRCorrect,
                            style: customTextStyle(
                                14, FontWeight.w600, AppColors.white, 1),
                          ),
                        ],
                      )),
                ),
              ),
              SizedBox(
                height: (h! * 0.03).ceilToDouble(),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    context.read<LandingBloc>().add(TabChangeEvent(
                              tabIndex: 4, tabLabel: Strings.rUpdateDriverDetails));
                  },
                  child: Text(
                    tabLabel != Strings.rConfirmedDriversDetails
                        ? Strings.noMakeChanges
                        : "",
                    style: customTextStyle(
                        16, FontWeight.w600, AppColors.black6, 1),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  vehicleTypeChange() {
     vehicleDetailsFrom = Strings.rDriversDetails;
                          context.read<LandingBloc>().add(TabChangeEvent(
                              tabIndex: 4, tabLabel: Strings.rVehicleDetails));
  }

  bookingTimeChange() {
    //  context.read<LandingBloc>().add(TabChangeEvent(
    //                   tabIndex: 1, tabLabel: Strings.rVehicleType));
  }
}
