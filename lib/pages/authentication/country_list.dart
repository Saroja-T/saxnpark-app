import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';

class CountryList extends StatefulWidget {
  const CountryList({super.key});
  @override
  State<CountryList> createState() => CountryListState();
}

class CountryListState extends State<CountryList> {
  var searchedText;
  bool countrySelected = false;
  int selectedCountryIndex = 0;
  bool inCorrectSearch = true;
  List countryList = ["2","3"];  
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    print(w! * 0.9);
    print(h);
    print(h! * 0.045);
    return SafeArea(
      child: Scaffold(
        // appBar: CustomAppBar(title: Strings.location),
        body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
                          child: Center(
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
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              })),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          Strings.countryCode,
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
                                  height: h! * 0.02,
                                ),
                                SizedBox(
                                  height: h! * 0.045,
                                  width: w! * 0.9,
                                  child: TextField(
                                    controller: searchController,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(bottom:1.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          borderSide: BorderSide.none),
                                      prefixIcon: Image.asset(
                                        searchIcon,
                                        color:
                                            const Color.fromARGB(96, 96, 96, 1),
                                      ),
                                      filled: true,
                                      fillColor: AppColors.grey1,
                                      hintStyle: const TextStyle(
                                          color: Color.fromARGB(96, 96, 96, 1),
                                          fontSize: 14.0),
                                      hintText: Strings.searchCountry,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        searchController.text = value;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 15,),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 16, 16, 0),
                                    child: ListView.builder(
                                        itemCount:10+ 1,
                                        itemBuilder: ((context, index) {
                                          if (index < 10) {
                                            return GestureDetector(
                                              onTap: (){
                                                selectedCountryIndex = index;
                                              },
                                              child: SizedBox(
                                                height: 60,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      margin: const EdgeInsets.only(left: 5,right: 5),
                                                      child: Row(children: [
                                                        Image.asset(usIcon,width: 16,height: 16,),
                                                        const SizedBox(width: 6,),
                                                        Text("+1",style: customTextStyle(14, selectedCountryIndex==index?FontWeight.w600:FontWeight.w400, AppColors.black5, 0),),
                                                        const SizedBox(width: 10,),
                                                        Text(Strings.us,
                                                        style: customTextStyle(14, selectedCountryIndex==index?FontWeight.w600:FontWeight.w400, AppColors.black5, 0),),
                                                        const Spacer(),
                                                        if(selectedCountryIndex==index)
                                                        Icon(Icons.check,size: 16,color: AppColors.black5,)
                                                      ],),
                                                    ), 
                                                    const SizedBox(height: 20,),
                                                    Container(height: 1, color: AppColors.grey4,)
                                                  ],
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Shimmer.fromColors(
                                              baseColor: Colors.grey.shade300,
                                              highlightColor: Colors.grey.shade100,
                                              child: SizedBox(
                                              height: 60,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets.only(left: 5,right: 5),
                                                    child: Row(children: [
                                                      Image.asset(usIcon,width: 16,height: 16,),
                                                      const SizedBox(width: 6,),
                                                      Container( height: 15,width: 50,color: Colors.white,),
                                                      const SizedBox(width: 10,),
                                                      Container( height: 15,width: 150,color: Colors.white,),
                                                      const Spacer(),
                                                      Icon(Icons.check,size: 16,color: AppColors.black5,)
                                                    ],),
                                                  ), 
                                                  const SizedBox(height: 20,),
                                                  Container(height: 1, color: AppColors.grey4,)
                                                ],
                                              ),
                                            ),
                                            );
                                          }
                                        })),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
