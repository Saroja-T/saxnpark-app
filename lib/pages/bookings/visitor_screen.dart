import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/landing/landing_bloc.dart';
import '../../commons/custom_app_bar.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class VisitorScreen extends StatefulWidget 
{
  const VisitorScreen({super.key});
  @override
  State<VisitorScreen> createState() => _VisitorScreenState();
}

class _VisitorScreenState extends State<VisitorScreen> 
{
  var searchedText;
  bool countrySelected = false;
  var selectedIndex = 0;
  bool inCorrectSearch = true;
  bool starSelected = false;
  String tabLabel = "";
  List<String> titleList = [Strings.justParking,Strings.visiting];
  // Initial Selected Value 
  String? dropdownvalue;    
  
  // List of items in our dropdown menu 
  var items = [     
    'Father', 
    'Mother', 
    'Friend', 
    'Brother', 
    'Sister', 
  ]; 
  
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    tabLabel = context.watch<LandingBloc>().state.tabLabel;
    return Scaffold(
      appBar: CustomAppBarWithBack(title: Strings.bookingDetails,backText: Strings.back,tabIndex: 0,redirectionKey: Strings.rHome,),
      body:  Container(
        child:Padding(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(Strings.visitorTitle,style: customTextStyle(20, FontWeight.w500, AppColors.black1, 1),),
               const SizedBox(height: 16),
               Text(Strings.hostText,style: customTextStyle(16, FontWeight.w400, AppColors.black6, 1),),
              const SizedBox(height: 8),
               Container(
                height: 50,
                  padding: EdgeInsets.all(16),
                  margin:const EdgeInsets.only(bottom: 16),
                  decoration:  BoxDecoration(
                            borderRadius:const BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color:AppColors.grey4)
                  ),
                  child: SizedBox.expand(
                    child: 
                    DropdownButtonHideUnderline( 
  child: DropdownButton(
  hint: Text(Strings.dropDownHint,style: customTextStyle(14, FontWeight.w400, AppColors.grey10, 1),),
  value: dropdownvalue,
  onChanged: (String? newValue) { 
    setState(() { 
      dropdownvalue = newValue; 
    });
 }, 
  items: items.map<DropdownMenuItem<String>>
    ((String value) {
          return DropdownMenuItem<String>( 
            value: value, 
            child: Text(value), 
      ); 
      }).toList(), 
    )
 )
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
                      context.read<LandingBloc>().add(TabChangeEvent(
                      tabIndex: 1, tabLabel: Strings.rVehicleType));
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


showBrandsBottomSheet() 
{
    return Container(
      height:200,
      width: double.infinity,
      color: Colors.green,
      child: Text("test"),
    );
} 




