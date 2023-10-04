import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../commons/custom_app_bar.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class NearMePage extends StatelessWidget {
  const NearMePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Strings.location),
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
  LatLng initialLocation = const LatLng(37.422131, -122.084801);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: initialLocation,
            zoom: 14,
          ),
        ),
        Positioned(
          top: 24,
          left: 0,
          right: 0,
          child: Container(
            margin: const EdgeInsets.only(left: 16.0),
            child: Column(
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
                            controller: searchController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide.none),
                              prefixIcon: Image.asset(searchIcon,width: 14,height: 14,),
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(96, 96, 96, 1)),
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
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 34,
                      margin: const EdgeInsets.only(right:12),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(gridSelectedIcon,width: 35,)),
                          ),
                          SizedBox(
                            width: 35,
                            child: IconButton(
                                onPressed: () {}, icon: Image.asset(listIcon,width: 24,)),
                          ),
                        ],
                      ),
                    ),
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
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .58,
              right: 20.0,
              left: 20.0),
          child: SizedBox(
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            child: const Card(
              color: Colors.white,
              elevation: 4.0,
            ),
          ),
        )
      ],
    );
  }
}
