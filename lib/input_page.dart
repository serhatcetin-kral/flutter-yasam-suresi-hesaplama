import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_suresi/costants.dart';
import 'package:yasam_suresi/resultPage.dart';
import 'package:yasam_suresi/user_data.dart';
import 'icon_gender.dart';
import 'my_container.dart';
import 'costants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late String selectedGender="null"; //ben yaptim intialize icin null i
  double smokingcigarette=0.0;
  double sportDay=0.0;
  int length=170;
  int weight=73;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
          child: Row(
            children: [
              Expanded(

                child: MyContainer(
                  child: buildRowOutLinedButton("length"),
                ),
              ),
              Expanded(
                child: MyContainer(child: buildRowOutLinedButton("weight"),),
              )
            ],
          ),
        ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('how many days a week do you exercise',style: TextStyle(fontSize: 20),)
                  ,Text(sportDay.round().toString(),style:myNumberStyle),
                  Slider(
                    min: 0,
                    max:7,
                    value: sportDay,
                    onChanged: (double newValue){
                      setState(() {
                        sportDay=newValue;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("DO YOU SMOKE",style: TextStyle(fontSize: 20),),Text(
              smokingcigarette.round().toString(),
                //  '${smokingcigarette.round()}',
                style:myNumberStyle
              ),
    Slider(
    min: 0,
    max: 30,
        value: smokingcigarette,
      onChanged:(double newValue){
      setState(() {
    smokingcigarette=newValue;
      });
      } ,
    )
    ],
            ),),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                  onPress: (){
                    setState(() {
                      selectedGender='woman';
                    });
                  },
                       renk: selectedGender=="woman"?Colors.lightBlue:Colors.white,
                      child:IconGender(gender:"WOMAN",icon:FontAwesomeIcons.venus)
                  )
                ), Expanded(
                  child: MyContainer(
                   onPress: (){
                     setState(() {
                       selectedGender='man';
                     });
                   },
                    renk: selectedGender=="man"?Colors.lightBlue:Colors.white,
                    child: IconGender(gender: "MAN", icon: FontAwesomeIcons.mars,),
                  ),
                )
              ],
            ),
          ),
        ButtonTheme(height:50,child: FlatButton(color:Colors.white,onPressed:(){
         // Navigator.push(context,MaterialPageRoute(builder: (context)=>resultPage()));//bu kod baska sayfaya gitmeyi saglar
          Navigator.push(context,MaterialPageRoute(builder: (context)=>resultPage(
            UserData(weight: weight, smokingcigarette: smokingcigarette, length: length, sportDay: sportDay, selectedGender: selectedGender)

          )));
        }, child: Text("Calculate",style:myMetinStyle,)))


        ],

      ),
    );
  }

  Row buildRowOutLinedButton(String label) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  RotatedBox(quarterTurns:-1,child: Text(label=="length"?"length":"weight",style: myMetinStyle,)),
                  SizedBox(width: 7,),
                  RotatedBox(quarterTurns:-1,child: Text(label=="length"?length.toString():weight.toString(),style: myNumberStyle,)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ButtonTheme(minWidth:36,child: OutlinedButton(onPressed:(){setState(() {
                      label=="length"?length++:weight++;

                    });;},
                      child:Icon(FontAwesomeIcons.plus,size: 15,),)),
                       //button theme  boyutlari ayarlamak icin
                  ButtonTheme(minWidth: 36,
                    child: OutlinedButton(

                        onPressed:(){setState(() {
                          label=="length"?length--:weight--;
                        });}, child:Icon(FontAwesomeIcons.minus,size: 15,)),
                  )],),
                ],);
  }
}


