import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/custom_widgets.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class VehicleNumberSearch extends StatefulWidget {
  const VehicleNumberSearch({super.key});
  @override
  State<VehicleNumberSearch> createState() => VehicleNumberSearchState();
}

class VehicleNumberSearchState extends State<VehicleNumberSearch> {
  final TextEditingController vehicleNumberController = TextEditingController();
  bool isVehicleNumberEntered = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return BlocConsumer<LandingBloc, LandingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: CustomAppBarWithBackAndSkip(
              title: Strings.createAccount,
              backText: Strings.back,
            ),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.vehicleDetails,
                        style: TextStyle(
                            color: AppColors.black1,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                      driverAccountCreationLabel(Strings.vehicleNumber, h),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            border: Border.all(color: AppColors.grey3)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: vehicleNumberController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: Strings.example,
                                    hintStyle: TextStyle(
                                        fontSize: 14, color: AppColors.grey10)),
                                onChanged: (val) {
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      if (isVehicleNumberEntered)
                        Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              Strings.errorVehicleNumber,
                              style: customTextStyle(
                                  12, FontWeight.w400, AppColors.red1, 1),
                            ),
                          ],
                        ),
                      SizedBox(
                        height: (h! * 0.03).ceilToDouble(),
                      ),
                      ElevatedButton(
                        style: registerBtnStyle,
                        onPressed: () {
                          setState(() {
                            if(vehicleNumberController.text.isNotEmpty){
                              print("vehicle number is not empty");
                              Navigator.pushNamed(context, '/vehicleDetails');
                            }else{
                              setState(() {
                                isVehicleNumberEntered = true;
                              });
                            }
                          });
                        },
                        child: Text(
                          Strings.searchText,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white),
                        ),
                      ),
                    ]),
              ),
            )));
      },
    );
  }
}
