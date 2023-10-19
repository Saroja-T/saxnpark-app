import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saxnpark_app/bottomsheets/location_details.dart';
import 'package:saxnpark_app/bottomsheets/my_locations.dart';
import 'package:saxnpark_app/pages/landing_page.dart';
import 'package:saxnpark_app/utils/colors.dart';
import 'package:saxnpark_app/utils/custom_widgets.dart';
import 'package:clipboard/clipboard.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class ParkingTime extends StatefulWidget 
{
  const ParkingTime({super.key});
  @override
  State<ParkingTime> createState() => _ParkingTimeState();
}

class _ParkingTimeState extends State<ParkingTime> 
{
  var searchedText;
  bool countrySelected = false;
  var selectedIndex = 0;
  bool inCorrectSearch = true;
  bool starSelected = false;
  String tabLabel = "";
  List<String> titleList = [Strings.justParking,Strings.visiting];
  List<VehicleDetails> vehicleDetails = [VehicleDetails(vehicleName: Strings.dummyvehicle1,vehicleCategory:Strings.dummyCategory1),VehicleDetails(vehicleCategory: Strings.dummyCategoey2,vehicleName: Strings.dummyvehicle2)];

  
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    return Scaffold(
      appBar: CustomAppBarWithBack(title: Strings.bookingDetails,backText: Strings.back),
      body:  Container(
        child:Padding(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(Strings.visitVehicle,style: customTextStyle(20, FontWeight.w500, AppColors.black1, 1),),
               const SizedBox(height: 16),
              Text(Strings.driveInTime,style: customTextStyle(16, FontWeight.w400, AppColors.black1, 1),),
               const SizedBox(height: 10,),
               Container(
                  padding: EdgeInsets.all(16),
                  margin:const EdgeInsets.only(bottom: 16),
                  decoration:  BoxDecoration(
                            borderRadius:const BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: AppColors.grey4)
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Today",style: customTextStyle(14, FontWeight.w400, AppColors.black6, 1),),
                          Icon(Icons.calendar_today) ,
                        ],
                      ),
                    ],
                  ),
                 ),
               Container(
                height: 51,
                 child: SizedBox.expand(
               
                   child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(AppColors.black6),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                     RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(12.0),
                     ))),
                    onPressed: (){
                                   
                                               }, child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                 children: [
                                                   Text(Strings.next,style: customTextStyle(14, FontWeight.w600, AppColors.white, 1),),
                                                   const Icon(Icons.arrow_forward,color: Colors.white,size: 20,)
                                                 ],
                                               )),
                 ),
               ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}
class VehicleDetails{
  String? vehicleName;
  String? vehicleCategory;
    
    
  VehicleDetails({required this.vehicleName, required this.vehicleCategory});
}

showBrandsBottomSheet() 
{
    return Container(
      height:200,
      width: double.infinity,
      color: Colors.green,
      child: Text("test"),
    );
} 




