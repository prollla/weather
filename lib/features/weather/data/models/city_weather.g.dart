// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityWeather _$CityWeatherFromJson(Map<String, dynamic> json) => CityWeather(
      location: json['location'] == null
          ? null
          : LocationBean.fromJson(json['location'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : CurrentBean.fromJson(json['current'] as Map<String, dynamic>),
      forecast: json['forecast'] == null
          ? null
          : ForecastBean.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CityWeatherToJson(CityWeather instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'forecast': instance.forecast,
    };

ForecastBean _$ForecastBeanFromJson(Map<String, dynamic> json) => ForecastBean(
      forecastday: (json['forecastday'] as List<dynamic>?)
          ?.map((e) => ForecastdayBean.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastBeanToJson(ForecastBean instance) =>
    <String, dynamic>{
      'forecastday': instance.forecastday,
    };

ForecastdayBean _$ForecastdayBeanFromJson(Map<String, dynamic> json) =>
    ForecastdayBean(
      date: json['date'] as String?,
      dateEpoch: json['date_epoch'] as num?,
      day: json['day'] == null
          ? null
          : DayBean.fromJson(json['day'] as Map<String, dynamic>),
      astro: json['astro'] == null
          ? null
          : AstroBean.fromJson(json['astro'] as Map<String, dynamic>),
      hour: (json['hour'] as List<dynamic>?)
          ?.map((e) => HourBean.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastdayBeanToJson(ForecastdayBean instance) =>
    <String, dynamic>{
      'date': instance.date,
      'date_epoch': instance.dateEpoch,
      'day': instance.day,
      'astro': instance.astro,
      'hour': instance.hour,
    };

HourBean _$HourBeanFromJson(Map<String, dynamic> json) => HourBean(
      timeEpoch: json['time_epoch'] as num?,
      time: json['time'] as String?,
      tempC: json['temp_c'] as num?,
      tempF: json['temp_f'] as num?,
      isDay: json['is_day'] as num?,
      condition: json['condition'] == null
          ? null
          : ConditionBean.fromJson(json['condition'] as Map<String, dynamic>),
      windMph: json['wind_mph'] as num?,
      windKph: json['wind_kph'] as num?,
      windDegree: json['wind_degree'] as num?,
      windDir: json['wind_dir'] as String?,
      pressureMb: json['pressure_mb'] as num?,
      pressureIn: json['pressure_in'] as num?,
      precipMm: json['precip_mm'] as num?,
      precipIn: json['precip_in'] as num?,
      humidity: json['humidity'] as num?,
      cloud: json['cloud'] as num?,
      feelslikeC: json['feelslike_c'] as num?,
      feelslikeF: json['feelslike_f'] as num?,
      windchillC: json['windchill_c'] as num?,
      windchillF: json['windchill_f'] as num?,
      heatindexC: json['heatindex_c'] as num?,
      heatindexF: json['heatindex_f'] as num?,
      dewpointC: json['dewpoint_c'] as num?,
      dewpointF: json['dewpoint_f'] as num?,
      willItRain: json['will_it_rain'] as num?,
      chanceOfRain: json['chance_of_rain'] as num?,
      willItSnow: json['will_it_snow'] as num?,
      chanceOfSnow: json['chance_of_snow'] as num?,
      visKm: json['vis_km'] as num?,
      visMiles: json['vis_miles'] as num?,
      gustMph: json['gust_mph'] as num?,
      gustKph: json['gust_kph'] as num?,
      uv: json['uv'] as num?,
    );

Map<String, dynamic> _$HourBeanToJson(HourBean instance) => <String, dynamic>{
      'time_epoch': instance.timeEpoch,
      'time': instance.time,
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'is_day': instance.isDay,
      'condition': instance.condition,
      'wind_mph': instance.windMph,
      'wind_kph': instance.windKph,
      'wind_degree': instance.windDegree,
      'wind_dir': instance.windDir,
      'pressure_mb': instance.pressureMb,
      'pressure_in': instance.pressureIn,
      'precip_mm': instance.precipMm,
      'precip_in': instance.precipIn,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feelslike_c': instance.feelslikeC,
      'feelslike_f': instance.feelslikeF,
      'windchill_c': instance.windchillC,
      'windchill_f': instance.windchillF,
      'heatindex_c': instance.heatindexC,
      'heatindex_f': instance.heatindexF,
      'dewpoint_c': instance.dewpointC,
      'dewpoint_f': instance.dewpointF,
      'will_it_rain': instance.willItRain,
      'chance_of_rain': instance.chanceOfRain,
      'will_it_snow': instance.willItSnow,
      'chance_of_snow': instance.chanceOfSnow,
      'vis_km': instance.visKm,
      'vis_miles': instance.visMiles,
      'gust_mph': instance.gustMph,
      'gust_kph': instance.gustKph,
      'uv': instance.uv,
    };

AstroBean _$AstroBeanFromJson(Map<String, dynamic> json) => AstroBean(
      sunrise: json['sunrise'] as String?,
      sunset: json['sunset'] as String?,
      moonrise: json['moonrise'] as String?,
      moonset: json['moonset'] as String?,
      moonPhase: json['moon_phase'] as String?,
      moonIllumination: json['moon_illumination'] as String?,
      isMoonUp: json['is_moon_up'] as num?,
      isSunUp: json['is_sun_up'] as num?,
    );

Map<String, dynamic> _$AstroBeanToJson(AstroBean instance) => <String, dynamic>{
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'moon_phase': instance.moonPhase,
      'moon_illumination': instance.moonIllumination,
      'is_moon_up': instance.isMoonUp,
      'is_sun_up': instance.isSunUp,
    };

DayBean _$DayBeanFromJson(Map<String, dynamic> json) => DayBean(
      maxtempC: json['maxtemp_c'] as num?,
      maxtempF: json['maxtemp_f'] as num?,
      mintempC: json['mintemp_c'] as num?,
      mintempF: json['mintemp_f'] as num?,
      avgtempC: json['avgtemp_c'] as num?,
      avgtempF: json['avgtemp_f'] as num?,
      maxwindMph: json['maxwind_mph'] as num?,
      maxwindKph: json['maxwind_kph'] as num?,
      totalprecipMm: json['totalprecip_mm'] as num?,
      totalprecipIn: json['totalprecip_in'] as num?,
      totalsnowCm: json['totalsnow_cm'] as num?,
      avgvisKm: json['avgvis_km'] as num?,
      avgvisMiles: json['avgvis_miles'] as num?,
      avghumidity: json['avghumidity'] as num?,
      dailyWillItRain: json['daily_will_it_rain'] as num?,
      dailyChanceOfRain: json['daily_chance_of_rain'] as num?,
      dailyWillItSnow: json['daily_will_it_snow'] as num?,
      dailyChanceOfSnow: json['daily_chance_of_snow'] as num?,
      condition: json['condition'] == null
          ? null
          : ConditionBean.fromJson(json['condition'] as Map<String, dynamic>),
      uv: json['uv'] as num?,
    );

Map<String, dynamic> _$DayBeanToJson(DayBean instance) => <String, dynamic>{
      'maxtemp_c': instance.maxtempC,
      'maxtemp_f': instance.maxtempF,
      'mintemp_c': instance.mintempC,
      'mintemp_f': instance.mintempF,
      'avgtemp_c': instance.avgtempC,
      'avgtemp_f': instance.avgtempF,
      'maxwind_mph': instance.maxwindMph,
      'maxwind_kph': instance.maxwindKph,
      'totalprecip_mm': instance.totalprecipMm,
      'totalprecip_in': instance.totalprecipIn,
      'totalsnow_cm': instance.totalsnowCm,
      'avgvis_km': instance.avgvisKm,
      'avgvis_miles': instance.avgvisMiles,
      'avghumidity': instance.avghumidity,
      'daily_will_it_rain': instance.dailyWillItRain,
      'daily_chance_of_rain': instance.dailyChanceOfRain,
      'daily_will_it_snow': instance.dailyWillItSnow,
      'daily_chance_of_snow': instance.dailyChanceOfSnow,
      'condition': instance.condition,
      'uv': instance.uv,
    };

CurrentBean _$CurrentBeanFromJson(Map<String, dynamic> json) => CurrentBean(
      lastUpdatedEpoch: json['last_updated_epoch'] as num?,
      lastUpdated: json['last_updated'] as String?,
      tempC: json['temp_c'] as num?,
      tempF: json['temp_f'] as num?,
      isDay: json['is_day'] as num?,
      condition: json['condition'] == null
          ? null
          : ConditionBean.fromJson(json['condition'] as Map<String, dynamic>),
      windMph: json['wind_mph'] as num?,
      windKph: json['wind_kph'] as num?,
      windDegree: json['wind_degree'] as num?,
      windDir: json['wind_dir'] as String?,
      pressureMb: json['pressure_mb'] as num?,
      pressureIn: json['pressure_in'] as num?,
      precipMm: json['precip_mm'] as num?,
      precipIn: json['precip_in'] as num?,
      humidity: json['humidity'] as num?,
      cloud: json['cloud'] as num?,
      feelslikeC: json['feelslike_c'] as num?,
      feelslikeF: json['feelslike_f'] as num?,
      visKm: json['vis_km'] as num?,
      visMiles: json['vis_miles'] as num?,
      uv: json['uv'] as num?,
      gustMph: json['gust_mph'] as num?,
      gustKph: json['gust_kph'] as num?,
    );

Map<String, dynamic> _$CurrentBeanToJson(CurrentBean instance) =>
    <String, dynamic>{
      'last_updated_epoch': instance.lastUpdatedEpoch,
      'last_updated': instance.lastUpdated,
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'is_day': instance.isDay,
      'condition': instance.condition,
      'wind_mph': instance.windMph,
      'wind_kph': instance.windKph,
      'wind_degree': instance.windDegree,
      'wind_dir': instance.windDir,
      'pressure_mb': instance.pressureMb,
      'pressure_in': instance.pressureIn,
      'precip_mm': instance.precipMm,
      'precip_in': instance.precipIn,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feelslike_c': instance.feelslikeC,
      'feelslike_f': instance.feelslikeF,
      'vis_km': instance.visKm,
      'vis_miles': instance.visMiles,
      'uv': instance.uv,
      'gust_mph': instance.gustMph,
      'gust_kph': instance.gustKph,
    };

ConditionBean _$ConditionBeanFromJson(Map<String, dynamic> json) =>
    ConditionBean(
      text: json['text'] as String?,
      icon: json['icon'] as String?,
      code: json['code'] as num?,
    );

Map<String, dynamic> _$ConditionBeanToJson(ConditionBean instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'code': instance.code,
    };

LocationBean _$LocationBeanFromJson(Map<String, dynamic> json) => LocationBean(
      name: json['name'] as String?,
      region: json['region'] as String?,
      country: json['country'] as String?,
      lat: json['lat'] as num?,
      lon: json['lon'] as num?,
      tzId: json['tz_id'] as String?,
      localtimeEpoch: json['localtime_epoch'] as num?,
      localtime: json['localtime'] as String?,
    );

Map<String, dynamic> _$LocationBeanToJson(LocationBean instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
      'tz_id': instance.tzId,
      'localtime_epoch': instance.localtimeEpoch,
      'localtime': instance.localtime,
    };
