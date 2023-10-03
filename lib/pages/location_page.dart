import 'package:flutter/material.dart';
import 'package:saxnpark_app/commons/custom_app_bar.dart';
import 'package:saxnpark_app/utils/colors.dart';

import '../utils/constants.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});
  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    print(h);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: AppColors.toolbarShadow,
        title: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            Strings.location,
          style: TextStyle(
            color: AppColors.black2,fontSize: 12.0,fontWeight: FontWeight.w600),),
        )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 16), width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:h!/100.0),
              Center(child: Text(Strings.homeContent,style:TextStyle(fontSize: 28.0, color: AppColors.black1),)),
              SizedBox(height: h!/100.0),
              Container(
                margin: const EdgeInsets.only(right: 16),
                child: ElevatedButton(
                  style: borderedButtonStyle,
                  onPressed: () { },
                  child: Text(Strings.parkNow, style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w700,color: AppColors.black1),),
                ),
              ),
              SizedBox(height: h!/35.0),
              SizedBox(
                height: 151.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) =>  Container(
                    margin: EdgeInsets.only(right: 16),
                    child: Card(shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4.0),bottomRight: Radius.circular(4.0)),
                            ), 
                            child: SizedBox(width:256.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(4.0),topRight: Radius.circular(4.0)),
                                    child: Image.network('https://cdn.motor1.com/images/mgl/G33JZA/s3/bentley-mulliner-batur.jpg',
                                      height:96.0,
                                      width: double.infinity,
                                      fit: BoxFit.fill,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:8.0,right: 8.0),
                                    child: Text(Strings.dummyText, style:customTextStyle(14.0,FontWeight.w500,AppColors.black3,2)),
                                  ),
                                  Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left:8.0,right: 4.0,bottom: 3),
                                      child: Text(Strings.findOut, style:customTextStyle(12.0,FontWeight.w400,AppColors.black3,2)),
                                    ),
                                    Icon(Icons.arrow_outward_outlined, size:12.0,color: AppColors.blue1,)
                                  ],)
                                ],
                              ),
                          ),
                        ),
                  ),
                ),
            ),
            SizedBox(height: 32.0,),
            Container(margin:EdgeInsets.only(left: 4), child: Text(Strings.ourLocation, style:customTextStyle(20.0,FontWeight.w500,AppColors.black1,0))),
            SizedBox(height: 24.0,),
            SizedBox(
                height: 30.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) =>   Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: ElevatedButton(
                          style: homeActiveElatedBtnStyle,
                          onPressed: () { },
                          child: Text(Strings.northAmerica, style: 
                          customTextStyle(16.0,FontWeight.w600,AppColors.white,0),),
                        ),
                  ),
                ),
            ),
             SizedBox(height: 16.0,),
            Flexible(
              fit: FlexFit.loose,
              child: GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 300,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(right: 16.0),
                    child: Card(shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4.0),bottomRight: Radius.circular(4.0)),
                              ), 
                              child: SizedBox(
                                width: 171.0,
                                height: 150.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(4.0),topRight: Radius.circular(4.0)),
                                      child: Image.network('https://assets.kpmg.com/is/image/kpmg/statue-of-liberty-front-view-united-states?scl=1',
                                        height:96.0,
                                        width: double.infinity,
                                        fit: BoxFit.fill,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:8.0,right: 8.0),
                                      child: Text(Strings.us, style:customTextStyle(20.0,FontWeight.w500,AppColors.black3,3)),
                                    ),
                                    Row(children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0,right : 4.0,bottom: 3),
                                        child: Text(Strings.dummyText1, style:customTextStyle(10.0,FontWeight.w400,AppColors.black3,2)),
                                      ),
                                      Icon(Icons.circle_rounded, size:5.0,color: AppColors.black4,),
                                      Padding(
                                        padding: const EdgeInsets.only(left:4.0,right: 4.0,bottom: 3),
                                        child: Text(Strings.dummyText2, style:customTextStyle(10.0,FontWeight.w400,AppColors.black3,2)),
                                      ),
                                    ],)
                                  ],
                                ),
                            ),
                          ),
                  );
                }
              ),)
            ],
          ),
        ),
      ),
    );
  }
}