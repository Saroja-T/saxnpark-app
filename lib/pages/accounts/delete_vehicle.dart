import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/pages/payment/payment_page.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../bottomsheets/list_view_bottom_sheet.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/curved_dialog.dart';
import '../../utils/custom_widgets.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class DeleteVehicle extends StatefulWidget {
  const DeleteVehicle({super.key});
  @override
  State<DeleteVehicle> createState() => _DeleteVehicleState();
}

class _DeleteVehicleState extends State<DeleteVehicle> {
  final TextEditingController vehicleMakeController = TextEditingController();
  final TextEditingController vehicleTypeController = TextEditingController();
  final TextEditingController vehicleModelController = TextEditingController();
  final TextEditingController vehicleRegistrationController =
      TextEditingController();
  final TextEditingController vehicleNickNameController =
      TextEditingController();

  //validations varialbles
  bool isNameEntered = false;
  bool isNameWithinLimit = false;
  bool isVehicleMakeEnterd = false;
  bool isVehicleTypeEntered = false;
  bool isVehicleModelEntered = false;

  String selectedTitle = "";

  @override
  void initState() {
    vehicleMakeController.text = Strings.dummyVehicleMake;
    vehicleTypeController.text = Strings.dummyVehicle;
    vehicleModelController.text = Strings.dummyVehicleModel;
    vehicleRegistrationController.text = Strings.example;
    vehicleNickNameController.text = Strings.dummyVehicleMake;
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
            appBar: CustomAppBarWithBack(
              title: Strings.dummyvehicle1,
              backText: Strings.buttonCloseText,
              tabIndex: 4,
              redirectionKey: Strings.rAccount,
            ),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      driverAccountCreationLabel(Strings.vehicleType, h),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        decoration: BoxDecoration(
                            color: AppColors.grey12,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            border: Border.all(color: AppColors.grey3)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: vehicleTypeController,
                                readOnly: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: Strings.enterVehicleType,
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
                      if (isVehicleTypeEntered)
                        Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              Strings.errorVehicleType1,
                              style: customTextStyle(
                                  12, FontWeight.w400, AppColors.red1, 1),
                            ),
                          ],
                        ),
                      driverAccountCreationLabel(Strings.vehicleMake, h),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        decoration: BoxDecoration(
                            color: AppColors.grey12,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            border: Border.all(color: AppColors.grey3)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: vehicleMakeController,
                                readOnly: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: Strings.enterVehicleMake,
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
                      if (isVehicleMakeEnterd)
                        Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              Strings.errorVehicleMake1,
                              style: customTextStyle(
                                  12, FontWeight.w400, AppColors.red1, 1),
                            ),
                          ],
                        ),
                      driverAccountCreationLabel(Strings.vehicleModel, h),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        decoration: BoxDecoration(
                            color: AppColors.grey12,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            border: Border.all(color: AppColors.grey3)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: vehicleModelController,
                                readOnly: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: Strings.enterVehicleModel,
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
                      if (isVehicleModelEntered)
                        Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              Strings.errorVehicleModel1,
                              style: customTextStyle(
                                  12, FontWeight.w400, AppColors.red1, 1),
                            ),
                          ],
                        ),
                      driverAccountCreationLabel(
                          Strings.vehicleRegistration, h),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        decoration: BoxDecoration(
                            color: AppColors.grey12,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            border: Border.all(color: AppColors.grey3)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: vehicleRegistrationController,
                                readOnly: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: Strings.enterVehicleNumber,
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
                      driverAccountCreationLabel(Strings.vehicleNick, h),
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
                                controller: vehicleNickNameController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: Strings.enterVehicleNick,
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
                      SizedBox(
                        height: (h! * 0.03).ceilToDouble(),
                      ),
                      ElevatedButton(
                        style: registerBtnStyle,
                        onPressed: () {
                          setState(() {
                            // context.read<LandingBloc>().add(TabChangeEvent(
                            //     tabIndex: 4, tabLabel: Strings.rAccount));
                            //validation();
                          });
                        },
                        child: Text(
                          Strings.saveChanges,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white),
                        ),
                      ),
                      SizedBox(
                        height: (h! * 0.04).ceilToDouble(),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CurvedDialog(
                                title: 'Delete vehicle',
                                isTitleAvailable: true,
                                content: 'Your are deleting vehicle with registration number LJ66 XOS.',
                                yesBtnText: Strings.confirm,
                                onYesPressed: () {
                                  Navigator.pop(context); // Close dialog
                                  // Add your action for 'Yes' button
                                },
                                onNoPressed: () {
                                  Navigator.pop(context); // Close dialog
                                },
                              );
                            },
                          );
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              Strings.deleteVehicle,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.red1),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            )));
      },
    );
  }

  void validation() {
    if (vehicleTypeController.text.isNotEmpty &&
        vehicleMakeController.text.isNotEmpty &&
        vehicleRegistrationController.text.isNotEmpty) {
    } else {
      setState(() {
        isVehicleTypeEntered = vehicleTypeController.text.isEmpty;
        isVehicleMakeEnterd = vehicleMakeController.text.isEmpty;
        print(isNameEntered);
      });
    }
  }
}
