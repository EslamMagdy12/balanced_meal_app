import 'package:balanced_meal_app/features/order/domain/entity/food_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_response_dto.g.dart';

@JsonSerializable()
class FoodResponseDto {
  @JsonKey(name: "food_name")
  final String? foodName;
  @JsonKey(name: "calories")
  final int? calories;
  @JsonKey(name: "image_url")
  final String? imageUrl;

  FoodResponseDto({this.foodName, this.calories, this.imageUrl});

  factory FoodResponseDto.fromJson(Map<String, dynamic> json) {
    return _$FoodResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FoodResponseDtoToJson(this);
  }

  FoodEntity toEntity() {
    return FoodEntity(
      foodName: foodName,
      calories: calories,
      imageUrl: imageUrl,
    );
  }
}
