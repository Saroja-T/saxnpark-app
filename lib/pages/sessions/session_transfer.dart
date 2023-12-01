import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/custom_widgets.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class SessionTransfer extends StatefulWidget {
  const SessionTransfer({super.key});
  @override
  State<SessionTransfer> createState() => SessionTransferState();
}

class SessionTransferState extends State<SessionTransfer> {
  final TextEditingController userIdController = TextEditingController();
  bool isUserIdEntered = false;

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
            appBar: CustomAppBarWithBack(
              title: Strings.sessions,
              backText: Strings.back,
              tabIndex: 2,
              redirectionKey: Strings.rSession,
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
                        Strings.sessionTransfer,
                        style: TextStyle(
                            color: AppColors.black1,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                      verticalSizedWidget10(h),
                      verticalSizedWidget5(h),
                      Text(
                        Strings.sessionTransferMsg,
                        style: TextStyle(
                            color: AppColors.black1,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            height: 1.5),
                      ),
                      verticalSizedWidget5(h),
                      driverAccountCreationLabel(Strings.userIdNo, h),
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
                                controller: userIdController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: Strings.enterUserIdNo,
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
                      if (isUserIdEntered)
                        Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  info,
                                  color: AppColors.red1,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  Strings.userIdNotFound,
                                  style: customTextStyle(
                                      12, FontWeight.w400, AppColors.red1, 1),
                                ),
                              ],
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
                            if (userIdController.text.isNotEmpty) {
                              print("vehicle number is not empty");
                              //Navigator.pushNamed(context, '/vehicleDetails');
                            } else {
                              setState(() {
                                isUserIdEntered = true;
                              });
                            }
                          });
                        },
                        child: Text(
                          Strings.transferSession,
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
