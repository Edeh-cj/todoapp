import 'package:geolocator/geolocator.dart';

class Geo {
  
  static Future<Position?> getPosition() async{

    LocationPermission permission = await Geolocator.checkPermission();       
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if(permission == LocationPermission.always || permission == LocationPermission.whileInUse){
           
      if(!isServiceEnabled){
        Geolocator.openLocationSettings();
      }

      if(isServiceEnabled){
        try{
          Position position = await Geolocator.getCurrentPosition();
        return position;
        } on Exception {throw('Location Service Disabled'); }
      } else {}
    } else {
      LocationPermission request = await Geolocator.requestPermission();
      if (request == LocationPermission.always || request == LocationPermission.whileInUse){
        if(isServiceEnabled){
        try{
          Position position = await Geolocator.getCurrentPosition();
        return position;
        } on Exception {throw('Location Service Disabled');}
      }
      } else{ }
    }
    return null; 
  } 
}