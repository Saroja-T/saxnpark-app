import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/utils/colors.dart';
import 'package:saxnpark_app/utils/custom_widgets.dart';

import '../bloc/landing/landing_bloc.dart';
import '../commons/custom_app_bar.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class LocationList extends StatefulWidget {
  const LocationList({super.key});
  @override
  State<LocationList> createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  var searchedText;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    print("valdata ${searchedText.toString().isEmpty}");
    return Scaffold(
      appBar: CustomAppBar(title: Strings.location),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 36,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              borderSide: BorderSide.none),
                          prefixIcon: Image.asset(searchIcon),
                          filled: true,
                          fillColor: const Color.fromRGBO(239, 239, 239, 1),
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(96, 96, 96, 1),fontSize: 14.0),
                          hintText: Strings.locationHint,
                        ),
                        onChanged: (text) {
                          setState(() {
                            searchedText = text;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                children: [
                  SizedBox(
                      width: 36,
                      height: 36,
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(gridIcon))),
                  SizedBox(
                      width: 36,
                      height: 36,
                      child: IconButton(
                          onPressed: () {}, icon: Image.asset(listIcon))),
                  Container(
                    width: 91.0,
                    height: 34.0,
                    margin: const EdgeInsets.only(right: 16),
                    child: TextButton.icon(
                      style: locationActiveElatedBtnStyle,
                      onPressed: () {},
                      icon: Image.asset(
                        nearMe,
                        width: 12.0,
                        height: 12.0,
                        color: AppColors.white,
                      ),
                      label: Text(
                        Strings.nearMe,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: 91.0,
                    height: 34.0,
                    margin: const EdgeInsets.only(right: 16),
                    child: TextButton.icon(
                      style: locationInActiveElatedBtnStyle,
                      onPressed: () {},
                      icon: Image.asset(recent, width: 12.0, height: 12.0),
                      label: Text(
                        Strings.recent,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        context.read<LandingBloc>().add(TabChangeEvent(
                            tabIndex: 0, tabLabel: Strings.location));
                      },
                      child: Container(
                        // height: 157,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(Strings.carParkName,
                                        style: customTextStyle(
                                            16.0,
                                            FontWeight.w500,
                                            AppColors.black3,
                                            0)),
                                    SizedBox(width: 3),
                                    Image.asset(info)
                                  ],
                                ),
                                Image.asset(star)
                              ],
                            ),
                            Text("5km away",
                                style: customTextStyle(14.0, FontWeight.w400,
                                    AppColors.blue1, 1.5)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.weekDayText,
                                    style: customTextStyle(
                                        13.0,
                                        FontWeight.w400,
                                        AppColors.black3,
                                        1.5)),
                                Text("09:00 - 22:00",
                                    style: customTextStyle(
                                        13.0,
                                        FontWeight.w600,
                                        AppColors.black3,
                                        1.5)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.weekEndText,
                                    style: customTextStyle(
                                        13.0,
                                        FontWeight.w400,
                                        AppColors.black3,
                                        1.5)),
                                Text("11:00 - 18:00",
                                    style: customTextStyle(
                                        13.0,
                                        FontWeight.w600,
                                        AppColors.black3,
                                        1.5)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.weekEndText,
                                    style: customTextStyle(
                                        13.0,
                                        FontWeight.w400,
                                        AppColors.black3,
                                        1.5)),
                                Text("FREE",
                                    style: customTextStyle(
                                        13.0,
                                        FontWeight.w600,
                                        AppColors.black3,
                                        1.5)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.timeFrequencyText,
                                    style: customTextStyle(10.0,
                                        FontWeight.w400, AppColors.gray1, 1.5)),
                                Text('\$0.14',
                                    style: customTextStyle(
                                        10.0,
                                        FontWeight.w600,
                                        AppColors.black3,
                                        1.5)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.oneHourText,
                                    style: customTextStyle(10.0,
                                        FontWeight.w400, AppColors.gray1, 1.5)),
                                Text("\$1.40",
                                    style: customTextStyle(
                                        10.0,
                                        FontWeight.w600,
                                        AppColors.black3,
                                        1.5)),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}