import 'package:balanced_meal_app/features/order/data/api/order_retrofit_client.dart';
import 'package:balanced_meal_app/features/order/data/data_source/contract/order_remote_data_source.dart';
import 'package:balanced_meal_app/features/order/data/models/food_response_dto.dart';
import 'package:balanced_meal_app/features/order/data/models/place_order_request_dto.dart';
import 'package:balanced_meal_app/features/order/data/models/place_order_response_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OrderRemoteDataSource)
class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final FirebaseFirestore _firestore;
  final OrderRetrofitClient _orderRetrofitClient;

  OrderRemoteDataSourceImpl(this._firestore, this._orderRetrofitClient);

  @override
  Future<List<FoodResponseDto>> getCarbs() async {
    return await _firestore
        .collection('carbs')
        .get()
        .then((QuerySnapshot querySnapshot) {
          return querySnapshot.docs
              .map(
                (doc) => FoodResponseDto.fromJson(
                  doc.data() as Map<String, dynamic>,
                ),
              )
              .toList();
        })
        .catchError((error) {
          throw Exception('Failed to load carbs: $error');
        });
  }

  @override
  Future<List<FoodResponseDto>> getMeats() async {
    return await _firestore
        .collection('meats')
        .get()
        .then((QuerySnapshot querySnapshot) {
          return querySnapshot.docs
              .map(
                (doc) => FoodResponseDto.fromJson(
                  doc.data() as Map<String, dynamic>,
                ),
              )
              .toList();
        })
        .catchError((error) {
          throw Exception('Failed to load meats: $error');
        });
  }

  @override
  Future<List<FoodResponseDto>> getVegetables() async {
    return await _firestore
        .collection('vegetables')
        .get()
        .then((QuerySnapshot querySnapshot) {
          return querySnapshot.docs
              .map(
                (doc) => FoodResponseDto.fromJson(
                  doc.data() as Map<String, dynamic>,
                ),
              )
              .toList();
        })
        .catchError((error) {
          throw Exception('Failed to load vegetables: $error');
        });
  }

  @override
  Future<PlaceOrderResponseDto> placeOrder(PlaceOrderRequestDto request) async {
    return await _orderRetrofitClient.placeOrder(request);
  }
}
