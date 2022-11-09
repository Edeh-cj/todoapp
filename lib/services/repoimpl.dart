import 'dart:convert';
import 'package:todo_mobile_application/models/weathermodel.dart';
import 'package:todo_mobile_application/repository/repo_.dart';
import 'package:todo_mobile_application/services/geolocator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class RepoImpl implements Repository{

 @override
  Future<Weathermodel> getWeather() async{
    var weatherapikey = 'ba24c6018ddd72041749018d0c1b1ef8';
    

    try { 
      Position? position = await Geo.getPosition(); 
      http.Response response = 
      await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=${position?.latitude}&lon=${position?.longitude}&appid=$weatherapikey&units=metric'));
  
      switch (response.statusCode) {
        case 200: {      
          return Weathermodel.fromJson(jsonDecode(response.body));}
       
        default: throw (response.statusCode);
      }

    } catch (e) {print(e); rethrow;}
     
  }  
  
}

