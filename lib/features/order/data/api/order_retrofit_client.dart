import 'package:balanced_meal_app/features/order/data/models/place_order_request_dto.dart';
import 'package:balanced_meal_app/features/order/data/models/place_order_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/utils/datasource_execution/api_constants.dart';

part 'order_retrofit_client.g.dart';

@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class OrderRetrofitClient {
  @factoryMethod
  factory OrderRetrofitClient(Dio dio) = _OrderRetrofitClient;

  @POST(ApiConstants.placeOrder)
  Future<PlaceOrderResponseDto> placeOrder(
    @Body() PlaceOrderRequestDto request,
  );
}
