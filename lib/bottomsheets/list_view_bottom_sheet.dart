import 'package:flutter/material.dart';
import 'package:saxnpark_app/utils/styles.dart';

import '../utils/colors.dart';
import '../utils/strings.dart';

Future<String?> showListBottomSheet(
    BuildContext context, String title, List<String> titleList, String selectedTitle) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(  
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0), // Adjust the radius as needed
        topRight: Radius.circular(20.0), // Adjust the radius as needed
      ),
    ),
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
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
                        title,
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
              const SizedBox(height: 8.0),
              Flexible(
                fit: FlexFit.loose,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: titleList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pop(context, titleList[index]);
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
                                Text(titleList[index],style: customTextStyle(14, 
                                selectedTitle==titleList[index]?FontWeight.w600:FontWeight.w400, AppColors.black5, 0),),
                                const Spacer(),
                                if(selectedTitle==titleList[index]) Icon(Icons.check,size: 16,color: AppColors.black5,)
                              ],
                            ),
                            const SizedBox(height: 16,),
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
    },
  );
}
