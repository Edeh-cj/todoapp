import 'package:flutter/material.dart';
import '/getit.dart';
import '/models/weathermodel.dart';
import '/repository/repo_.dart';


class WeatherNotifier extends ChangeNotifier{
  String _description = '-', _city = '-', _temp = '-°C';
  Icon _icon = const Icon(Icons.cloud);
  
  String get description => _description;
  String get city => _city;
  String get temp => _temp;
  Icon get icon => _icon;

  getweather() async{

    try{
      Weathermodel dto = await locator<Repository>().getWeather();
      _city = dto.city;
      _description = dto.description;
      _temp = '${(dto.temp).round()}°C';
      _icon = weathericons(dto.iconcode);
    } catch(e) {rethrow;}
    
    notifyListeners();
  }
}

Icon weathericons (String value){
  switch (value){
    case '01d' :{
      return const Icon(Icons.sunny);
    }
    case '01n' :{
      return const Icon(Icons.nightlight);
    }
    case '02n' :{
      return const Icon(Icons.nightlight);
    }
    case '02d' :{
      return const Icon(Icons.nightlight);
    }
    case '03n' :{
      return const Icon(Icons.nightlight);
    }
    case '03d' :{
      return const Icon(Icons.nightlight);
    }
    case '04n' :{
      return const Icon(Icons.nightlight);
    }
    case '04d' :{
      return const Icon(Icons.nightlight);
    }
    case '09n' :{
      return const Icon(Icons.nightlight);
    }
    case '09d' :{
      return const Icon(Icons.nightlight);
    }
    case '10n' :{
      return const Icon(Icons.nightlight);
    }
    case '10d' :{
      return const Icon(Icons.nightlight);
    }
    case '11d' :{
      return const Icon(Icons.nightlight);
    }
    case '13n' :{
      return const Icon(Icons.nightlight);
    }
    case '13d' :{
      return const Icon(Icons.nightlight);
    }
    case '50d' :{
      return const Icon(Icons.nightlight);
    }
    case '50n' :{
      return const Icon(Icons.nightlight);
    }
    default:{
      return const Icon(Icons.cloud);
    }
  }
}

