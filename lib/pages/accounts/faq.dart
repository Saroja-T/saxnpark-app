import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});
  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
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
          title: Strings.faq, backText: Strings.back),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h! * 0.045,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide: BorderSide.none),
                    prefixIcon: Image.asset(
                      searchIcon,
                      color: const Color.fromARGB(96, 96, 96, 1),
                    ),
                    filled: true,
                    fillColor: AppColors.grey1,
                    hintStyle: customTextStyle(
                        14, FontWeight.w400, AppColors.grey2, 1),
                    hintText: Strings.findInfo,
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                Strings.helpfulArticles,
                style:
                    customTextStyle(20, FontWeight.w500, AppColors.black5, 1),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: AppColors.grey3)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) =>
                            InkWell(
                          onTap: () async {
                            final Uri url = Uri.parse('https://google.com');
                              if (!await launchUrl(url)) {
                                    throw Exception('Could not launch $url');
                              }
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${Strings.topic} ${index + 1}",
                                  style: customTextStyle(
                                      16, FontWeight.w400, AppColors.black6, 1),
                                ),
                                Image.asset(rightArrow)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: Text(
                    Strings.allTopics,
                    style: customTextStyle(
                        20, FontWeight.w500, AppColors.black5, 1),
                  )),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: AppColors.grey3)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 7,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) =>
                            InkWell(
                          onTap: () async {
                            final Uri url = Uri.parse('https://www.wikipedia.org');
                              if (!await launchUrl(url)) {
                                    throw Exception('Could not launch $url');
                              }
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${Strings.topic} ${index + 1}",
                                  style: customTextStyle(
                                      16, FontWeight.w400, AppColors.black6, 1),
                                ),
                                Image.asset(rightArrow)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
