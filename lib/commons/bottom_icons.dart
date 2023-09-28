import 'package:flutter/material.dart';

class BottomIcons extends StatelessWidget {
  final String name;
  const BottomIcons({
    Key? key,
    required this.name,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset(name,
    width: MediaQuery.of(context).size.width/20.0,
    height:MediaQuery.of(context).size.height/20.0);
  }
}