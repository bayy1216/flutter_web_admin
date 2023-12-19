import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/const/data.dart';
import 'dio.dart';



part 'dio_client.g.dart';

final dioClientProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return DioClient(dio, baseUrl: 'http://$IP');
});

@RestApi()
abstract class DioClient {
  factory DioClient(Dio dio, {String baseUrl}) = _DioClient;


}