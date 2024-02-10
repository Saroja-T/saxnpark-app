import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipboard/clipboard.dart';
import 'package:saxnpark_app/pages/accounts/contact_us.dart';
import 'package:share_plus/share_plus.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../bottomsheets/article.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/curved_dialog.dart';
import '../../utils/custom_widgets.dart';
import '../../utils/notification_banner.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';
import '../landing_page.dart';

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
      appBar: CustomAppBarWithBack(
        title: Strings.account,
        backText: Strings.back,
        tabIndex: 0,
        redirectionKey: Strings.rHome,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //     padding: const EdgeInsets.all(16),
              //     margin: const EdgeInsets.only(bottom: 16),
              //     decoration: const BoxDecoration(
              //         borderRadius: BorderRadius.all(Radius.circular(8)),
              //         color: Color.fromRGBO(41, 170, 243, 0.1)),
              //     child: Row(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Image.asset(
              //             info,
              //             color: AppColors.black6,
              //           ),
              //           const SizedBox(
              //             width: 4,
              //           ),
              //           Flexible(child: Text(Strings.updateDriverDetailsMsg))
              //         ]),
              //   ),
              if (Strings.isPermitError)
                NotificationBanner(
                  message: Strings.permitError,
                  isCancelAvailable: true,
                  isErrorMsg: true,
                  onCancel: () {
                    setState(() {
                      Strings.isPermitError = false;
                    });
                  },
                ),
              if (Strings.isPermitError)
                const SizedBox(
                  height: 15,
                ),
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
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<LandingBloc>().add(TabChangeEvent(
                              tabIndex: 4, tabLabel: Strings.rMyDetails));
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 12.0, top: 20.0),
                          child: Row(
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
                        ),
                      ),
                      // const SizedBox(
                      //   height: 24,
                      // ),
                      InkWell(
                        onTap: () {
                          context.read<LandingBloc>().add(TabChangeEvent(
                              tabIndex: 4, tabLabel: Strings.rMyVehicles));
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 12.0, bottom: 12.0),
                          child: Row(
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
                        ),
                      ),
                      // const SizedBox(
                      //   height: 24,
                      // ),
                      InkWell(
                        onTap: () {
                          context.read<LandingBloc>().add(TabChangeEvent(
                              tabIndex: 4, tabLabel: Strings.rMyLocation));
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 12.0, bottom: 12.0),
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
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Strings.permitsAndReq,
                              style: customTextStyle(
                                  16, FontWeight.w400, AppColors.black6, 1),
                            ),
                            Image.asset(rightArrow)
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                        color: AppColors.grey3,
                        height: 1,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      InkWell(
                        onTap: () {
                          context.read<LandingBloc>().add(TabChangeEvent(
                              tabIndex: 4, tabLabel: Strings.rMySettings));
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 20.0, bottom: 12.0),
                          child: Row(
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
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          showArticleBottomSheet(
                              context, Strings.termsAndConditions, true);
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 12.0, bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Strings.termsAndConditions,
                                style: customTextStyle(
                                    16, FontWeight.w400, AppColors.black6, 1),
                              ),
                              Image.asset(rightArrow)
                            ],
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          showArticleBottomSheet(
                              context, Strings.cancellationPolicy, true);
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 12.0, bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Strings.cancellationPolicy,
                                style: customTextStyle(
                                    16, FontWeight.w400, AppColors.black6, 1),
                              ),
                              Image.asset(rightArrow)
                            ],
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          showArticleBottomSheet(
                              context, Strings.privacyPolicy, true);
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 12.0, bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Strings.privacyPolicy,
                                style: customTextStyle(
                                    16, FontWeight.w400, AppColors.black6, 1),
                              ),
                              Image.asset(rightArrow)
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          scaffoldKey.currentState!.showBottomSheet(
                            (_) => Material(
                              elevation: 10, // Set the desired elevation value
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                height: h! * 0.85,
                                child: const ContactUs(),
                              ),
                            ),
                          );
                          ;
                          //showArticleBottomSheet(context,Strings.cancellationPolicy,true);
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 12.0, bottom: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Strings.contactUs,
                                style: customTextStyle(
                                    16, FontWeight.w400, AppColors.black6, 1),
                              ),
                              Image.asset(rightArrow)
                            ],
                          ),
                        ),
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
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CurvedDialog(
                          title: '',
                          isTitleAvailable: false,
                          content: Strings.signOutConfirmation,
                          yesBtnText: Strings.signOut,
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                    child: Column(
                      children: [
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
