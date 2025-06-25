import 'package:json_annotation/json_annotation.dart';

part 'place_order_response_dto.g.dart';

@JsonSerializable()
class PlaceOrderResponseDto {
  @JsonKey(name: "result")
  final bool? result;

  PlaceOrderResponseDto({this.result});

  factory PlaceOrderResponseDto.fromJson(Map<String, dynamic> json) {
    return _$PlaceOrderResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PlaceOrderResponseDtoToJson(this);
  }
}
