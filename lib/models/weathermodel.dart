class Weathermodel{
  final String city, iconcode, description;
  final double temp;
  Weathermodel(this.city, this.iconcode, this.description, this.temp);
  
  factory Weathermodel.fromJson(Map<String, dynamic> json){
    return Weathermodel(
      json['name'], 
      json['weather'][0]['icon'], 
      json['weather'][0]['description'], 
      json['main']['temp']
      );
  }
}