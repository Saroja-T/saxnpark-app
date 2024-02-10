// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saxnpark_app/bottomsheets/location_details.dart';
import 'package:saxnpark_app/utils/custom_widgets.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../models/list_item.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/horizontal_listview_selector.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class NearMePage extends StatelessWidget {
  const NearMePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.locations),
      body: const NearMePageWidget(),
    );
  }
}

class NearMePageWidget extends StatefulWidget {
  const NearMePageWidget({super.key});
  @override
  State<NearMePageWidget> createState() => _NearMePageWidgetState();
}

class _NearMePageWidgetState extends State<NearMePageWidget> {
  List<MarkerDetails> markersList = [
    MarkerDetails(
        markerID: "1", lat: 34.19213557530695, long: -116.53385992677454),
    MarkerDetails(
        markerID: "2", lat: 34.1811301832486, long: -116.54183980580939)
  ];
  LatLng initialLocation = const LatLng(34.19213557530695, -116.53385992677454);
  Set<Marker> markerSet = Set();

  TextEditingController searchController = TextEditingController();
  String tabLabel = "";
  bool starSelected = false;
  bool showPlaceList = false;
  Permission? permission;

  @override
  void initState() {
    super.initState();
    getPermissions();
    addMarkers();
  }

  getPermissions() async {
    PermissionStatus status = await Permission.location.request();
    print(status);
    if (status.isDenied) {
      status = await Permission.location.request();
    } else if (status.isPermanentlyDenied) {
      showLocationDisabledAlertDialog(context);
    }
  }

  addMarkers() {
    for (var marker in markersList) {
      Marker resultMarker = Marker(
          markerId: MarkerId(marker.markerID!),
          position: LatLng(marker.lat!, marker.long!),
          onTap: () {
            setState(() {
              showPlaceList = true;
            });
          });
      markerSet.add(resultMarker);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      //fit: StackFit.loose,
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        GoogleMap(
            onTap: (LatLng) {
              setState(() {
                showPlaceList = false;
              });
            },
            initialCameraPosition: CameraPosition(
              target: initialLocation,
              zoom: 14,
            ),
            markers: markerSet),
        Positioned(
          top: 24,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: h,
            margin: const EdgeInsets.only(left: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                                textAlign: TextAlign.left,
                                textAlignVertical: TextAlignVertical.center,
                                controller: searchController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 1),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                      borderSide: BorderSide.none),
                                  prefixIcon: Image.asset(searchIcon),
                                  filled: true,
                                  fillColor: Colors.white,
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
                                Strings.cancel,
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
                    const SizedBox(
                      height: 10,
                    ),
                    
                    HorizontalListViewSelector(
                      width: MediaQuery.of(context).size.width * 0.3,
                      isGridSelected:true,
                      items: [
                        ListItem(
                            icon: nearMe,
                            label: Strings.nearMe,
                            width: w! * 0.3,
                            isSelected:true),
                        ListItem(
                          icon: recent,
                          label: Strings.recent,
                          width: w! * 0.25,
                          isSelected:false
                        ),
                        ListItem(
                          icon: disabledParking,
                          label: Strings.disabledParking,
                          width: w! * 0.45,
                          isSelected:false
                        ),
                        ListItem(
                          icon: chargingStation,
                          label: Strings.chargingStation,
                          width: w! * 0.45,
                          isSelected:false
                        ),
                      ],
                      onSelect: (selectedItem) {
                        // Handle the selected item here
                        print('Selected item: $selectedItem');
                      },
                    )
                  ],
                ),
                if (showPlaceList)
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.bottomCenter,
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.only(
                              // top: MediaQuery.of(context).size.height * .58,
                              right: 8.0,
                              left: 0.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.white,
                            elevation: 4.0,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: 156,
                                  child: Center(child: LocationCards(
                                    btnClick: () {
                                      showLocationBottomSheet(
                                          context, starSelected);
                                    },
                                    isParkAgain: false
                                  ))),
                            ),
                          ),
                        );
                      },
                    ),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MarkerDetails {
  String? markerID;
  double? lat;
  double? long;

  MarkerDetails(
      {required this.markerID, required this.lat, required this.long});
}
