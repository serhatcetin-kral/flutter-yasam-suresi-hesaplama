
import 'package:yasam_suresi/user_data.dart';

class Calculater{

late UserData _userData;
  Calculater(this._userData);


  double hesaplama(){

    double sonuc;
    sonuc=90+_userData.sportDay-_userData.smokingcigarette;
    sonuc=sonuc+(_userData.length/_userData.weight);
    if(_userData.selectedGender=="woman"){
      return sonuc+3;

    }
    else{
      return sonuc;
    }
        return 2;

}

}