import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/pages/payment/payment_page.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../bottomsheets/list_view_bottom_sheet.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/custom_widgets.dart';
import '../../utils/notification_banner.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});
  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  //validations varialbles
  bool isMessageEntered = false;
  bool isSubjectEntered = false;
  int _messageLength = 0;
  int _subjectLength = 0;

  String selectedTitle = "";

  @override
  void initState() {
    _emailController.text = "h.simpson@gmail.com";
    _nameController.text = "Homer Simpson";
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
              title: Strings.contactUs,
              backText: Strings.buttonCloseText,
              tabIndex: 4,
              redirectionKey: "",
            ),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(Strings.isContactSuccess)
                    SizedBox(height: h!*0.05,),
                    if(Strings.isContactSuccess)
                    NotificationBanner(
                      message: Strings.permitSuccess,
                      isCancelAvailable: false,
                      isErrorMsg: false,
                      onCancel: () {
                        setState(() {
                          Strings.isContactSuccess = false;
                        });
                      },
                    ),
                    driverAccountCreationLabel(Strings.name, h),
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
                              controller: _nameController,
                              style: TextStyle(color: AppColors.grey10),
                              readOnly: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: Strings.enterDriverName,
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
                    driverAccountCreationLabel(Strings.emailAddress, h),
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
                              controller: _emailController,
                              readOnly: true,
                              style: TextStyle(color: AppColors.grey10),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: Strings.enterEmailAddress,
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
                    driverAccountCreationLabel(Strings.subject, h),
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
                              controller: _subjectController,
                              maxLength: 100,
                              maxLines: null,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                counter: Text(
                                  '$_subjectLength/100',
                                  style: TextStyle(
                                      color: AppColors.grey10,
                                      fontSize: 12.0),
                                ),
                              ),
                              onChanged: (val) {
                                setState(() {
                                  _subjectLength = val.length;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isSubjectEntered)
                      Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            Strings.errorSubject,
                            style: customTextStyle(
                                12, FontWeight.w400, AppColors.red1, 1),
                          ),
                        ],
                      ),
                    driverAccountCreationLabel(Strings.message, h),
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
                              controller: _messageController,
                              readOnly: false,
                              maxLength: 5000,
                              maxLines: 3,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                counter: Text(
                                  '$_messageLength/5000',
                                  style: TextStyle(
                                      color: AppColors.grey10,
                                      fontSize: 12.0),
                                ),
                              ),
                              onChanged: (val) {
                                setState(() {
                                  _messageLength = val.length;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isMessageEntered)
                      Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            Strings.errorMessage,
                            style: customTextStyle(
                                12, FontWeight.w400, AppColors.red1, 1),
                          ),
                        ],
                      ),
                    driverAccountCreationLabel(Strings.attachment, h),
                    Container(
                      width: w! * 0.35,
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          border: Border.all(color: AppColors.grey3)),
                      child: Row(children: [
                        Image.asset(attachment),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          Strings.selectFile,
                          style: TextStyle(
                              color: AppColors.grey10,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400),
                        )
                      ]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      Strings.attachmentHint,
                      style: TextStyle(
                          color: AppColors.grey10,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
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
                          // validation();
                        });
                      },
                      child: Text(
                        Strings.submit,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white),
                      ),
                    ),
                    SizedBox(
                      height: (h! * 0.04).ceilToDouble(),
                    ),
                  ]),
            )));
      },
    );
  }

  void validation() {
    if (_subjectController.text.isNotEmpty &&
        _messageController.text.isNotEmpty) {
    } else {
      setState(() {
        isMessageEntered = _messageController.text.isEmpty;
        isSubjectEntered = _subjectController.text.isEmpty;
      });
    }
  }
}
