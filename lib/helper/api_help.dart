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

  Future<dynamic> getEventTravel() async {
    Map<String, dynamic> params = {
      'geolocation': '13.7222793,100.528923',
      'sortby': 'distance',
      'numberOfResult': 10,
      'pagenumber': 1,
      'filterByUpdateDate': '2019/09/01-2021/12/31',
    };

    var response = await Dio().get(
      '$baseURL/events',
      queryParameters: params,
      options: Options(
        headers: {
          "Authorization": "Bearer $keyApi",
          "Content-Type": "application/json, text/json",
          'Accept-Language': 'th'
        },
      ),
    );
    return response.data['result'] == null ? [] : response.data['result'];
  }

  Future<Map<String, dynamic>> getEventTravelById(String eventId) async {
    var response = await Dio().get(
      '$baseURL/events/$eventId',
      options: Options(
        headers: {
          "Authorization": "Bearer $keyApi",
          "Content-Type": "application/json, text/json",
          'Accept-Language': 'th'
        },
      ),
    );
    Map<String, dynamic> result = response.data['result'];
    return result;
  }
}
