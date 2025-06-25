// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsDto _$ItemsDtoFromJson(Map<String, dynamic> json) => ItemsDto(
  name: json['name'] as String?,
  totalPrice: (json['total_price'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$ItemsDtoToJson(ItemsDto instance) => <String, dynamic>{
  'name': instance.name,
  'total_price': instance.totalPrice,
  'quantity': instance.quantity,
};
