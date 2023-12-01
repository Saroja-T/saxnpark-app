import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/pages/permits/active_permits.dart';
import 'package:saxnpark_app/pages/permits/expired_permits.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class MyPermits extends StatefulWidget {
  const MyPermits({super.key});
  @override
  State<MyPermits> createState() => MyPermitsState();
}

class MyPermitsState extends State<MyPermits> {
  bool countrySelected = false;
  bool inCorrectSearch = true;
  bool starSelected = false;
  String tabLabel = "";
  bool activePermits = true;
  bool activePermitsData = true;
  bool pastPermitsData = false;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: Strings.sessions),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Container(
                height: 60,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.grey4,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            activePermits = true;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 12, left: 25, right: 25, bottom: 12),
                          decoration: BoxDecoration(
                              color: activePermits
                                  ? AppColors.black6
                                  : Colors.transparent,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0))),
                          child: Text(
                            Strings.activePermits,
                            style: customTextStyle(
                                14,
                                FontWeight.w600,
                                activePermits
                                    ? AppColors.white
                                    : AppColors.black6,
                                1),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            activePermits = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 12, left: 25, right: 25, bottom: 12),
                          decoration: BoxDecoration(
                              color: !activePermits
                                  ? AppColors.black6
                                  : Colors.transparent,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0))),
                          child: Text(
                            Strings.expiredPermits,
                            style: customTextStyle(
                                14,
                                FontWeight.w600,
                                !activePermits
                                    ? AppColors.white
                                    : AppColors.black6,
                                1),
                          ),
                        ),
                      )
                    ]),
              ),
            ),

            if(activePermits && !activePermitsData)
            Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Strings.noActivePermits,
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.black6),),
                    Padding(
                      padding: const EdgeInsets.only(top: 24,left: 24,right: 24,bottom: 16),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    AppColors.black6),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ))),
                            onPressed: () {
                              Navigator.pushNamed(context, '/permitHome');
                              // context.read<LandingBloc>().add(TabChangeEvent(
                              //             tabIndex: 4, tabLabel: Strings.rAddPermit));
                            },
                            child: Text(
                              Strings.addPermit,
                              style: customTextStyle(
                                  14, FontWeight.w600, AppColors.white, 1),
                            )),
                      ),
                    ),
                  ]),
            ),
            if(!activePermits && !pastPermitsData)
            Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Strings.noActivePermits,
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.black6),),
                    Padding(
                      padding: const EdgeInsets.only(top: 24,left: 24,right: 24,bottom: 16),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    AppColors.black6),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ))),
                            onPressed: () {
                               Navigator.pushNamed(context, '/permitHome');
                            },
                            child: Text(
                              Strings.addPermit,
                              style: customTextStyle(
                                  14, FontWeight.w600, AppColors.white, 1),
                            )),
                      ),
                    ),
                  ]),
            ),

            if (activePermits && activePermitsData) const ActivePermits(),
            if (!activePermits && pastPermitsData)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            if (index != 0)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '2022',
                                    style: customTextStyle(18, FontWeight.w500,
                                        AppColors.black1, 0),
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: 16,
                                  )
                                ],
                              ),
                            ListView.builder(
                                itemCount: 2,
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'March',
                                            style: customTextStyle(
                                                18,
                                                FontWeight.w500,
                                                AppColors.black1,
                                                0),
                                          ),
                                          if (index != 0)
                                            const Icon(
                                              Icons
                                                  .keyboard_arrow_down_outlined,
                                              size: 16,
                                            )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const ExpiredPermits()
                                    ],
                                  );
                                }),
                          ],
                        );
                      }),
                ),
              )

            // Expanded(
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           children: [
            //             Container(width: double.infinity, child: Text("March")),
            //             const PastSessions(),
            //           ],
            //         ),
            //       )
          ],
        ),
      ),
    );
  }
}
