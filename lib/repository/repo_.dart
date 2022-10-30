import 'package:todo_mobile_application/models/weathermodel.dart';


abstract class Repository{
  Future<Weathermodel> getWeather();
}