import 'package:flutter/material.dart';
import 'package:yasam_suresi/calculater.dart';
import 'package:yasam_suresi/costants.dart';
import 'package:yasam_suresi/user_data.dart';
import 'calculater.dart';

class resultPage extends StatelessWidget {
final UserData _userData;
resultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("resultPage"),),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 8,
              child:Center(child:Text(Calculater(_userData).hesaplama().toString(),//bu kisimda alinan veriler gosterilir
                style: myMetinStyle,))) ,//veriyi almak icin birinci sayfadan
          Expanded(child: FlatButton(color:Colors.white,onPressed:(){
            Navigator.pop(context); //bu kode butona tiklandiginda geri gonderir
          }, child:Text("Back",style: myMetinStyle,)))
          
        ],
      ),
    );
  }
}
