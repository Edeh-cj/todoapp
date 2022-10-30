import 'package:geolocator/geolocator.dart';

class Geo {
  
  static Future<Position> getPosition() async{
    Position position =await  Geolocator.getCurrentPosition();
    return position;
  }
}