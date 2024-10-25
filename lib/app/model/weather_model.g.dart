// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherModelImpl _$$WeatherModelImplFromJson(Map<String, dynamic> json) =>
    _$WeatherModelImpl(
      statusCode: (json['statusCode'] as num?)?.toInt() ?? 0,
      coord: json['coord'] == null
          ? null
          : CoordObject.fromJson(json['coord'] as Map<String, dynamic>),
      base: json['base'] as String? ?? '',
      main: json['main'] == null
          ? null
          : MainObject.fromJson(json['main'] as Map<String, dynamic>),
      wind: json['wind'] == null
          ? null
          : WindObject.fromJson(json['wind'] as Map<String, dynamic>),
      visibility: (json['visibility'] as num?)?.toInt() ?? 0,
      dt: (json['dt'] as num?)?.toInt() ?? 0,
      timezone: (json['timezone'] as num?)?.toInt() ?? 0,
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      cod: (json['cod'] as num?)?.toInt() ?? 0,
      clouds: json['clouds'] == null
          ? null
          : CloudsObject.fromJson(json['clouds'] as Map<String, dynamic>),
      sys: json['sys'] == null
          ? null
          : SysObject.fromJson(json['sys'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherTwoObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WeatherModelImplToJson(_$WeatherModelImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'coord': instance.coord,
      'base': instance.base,
      'main': instance.main,
      'wind': instance.wind,
      'visibility': instance.visibility,
      'dt': instance.dt,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
      'clouds': instance.clouds,
      'sys': instance.sys,
      'weather': instance.weather,
    };

_$CoordObjectImpl _$$CoordObjectImplFromJson(Map<String, dynamic> json) =>
    _$CoordObjectImpl(
      lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$CoordObjectImplToJson(_$CoordObjectImpl instance) =>
    <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };

_$WeatherTwoObjectImpl _$$WeatherTwoObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$WeatherTwoObjectImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      main: json['main'] as String? ?? '',
      description: json['description'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
    );

Map<String, dynamic> _$$WeatherTwoObjectImplToJson(
        _$WeatherTwoObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

_$MainObjectImpl _$$MainObjectImplFromJson(Map<String, dynamic> json) =>
    _$MainObjectImpl(
      temp: (json['temp'] as num?)?.toDouble() ?? 0.0,
      feels_like: (json['feels_like'] as num?)?.toDouble() ?? 0.0,
      temp_min: (json['temp_min'] as num?)?.toDouble() ?? 0.0,
      temp_max: (json['temp_max'] as num?)?.toDouble() ?? 0.0,
      pressure: (json['pressure'] as num?)?.toInt() ?? 0,
      humidity: (json['humidity'] as num?)?.toInt() ?? 0,
      sea_level: (json['sea_level'] as num?)?.toInt() ?? 0,
      grnd_level: (json['grnd_level'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$MainObjectImplToJson(_$MainObjectImpl instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'sea_level': instance.sea_level,
      'grnd_level': instance.grnd_level,
    };

_$WindObjectImpl _$$WindObjectImplFromJson(Map<String, dynamic> json) =>
    _$WindObjectImpl(
      speed: (json['speed'] as num?)?.toDouble() ?? 0.0,
      deg: (json['deg'] as num?)?.toInt() ?? 0,
      gust: (json['gust'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$WindObjectImplToJson(_$WindObjectImpl instance) =>
    <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };

_$CloudsObjectImpl _$$CloudsObjectImplFromJson(Map<String, dynamic> json) =>
    _$CloudsObjectImpl(
      all: (json['all'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$CloudsObjectImplToJson(_$CloudsObjectImpl instance) =>
    <String, dynamic>{
      'all': instance.all,
    };

_$SysObjectImpl _$$SysObjectImplFromJson(Map<String, dynamic> json) =>
    _$SysObjectImpl(
      type: (json['type'] as num?)?.toInt() ?? 0,
      id: (json['id'] as num?)?.toInt() ?? 0,
      country: json['country'] as String? ?? '',
      sunrise: (json['sunrise'] as num?)?.toInt() ?? 0,
      sunset: (json['sunset'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SysObjectImplToJson(_$SysObjectImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
