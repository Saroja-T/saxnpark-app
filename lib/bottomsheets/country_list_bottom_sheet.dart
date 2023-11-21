import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/custom_widgets.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class SearchBottomSheet extends StatefulWidget {
  final Function(String) onItemSelected;
  final String selectedCountry;
  final String title;
  final String hint;
  final List<String> dataList;
  const SearchBottomSheet(
      {super.key,
      required this.onItemSelected,
      required this.selectedCountry,
      required this.dataList, required this.title, required this.hint});

  @override
  SearchBottomSheetState createState() => SearchBottomSheetState();
}

class SearchBottomSheetState extends State<SearchBottomSheet> {
  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = widget.dataList;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: <Widget>[
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
                      widget.title,
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
              width: MediaQuery.of(context).size.width * 0.9,
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
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(96, 96, 96, 1), fontSize: 14.0),
                  hintText: widget.hint,
                ),
                onChanged: (value) {
                  setState(() {
                    filteredItems = widget.dataList
                        .where((item) =>
                            item.toLowerCase().contains(value.toLowerCase()))
                        .toList();
                  });
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      widget.onItemSelected(filteredItems[index]);
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              if(Strings.country==widget.title)countryImageIcon(usIcon),
                              if(Strings.country==widget.title)SizedBox(
                                width: w! * 0.03,
                              ),
                              Text(
                                filteredItems[index],
                                style: customTextStyle(
                                    14,
                                    widget.selectedCountry ==
                                            filteredItems[index]
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                    AppColors.black5,
                                    0),
                              ),
                              const Spacer(),
                              if (widget.selectedCountry ==
                                  filteredItems[index])
                                Icon(
                                  Icons.check,
                                  size: 16,
                                  color: AppColors.black5,
                                )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            height: 1,
                            color: AppColors.grey4,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
