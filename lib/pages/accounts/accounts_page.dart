import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/utils/colors.dart';
import 'package:saxnpark_app/utils/custom_widgets.dart';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});
  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  var searchedText;
  bool countrySelected = false;
  bool inCorrectSearch = true;
  bool starSelected = false;
  String tabLabel = "";
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    return Scaffold(
      appBar:
          CustomAppBarWithBack(title: Strings.account, backText: Strings.back),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: AppColors.grey3)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.userIdNo,
                          style: customTextStyle(
                              16, FontWeight.w400, AppColors.black6, 1),
                        ),
                        InkWell(
                          child: SizedBox(
                            height: 20,
                            child: Text(
                              Strings.shareText,
                              style: customTextStyle(
                                  14, FontWeight.w400, AppColors.blue1, 0),
                            ),
                          ),
                          onTap: () {
                            Share.share(Strings.dummyId);
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.dummyId,
                          style: customTextStyle(
                              14, FontWeight.w400, AppColors.grey6, 1),
                        ),
                        InkWell(
                          child: Image.asset(copy),
                          onTap: () {
                            FlutterClipboard.copy(Strings.dummyId)
                                .then((value) {
                              showPositiveToast(Strings.copiedMsg);
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: AppColors.grey3)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.myDetails,
                          style: customTextStyle(
                              16, FontWeight.w400, AppColors.black6, 1),
                        ),
                        Image.asset(rightArrow)
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.myVehicles,
                          style: customTextStyle(
                              16, FontWeight.w400, AppColors.black6, 1),
                        ),
                        Image.asset(rightArrow)
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      onTap: () {
                        context.read<LandingBloc>().add(TabChangeEvent(
                            tabIndex: 4, tabLabel: Strings.rMyLocation));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.myLocation,
                            style: customTextStyle(
                                16, FontWeight.w400, AppColors.black6, 1),
                          ),
                          Image.asset(rightArrow)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.parkingPermits,
                          style: customTextStyle(
                              16, FontWeight.w400, AppColors.black6, 1),
                        ),
                        Image.asset(rightArrow)
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      color: AppColors.grey3,
                      height: 1,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.settings,
                          style: customTextStyle(
                              16, FontWeight.w400, AppColors.black6, 1),
                        ),
                        Image.asset(rightArrow)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: AppColors.grey3)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(help),
                        const SizedBox(width: 8),
                        Text(
                          Strings.help,
                          style: customTextStyle(
                              14, FontWeight.w400, AppColors.grey6, 1),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Image.asset(signOut),
                        const SizedBox(width: 8),
                        Text(
                          Strings.signOut,
                          style: customTextStyle(
                              14, FontWeight.w400, AppColors.red1, 1),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
