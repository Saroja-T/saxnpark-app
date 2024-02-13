import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saxnpark_app/pages/permits/pending/item_host_request.dart';
import 'package:saxnpark_app/pages/permits/pending/item_parking_permit.dart';
import 'package:saxnpark_app/pages/permits/pending/item_visit_request.dart';

import '../../utils/buttons/custom_border_botton.dart';
import '../../utils/buttons/custom_button.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/custom_widgets.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class PendingPermits extends StatefulWidget {
  const PendingPermits({super.key});

  @override
  State<PendingPermits> createState() => PendingPermitsState();
}

class PendingPermitsState extends State<PendingPermits> {
  LatLng initialLocation = const LatLng(37.422131, -122.084801);
  int visibleItemCount = 5;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: visibleItemCount + 1,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        if (index == visibleItemCount) {
          // Last item is the "View More" button
          return InkWell(
            onTap: () {
              // Load more items
              setState(() {
                visibleItemCount += 5; // Increase the visible item count
              });
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  Strings.viewMore,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.black6,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              // context.read<LandingBloc>().add(TabChangeEvent(
              //     tabIndex: 0, tabLabel: Strings.location));
              print("clicked");
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: AppColors.grey4)),
              child:  const ItemHostRequest(),
            ),
          );
        }
      },
    );
  }
}
