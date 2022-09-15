import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_suresi/costants.dart';

class IconGender extends StatelessWidget {
  late String? gender;
  late IconData? icon;
  IconGender({this.gender="woman",this.icon=FontAwesomeIcons.venus});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(icon,size: 50,color: Colors.black54,),
        SizedBox(height: 10,),
        Text(gender!,style: myMetinStyle,),],);
  }
}