import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';
import 'active_sessions.dart';
import 'past_sessions.dart';

class MySessions extends StatefulWidget {
  const MySessions({super.key});
  @override
  State<MySessions> createState() => MySessionsState();
}

class MySessionsState extends State<MySessions> {
  bool countrySelected = false;
  bool inCorrectSearch = true;
  bool starSelected = false;
  String tabLabel = "";
  bool activeSessions = true;
  bool activeSessionsData = true;
  bool pastSessionsData = true;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
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
                            activeSessions = true;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 12, left: 35, right: 35, bottom: 12),
                          decoration: BoxDecoration(
                              color: activeSessions
                                  ? AppColors.black6
                                  : Colors.transparent,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0))),
                          child: Text(
                            Strings.activeSessions,
                            style: customTextStyle(
                                14,
                                FontWeight.w400,
                                activeSessions
                                    ? AppColors.white
                                    : AppColors.black6,
                                1),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            activeSessions = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 12, left: 35, right: 35, bottom: 12),
                          decoration: BoxDecoration(
                              color: !activeSessions
                                  ? AppColors.black6
                                  : Colors.transparent,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0))),
                          child: Text(
                            Strings.pastSessions,
                            style: customTextStyle(
                                14,
                                FontWeight.w600,
                                !activeSessions
                                    ? AppColors.white
                                    : AppColors.black6,
                                1),
                          ),
                        ),
                      )
                    ]),
              ),
            ),

            if(activeSessions && !activeSessionsData)
            Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Strings.noActiveSessions,
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
                            onPressed: () {},
                            child: Text(
                              Strings.parkNow,
                              style: customTextStyle(
                                  14, FontWeight.w600, AppColors.white, 1),
                            )),
                      ),
                    ),
                  ]),
            ),

            if(!activeSessions && !pastSessionsData)
            Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Strings.noPastSessions,
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
                               context.read<LandingBloc>().add(TabChangeEvent(
                                          tabIndex: 1, tabLabel: Strings.rPark));
                            },
                            child: Text(
                              Strings.parkNow,
                              style: customTextStyle(
                                  14, FontWeight.w600, AppColors.white, 1),
                            )),
                      ),
                    ),
                  ]),
            ),

            if (activeSessions && activeSessionsData) const ActiveSessions(),
            if (!activeSessions && pastSessionsData)
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
                                      const PastSessions()
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
