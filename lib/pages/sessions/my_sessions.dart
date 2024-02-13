import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/notification_banner.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';
import 'active_sessions.dart';
import 'past_sessions.dart';

class MySessions extends StatefulWidget {
  const MySessions({super.key});
  @override
  State<MySessions> createState() => MySessionsState();
}

class MySessionsState extends State<MySessions> with TickerProviderStateMixin {
  bool countrySelected = false;
  bool inCorrectSearch = true;
  bool starSelected = false;
  String tabLabel = "";
  String activeOption = Strings.pending;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    var theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: Strings.permitsAndReq),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Column(
            children: <Widget>[
             if(Strings.isPermitSuccess)
                    NotificationBanner(
                      message: Strings.permitSuccess,
                      isCancelAvailable: true,
                      isErrorMsg: false,
                      onCancel: () {
                        setState(() {
                          Strings.isPermitSuccess = false;
                        });
                      },
                    ),
              // give the tab bar a height [can change hheight to preferred height]
              Container(
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.grey4,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Theme(
                    data: theme.copyWith(
                      colorScheme: theme.colorScheme.copyWith(
                        surfaceVariant: Colors.transparent,
                      ),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      // give the indicator a decoration (color and border radius)
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        color: AppColors.black6,
                      ),
                      labelColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor: AppColors.black6,
                      tabs: [
                        // first tab [you can add an icon using the icon property]
                        Tab(
                          text: Strings.activeSessions,
                        ),

                        // second tab [you can add an icon using the icon property]
                        Tab(
                          text: Strings.pastSessions,
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: h! * 0.05,
                child: ListView(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.grey4,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: Row(children: [
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(Icons.filter_alt_outlined),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(Strings.filters),
                        const SizedBox(
                          width: 5,
                        ),
                        ClipOval(
                          child: Container(
                            width: 20,
                            height: 20,
                            color: AppColors.green1,
                            child: const Center(
                              child: Text(
                                "1",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 9),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        )
                      ]),
                    ),
                    const SizedBox(width: 15,),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.grey4,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: Row(children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Text(Strings.date),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(Icons.keyboard_arrow_down),
                        const SizedBox(
                          width: 5,
                        ),
                      ]),
                    ),
                    const SizedBox(width: 15,),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.grey4,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: Row(children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Text(Strings.location),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(Icons.keyboard_arrow_down),
                        const SizedBox(
                          width: 5,
                        ),
                      ]),
                    ),
                    const SizedBox(width: 15,),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.grey4,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: Row(children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Text(Strings.status),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(Icons.keyboard_arrow_down),
                        const SizedBox(
                          width: 5,
                        ),
                      ]),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              // tab bar view here
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children:  [
                    // first tab bar view widget
                    const ActiveSessions(),
                    //NoActiveSessions(message:Strings.noActiveSessions,from:"active"),

                    // second tab bar view widget
                    PastSessions(),
                    //NoActiveSessions(message:Strings.noPastSessions,from:"past"),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}

class NoActiveSessions extends StatelessWidget {
  final String message;
  final String from;
  const NoActiveSessions({super.key, required this.message, required this.from});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message,
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
        ]);
  }
}

