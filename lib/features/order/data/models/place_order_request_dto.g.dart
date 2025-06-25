// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderRequestDto _$PlaceOrderRequestDtoFromJson(
  Map<String, dynamic> json,
) => PlaceOrderRequestDto(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => ItemsDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PlaceOrderRequestDtoToJson(
  PlaceOrderRequestDto instance,
) => <String, dynamic>{'items': instance.items};
