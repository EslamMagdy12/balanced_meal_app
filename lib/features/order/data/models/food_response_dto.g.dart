// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodResponseDto _$FoodResponseDtoFromJson(Map<String, dynamic> json) =>
    FoodResponseDto(
      foodName: json['food_name'] as String?,
      calories: (json['calories'] as num?)?.toInt(),
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$FoodResponseDtoToJson(FoodResponseDto instance) =>
    <String, dynamic>{
      'food_name': instance.foodName,
      'calories': instance.calories,
      'image_url': instance.imageUrl,
    };
