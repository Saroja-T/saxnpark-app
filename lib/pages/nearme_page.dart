import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saxnpark_app/commons/custom_app_bar.dart';

import '../utils/strings.dart';

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

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        initialCameraPosition: CameraPosition(
          target: initialLocation,
          zoom: 14,
        )
    );
  }
}