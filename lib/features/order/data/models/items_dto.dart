import 'package:json_annotation/json_annotation.dart';

part 'items_dto.g.dart';

@JsonSerializable()
class ItemsDto {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "total_price")
  final int? totalPrice;
  @JsonKey(name: "quantity")
  final int? quantity;

  ItemsDto({this.name, this.totalPrice, this.quantity});

  factory ItemsDto.fromJson(Map<String, dynamic> json) {
    return _$ItemsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ItemsDtoToJson(this);
  }
}
