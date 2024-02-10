import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:saxnpark_app/bloc/location/location_bloc.dart';
import 'package:saxnpark_app/bottomsheets/location_details.dart';
import 'package:saxnpark_app/utils/colors.dart';
import 'package:saxnpark_app/utils/custom_widgets.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class LocationList extends StatefulWidget {
  const LocationList({super.key});
  @override
  State<LocationList> createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  final ScrollController _scrollController = ScrollController();
  var searchedText;
  bool _showModal = false;
  late PersistentBottomSheetController _bottomSheetController;
  bool countrySelected = false;
  bool inCorrectSearch = true;
  bool starSelected = false;
  String tabLabel = "";

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;

    TextEditingController controller = TextEditingController();

    _scrollController.addListener(() {
      print("???");
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Dispatch the LoadMoreDataEvent when reaching the end of the list
        BlocProvider.of<LocationBloc>(context).add(LoadMoreDataEvent());
      }
    });
    return Scaffold(
      appBar: CustomAppBar(title: Strings.locations),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    width: double.infinity,
                    height: 51,
                    child: GooglePlaceAutoCompleteTextField(
                      textEditingController: controller,
                      googleAPIKey: "AIzaSyAnqA8ekeovWKE99eqVY_r98zi9CKfPmhk",
                      boxDecoration: const BoxDecoration(
                          border: Border(
                        bottom: BorderSide.none,
                      )),
                      inputDecoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(2.0),
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
                      debounceTime: 400,
                      // countries: ["in", "fr"],
                      isLatLngRequired: false,
                      getPlaceDetailWithLatLng: (Prediction prediction) {
                        print("placeDetails" + prediction.lat.toString());
                      },

                      itemClick: (Prediction prediction) {
                        controller.text = prediction.description ?? "";
                        controller.selection = TextSelection.fromPosition(
                            TextPosition(
                                offset: prediction.description?.length ?? 0));
                      },
                      seperatedBuilder: const Divider(),
                      // OPTIONAL// If you want to customize list view item builder
                      itemBuilder: (context, index, Prediction prediction) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              const Icon(Icons.location_on),
                              const SizedBox(
                                width: 7,
                              ),
                              Expanded(
                                  child: Text(prediction.description ?? ""))
                            ],
                          ),
                        );
                      },

                      isCrossBtnShown: true,

                      // default 600 ms ,
                    ),
                  )
                      // SizedBox(
                      //   height: 36,
                      //   child: TextField(
                      //     decoration: InputDecoration(
                      //       contentPadding: const EdgeInsets.all(10.0),
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(24.0),
                      //           borderSide: BorderSide.none),
                      //       prefixIcon: Image.asset(searchIcon),
                      //       filled: true,
                      //       fillColor: const Color.fromRGBO(239, 239, 239, 1),
                      //       hintStyle: const TextStyle(
                      //           color: Color.fromARGB(96, 96, 96, 1),
                      //           fontSize: 14.0),
                      //       hintText: Strings.locationHint,
                      //     ),
                      //     onChanged: (text) {
                      //       setState(() {
                      //         searchedText = text;
                      //       });
                      //     },
                      //   ),
                      // ),
                      ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: SizedBox(
                height: 34.0,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    if (tabLabel == Strings.rNearMeList ||
                        tabLabel == Strings.rNearMeMapList)
                      Container(
                        width: 80,
                        height: 34,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                            color: AppColors.grey4,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: IconButton(
                                  onPressed: () {
                                    context.read<LandingBloc>().add(
                                        TabChangeEvent(
                                            tabIndex: 0,
                                            tabLabel: Strings.rNearMeMapList));
                                  },
                                  icon: Image.asset(
                                    gridIcon,
                                    width: 35,
                                  )),
                            ),
                            SizedBox(
                              width: 35,
                              height: 40,
                              child: IconButton(
                                  onPressed: () {
                                    print("cllcik");
                                  },
                                  icon: Image.asset(
                                    tabLabel == Strings.rNearMeList
                                        ? listSelectedIcon
                                        : listIcon,
                                    width: 24,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    Container(
                    width: w!*0.3,
                    margin: const EdgeInsets.only(right: 16),
                    child: TextButton.icon(
                      style: tabLabel == Strings.rNearMeList
                          ? locationActiveElatedBtnStyle
                          : locationInActiveElatedBtnStyle,
                      onPressed: () {
                        context.read<LandingBloc>().add(TabChangeEvent(
                            tabIndex: 0, tabLabel: Strings.rNearMeMapList));
                      },
                      icon: Image.asset(
                        nearMe,
                        width: 12.0,
                        height: 12.0,
                        color: tabLabel == Strings.rNearMeList
                            ? AppColors.white
                            : AppColors.black5,
                      ),
                      label: Text(
                        Strings.nearMe,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: tabLabel == Strings.rNearMeList
                                ? AppColors.white
                                : AppColors.black5),
                      ),
                    ),
                  ),
                  Container(
                    width: w!*0.25,
                    margin: const EdgeInsets.only(right: 16),
                    child: TextButton.icon(
                      style: tabLabel == Strings.rRecentList
                          ? locationActiveElatedBtnStyle
                          : locationInActiveElatedBtnStyle,
                      onPressed: () {
                        context.read<LandingBloc>().add(TabChangeEvent(
                            tabIndex: 0, tabLabel: Strings.rRecentList));
                      },
                      icon: Image.asset(
                        recent,
                        width: 12.0,
                        height: 12.0,
                        color: tabLabel == Strings.rRecentList
                            ? AppColors.white
                            : AppColors.black5,
                      ),
                      label: Text(
                        Strings.recent,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: tabLabel == Strings.rRecentList
                                ? AppColors.white
                                : AppColors.black5),
                      ),
                    ),
                  ),
                    Container(
                      width: w! * 0.45,
                      margin: const EdgeInsets.only(right: 16),
                      child: TextButton.icon(
                        style: locationInActiveElatedBtnStyle,
                        onPressed: () {
                          print("recent clicked...!!");
                          // context.read<LandingBloc>().add(TabChangeEvent(
                          //     tabIndex: 0, tabLabel: Strings.rRecentList));
                        },
                        icon: Image.asset(disabledParking,
                            width: 12.0, height: 12.0),
                        label: Text(
                          Strings.disabledParking,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black5),
                        ),
                      ),
                    ),
                    Container(
                      width: w! * 0.45,
                      margin: const EdgeInsets.only(right: 16),
                      child: TextButton.icon(
                        style: locationInActiveElatedBtnStyle,
                        onPressed: () {
                          print("recent clicked...!!");
                          // context.read<LandingBloc>().add(TabChangeEvent(
                          //     tabIndex: 0, tabLabel: Strings.rRecentList));
                        },
                        icon: Image.asset(chargingStation,
                            width: 12.0, height: 12.0),
                        label: Text(
                          Strings.chargingStation,
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
            ),

            
            
            if (tabLabel == Strings.rLocationList)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  children: [
                    Text(
                      Strings.newYork,
                      style: customTextStyle(
                          20, FontWeight.w500, AppColors.black1, 0),
                    ),
                    Text(
                      Strings.countryCount,
                      style: customTextStyle(
                          14, FontWeight.w400, AppColors.black4, 1.5),
                    )
                  ],
                ),
              ),
            if (tabLabel == Strings.rLocationSearchList)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  children: [
                    Text(
                      Strings.incorrectSearchText,
                      style: customTextStyle(
                          14, FontWeight.w400, AppColors.black3, 0),
                    ),
                  ],
                ),
              ),
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: BlocConsumer<LocationBloc, LocationState>(
                  listener: (BuildContext context, state) {},
                  builder: (context, state) {
                    if (state is LocationInitial) {
                      BlocProvider.of<LocationBloc>(context)
                          .add(LoadMoreDataEvent());
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is LocationLoadedState) {
                      return ListView.separated(
                        controller: _scrollController,
                        itemCount: state.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(onTap: () {
                            // context.read<LandingBloc>().add(TabChangeEvent(
                            //     tabIndex: 0, tabLabel: Strings.location));
                            print("clicked");
                          }, child: LocationCards(
                            btnClick: () {
                              showLocationBottomSheet(context, starSelected);
                            },
                            isParkAgain: false
                          ));
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                      );
                    } else {
                      // Loading state
                      return Container(
                        color: Colors.white,
                        child: CircularProgressIndicator(),
                      );
                    }
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
