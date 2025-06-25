import 'package:balanced_meal_app/features/order/data/models/items_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_order_request_dto.g.dart';

@JsonSerializable()
class PlaceOrderRequestDto {
  @JsonKey(name: "items")
  final List<ItemsDto>? items;

  PlaceOrderRequestDto({this.items});

  factory PlaceOrderRequestDto.fromJson(Map<String, dynamic> json) {
    return _$PlaceOrderRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PlaceOrderRequestDtoToJson(this);
  }
}
