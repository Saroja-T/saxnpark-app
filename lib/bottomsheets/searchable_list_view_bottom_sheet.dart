import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/strings.dart';


void showSearchableListBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),    // Adjust the radius as needed
          topRight: Radius.circular(20.0),   // Adjust the radius as needed
        ),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            padding: const EdgeInsets.only(left:16.0,right:16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 48,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              child: Text(Strings.buttonCloseText,
                                  style: TextStyle(
                                      color: AppColors.black5,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400)),
                              onPressed: () {
                                Navigator.pop(context);
                              })),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          Strings.carParkTitle,
                          style: TextStyle(
                              color: AppColors.black2,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: AppColors.grey4,
                ),
                TextField(
                  //controller: _searchController,
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    hintText: 'Type to search...',
                  ),
                  onChanged: (value) {
                    // Implement search logic here
                    // You can filter the 'items' list based on the search input
                  },
                ),
                const SizedBox(height: 16.0),
                Flexible(
                  fit: FlexFit.loose,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 35,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: const Text("items[index]"),
                        onTap: () {
                          // Handle item tap
                          Navigator.pop(context); // Close the bottom sheet
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }