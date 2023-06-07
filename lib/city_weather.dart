import 'package:json_annotation/json_annotation.dart';

part 'city_weather.g.dart';

@JsonSerializable(fieldRename:FieldRename.snake)
class CityWeather {
  LocationBean? location;
  CurrentBean? current;
  ForecastBean? forecast;

  CityWeather({this.location, this.current, this.forecast});

  factory CityWeather.fromJson(Map<String, dynamic> json) => _$CityWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CityWeatherToJson(this);
}

@JsonSerializable(fieldRename:FieldRename.snake)
class ForecastBean {
  List<ForecastdayBean>? forecastday;

  ForecastBean({this.forecastday});

  factory ForecastBean.fromJson(Map<String, dynamic> json) => _$ForecastBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastBeanToJson(this);
}

@JsonSerializable(fieldRename:FieldRename.snake)
class ForecastdayBean {
  String? date;
  num? dateEpoch;
  DayBean? day;
  AstroBean? astro;
  List<HourBean>? hour;

  ForecastdayBean({this.date, this.dateEpoch, this.day, this.astro, this.hour});

  factory ForecastdayBean.fromJson(Map<String, dynamic> json) => _$ForecastdayBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastdayBeanToJson(this);
}

@JsonSerializable(fieldRename:FieldRename.snake)
class HourBean {
  num? timeEpoch;
  String? time;
  num? tempC;
  num? tempF;
  num? isDay;
  ConditionBean? condition;
  num? windMph;
  num? windKph;
  num? windDegree;
  String? windDir;
  num? pressureMb;
  num? pressureIn;
  num? precipMm;
  num? precipIn;
  num? humidity;
  num? cloud;
  num? feelslikeC;
  num? feelslikeF;
  num? windchillC;
  num? windchillF;
  num? heatindexC;
  num? heatindexF;
  num? dewpointC;
  num? dewpointF;
  num? willItRain;
  num? chanceOfRain;
  num? willItSnow;
  num? chanceOfSnow;
  num? visKm;
  num? visMiles;
  num? gustMph;
  num? gustKph;
  num? uv;

  HourBean({this.timeEpoch, this.time, this.tempC, this.tempF, this.isDay, this.condition, this.windMph, this.windKph, this.windDegree, this.windDir, this.pressureMb, this.pressureIn, this.precipMm, this.precipIn, this.humidity, this.cloud, this.feelslikeC, this.feelslikeF, this.windchillC, this.windchillF, this.heatindexC, this.heatindexF, this.dewpointC, this.dewpointF, this.willItRain, this.chanceOfRain, this.willItSnow, this.chanceOfSnow, this.visKm, this.visMiles, this.gustMph, this.gustKph, this.uv});

  factory HourBean.fromJson(Map<String, dynamic> json) => _$HourBeanFromJson(json);

  Map<String, dynamic> toJson() => _$HourBeanToJson(this);
}

@JsonSerializable(fieldRename:FieldRename.snake)
class AstroBean {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  String? moonIllumination;
  num? isMoonUp;
  num? isSunUp;

  AstroBean({this.sunrise, this.sunset, this.moonrise, this.moonset, this.moonPhase, this.moonIllumination, this.isMoonUp, this.isSunUp});

  factory AstroBean.fromJson(Map<String, dynamic> json) => _$AstroBeanFromJson(json);

  Map<String, dynamic> toJson() => _$AstroBeanToJson(this);
}

@JsonSerializable(fieldRename:FieldRename.snake)
class DayBean {
  num? maxtempC;
  num? maxtempF;
  num? mintempC;
  num? mintempF;
  num? avgtempC;
  num? avgtempF;
  num? maxwindMph;
  num? maxwindKph;
  num? totalprecipMm;
  num? totalprecipIn;
  num? totalsnowCm;
  num? avgvisKm;
  num? avgvisMiles;
  num? avghumidity;
  num? dailyWillItRain;
  num? dailyChanceOfRain;
  num? dailyWillItSnow;
  num? dailyChanceOfSnow;
  ConditionBean? condition;
  num? uv;

  DayBean({this.maxtempC, this.maxtempF, this.mintempC, this.mintempF, this.avgtempC, this.avgtempF, this.maxwindMph, this.maxwindKph, this.totalprecipMm, this.totalprecipIn, this.totalsnowCm, this.avgvisKm, this.avgvisMiles, this.avghumidity, this.dailyWillItRain, this.dailyChanceOfRain, this.dailyWillItSnow, this.dailyChanceOfSnow, this.condition, this.uv});

  factory DayBean.fromJson(Map<String, dynamic> json) => _$DayBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DayBeanToJson(this);
}

@JsonSerializable(fieldRename:FieldRename.snake)
class CurrentBean {
  num? lastUpdatedEpoch;
  String? lastUpdated;
  num? tempC;
  num? tempF;
  num? isDay;
  ConditionBean? condition;
  num? windMph;
  num? windKph;
  num? windDegree;
  String? windDir;
  num? pressureMb;
  num? pressureIn;
  num? precipMm;
  num? precipIn;
  num? humidity;
  num? cloud;
  num? feelslikeC;
  num? feelslikeF;
  num? visKm;
  num? visMiles;
  num? uv;
  num? gustMph;
  num? gustKph;

  CurrentBean({this.lastUpdatedEpoch, this.lastUpdated, this.tempC, this.tempF, this.isDay, this.condition, this.windMph, this.windKph, this.windDegree, this.windDir, this.pressureMb, this.pressureIn, this.precipMm, this.precipIn, this.humidity, this.cloud, this.feelslikeC, this.feelslikeF, this.visKm, this.visMiles, this.uv, this.gustMph, this.gustKph});

  factory CurrentBean.fromJson(Map<String, dynamic> json) => _$CurrentBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentBeanToJson(this);
}

@JsonSerializable(fieldRename:FieldRename.snake)
class ConditionBean {
  String? text;
  String? icon;
  num? code;

  ConditionBean({this.text, this.icon, this.code});

  factory ConditionBean.fromJson(Map<String, dynamic> json) => _$ConditionBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionBeanToJson(this);
}

@JsonSerializable(fieldRename:FieldRename.snake)
class LocationBean {
  String? name;
  String? region;
  String? country;
  num? lat;
  num? lon;
  String? tzId;
  num? localtimeEpoch;
  String? localtime;

  LocationBean({this.name, this.region, this.country, this.lat, this.lon, this.tzId, this.localtimeEpoch, this.localtime});

  factory LocationBean.fromJson(Map<String, dynamic> json) => _$LocationBeanFromJson(json);

  Map<String, dynamic> toJson() => _$LocationBeanToJson(this);
}

