class FoodEntity {
  final String? foodName;
  final int? calories;
  final String? imageUrl;
  final int? price;
  final int? quantity;

  FoodEntity({
    this.foodName,
    this.calories,
    this.imageUrl,
    this.price = 12,
    this.quantity = 0,
  });
}
