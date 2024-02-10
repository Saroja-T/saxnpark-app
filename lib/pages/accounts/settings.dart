import 'package:flutter/material.dart';

import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/curved_dialog.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  @override
  State<Settings> createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBarWithBack(
        title: Strings.settings,
        backText: Strings.buttonCloseText,
        tabIndex: 4,
        redirectionKey: Strings.rAccount,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: AppColors.grey3)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                Strings.hasOldPassword = true;
                              });
                              Navigator.pushNamed(
                                context,
                                '/newPassword',
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 24.0, bottom: 15.0),
                              child: Row(
                                children: [
                                  Image.asset(help),
                                  const SizedBox(width: 8),
                                  Text(
                                    Strings.password,
                                    style: customTextStyle(14, FontWeight.w400,
                                        AppColors.grey6, 1),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CurvedDialog(
                                    title: '',
                                    isTitleAvailable: false,
                                    content:
                                        Strings.deleteAccountConfirmationMsg,
                                    yesBtnText: Strings.delete,
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
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 4.0),
                              child: Row(
                                children: [
                                  Image.asset(signOut),
                                  const SizedBox(width: 8),
                                  Text(
                                    Strings.deleteAccount,
                                    style: customTextStyle(
                                        14, FontWeight.w400, AppColors.red1, 1),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 24,
                  // ),
                ],
              ),
            ),
            // const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
