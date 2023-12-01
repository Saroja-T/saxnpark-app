import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/utils/colors.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});
  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
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
          CustomAppBarWithBack(title: Strings.help, backText: Strings.buttonCloseText,tabIndex: 4,redirectionKey: Strings.rAccount,),
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
                    InkWell(
                      onTap: (){
                        context.read<LandingBloc>().add(TabChangeEvent(
                            tabIndex: 4, tabLabel: Strings.rFaq));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.faq,
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
                    InkWell(
                       onTap: () {
                        
                      },
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
                            Strings.cancellationPolicy,
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
                    InkWell(
                      onTap: (){},
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
                    const SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      onTap: (){},
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
                    
                    
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
