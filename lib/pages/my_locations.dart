import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/bottomsheets/location_details.dart';
import 'package:saxnpark_app/utils/colors.dart';
import 'package:saxnpark_app/utils/custom_widgets.dart';

import '../bloc/landing/landing_bloc.dart';
import '../commons/custom_app_bar.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({super.key});
  @override
  State<MyLocation> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  var searchedText;
  bool _showModal = false;
  late PersistentBottomSheetController _bottomSheetController;
  bool countrySelected = false;
  bool inCorrectSearch = true;
  bool starSelected = false;
  String tabLabel = "";

  
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    return Scaffold
    (
     // appBar: CustomAppBar(title: Strings.location),
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16,0,16,0),
              child: Container(
                 decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
            )),
            Positioned(
              top: 12,
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child:  Center(
                    child: Column(
                      children:  <Widget>[
                        SizedBox(
                          height: 48,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextButton(
                                    child: Text(Strings.buttonCloseText, style: TextStyle(
                                    color: AppColors.black5,fontSize: 12.0,fontWeight: FontWeight.w400)),
                                    onPressed:(){
                                      context.read<LandingBloc>().add(const TabChangeEvent(
                                tabIndex: 1, tabLabel: ""));
                                    }
                                 )
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    Strings.carParkTitle,
                                  style: TextStyle(
                                    color: AppColors.black2,fontSize: 12.0,fontWeight: FontWeight.w600),),
                                ),
                              ],
                            ),
                            
                          ),
                        ),
                        Container(
                          height: 1,
                          color: AppColors.grey4,
                        ),
                        Padding(
                          padding:  EdgeInsets.fromLTRB(16,24,16,16),
                          child: Container(
                          child:  Row(
                            children: [
                              SizedBox(width: 8,),
                              Expanded(
                                child: ElevatedButton(
                                  style:  ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ))),
                                  onPressed: (){
                              
                                }, child: Text(Strings.recent,style: customTextStyle(14, FontWeight.w400, AppColors.black6, 1),)),
                              ),
                               const SizedBox(width: 8,),
                               Expanded(
                                 child: ElevatedButton(
                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(AppColors.black6),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ))),
                                  onPressed: (){
                               
                                                             }, child: Text(Strings.savedText,style: customTextStyle(14, FontWeight.w600, AppColors.white, 1),)),
                               ),
                              const SizedBox(width: 8,)
                            ],
                            )
                          ),
                        ),

                        Container(
                          child: Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // context.read<LandingBloc>().add(TabChangeEvent(
                        //     tabIndex: 0, tabLabel: Strings.location));
                        print("clicked");
                      },
                      child: LocationCards(btnClick: (){
                        showLocationBottomSheet(context, starSelected);
                      },)
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                ),
              ),
            ))
                        
                      ],
                    ),
                  ),
                ),
              )
            ))
          ],
        ),
      ),
    );
  }
}