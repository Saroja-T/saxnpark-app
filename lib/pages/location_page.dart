import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/commons/custom_app_bar.dart';
import 'package:saxnpark_app/utils/colors.dart';

import '../bloc/landing/landing_bloc.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';
import 'landing_page.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});
  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    print(h);
    return Scaffold(
      appBar: CustomAppBar(title: Strings.location),
      body: Container(
        margin: const EdgeInsets.only(left: 16),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24.0,
            ),
            Container(
              height: 36.0,
              width: 358.0,
              margin: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 36,
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              borderSide: BorderSide.none),
                          prefixIcon: Image.asset(searchIcon),
                          filled: true,
                          fillColor: const Color.fromRGBO(239, 239, 239, 1),
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(96, 96, 96, 1),
                              fontSize: 14.0),
                          hintText: Strings.searchHint,
                        ),
                        onChanged: (value) {
                          setState(() {
                            searchController.text = value;
                          });
                        },
                      ),
                    ),
                  ),
                  if (searchController.text.isNotEmpty)
                    TextButton(
                      child: Text(
                        "Cancel",
                        style: customTextStyle(
                            14, FontWeight.w400, AppColors.black5, 0),
                      ),
                      onPressed: () {
                        setState(() {
                          searchController.clear();
                        });
                      },
                    )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Container(
                  width: 91.0,
                  height: 34.0,
                  margin: const EdgeInsets.only(right: 16),
                  child: TextButton.icon(
                    style: locationInActiveElatedBtnStyle,
                    onPressed: () {
                      context.read<LandingBloc>().add(TabChangeEvent(
                          tabIndex: 0, tabLabel: Strings.rNearMeMapList));
                      controller = scaffoldKey.currentState!.showBottomSheet((_) => Container(
                        child: showBrandsBottomSheet(),
                      ));
                    },
                    icon: Image.asset(nearMe, width: 12.0, height: 12.0),
                    label: Text(
                      Strings.nearMe,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black5),
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
            const SizedBox(
              height: 32.0,
            ),
            Container(
                margin: const EdgeInsets.only(left: 4),
                child: Text(Strings.us,
                    style: customTextStyle(
                        20.0, FontWeight.w500, AppColors.black1, 0))),
            const SizedBox(
              height: 16.0,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        context.read<LandingBloc>().add(TabChangeEvent(
                            tabIndex: 0, tabLabel: Strings.rNearMeMapList));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 16.0),
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(4.0),
                                bottomRight: Radius.circular(4.0)),
                          ),
                          child: SizedBox(
                            width: 171.0,
                            height: 150.0,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0)),
                                  child: Image.network(
                                    'https://assets.kpmg.com/is/image/kpmg/statue-of-liberty-front-view-united-states?scl=1',
                                    height: 96.0,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: Text(Strings.newYork,
                                      style: customTextStyle(
                                          20.0,
                                          FontWeight.w500,
                                          AppColors.black3,
                                          2)),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 4.0, bottom: 3),
                                      child: Text(Strings.dummyText1,
                                          style: customTextStyle(
                                              10.0,
                                              FontWeight.w400,
                                              AppColors.black3,
                                              2)),
                                    ),
                                    Icon(
                                      Icons.circle_rounded,
                                      size: 5.0,
                                      color: AppColors.black4,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4.0, right: 4.0, bottom: 3),
                                      child: Text(Strings.dummyText2,
                                          style: customTextStyle(
                                              10.0,
                                              FontWeight.w400,
                                              AppColors.black3,
                                              2)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  showBrandsBottomSheet() {
    return Container(
      height:200,
      width: double.infinity,
      color: Colors.green,
      child: Text("test"),
    );
  }
}
