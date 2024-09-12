import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> Post(
      {required body,
      required String url,
      required String token,
      String? contentType}) async {
    var response = await dio.post(url,
        data: body,
        options: Options(
            contentType: contentType // ContentTypeFromUrlEncoded,
            ,
            headers: {"Authorization": "Bearer $token"}));

    return response;
  }
}
