import 'package:dio/dio.dart';

class ApiHelp {
  String keyApi =
      'GOXgNajIK7yBAdfHFN7oOMs5opXgZPcGZEkM8Bi2H0AywmO1l5dwV2EZOYSR6RtJUXy4CThBjlFj4Cdj6cXLi)m=====2';

  // canHelperMe
  // CanHelpMe
  // Dio dio;
  String baseURL = 'https://tatapi.tourismthailand.org/tatapi/v5';

  Future<dynamic> getPlace() async {
    Map<String, dynamic> params = {
      'keyword': 'อาหาร',
      'location': '13.6904831,100.5226014',
      'categorycodes': 'RESTAURANT',
      'provinceName': 'Bangkok',
      'radius': 20,
      'numberOfResult': 10,
      'pagenumber': 1,
      'destination': 'Bangkok',
      'filterByUpdateDate': '2019/09/01-2021/12/31',
    };

    var response = await Dio().get('$baseURL/places/search',
        queryParameters: params,
        options: Options(headers: {
          "Authorization": "Bearer $keyApi",
          "Content-Type": "application/json, text/json",
          'Accept-Language': 'th'
        }));
    // print(response);
    return response.data['result'] == null ? [] : response.data['result'];
  }
}
