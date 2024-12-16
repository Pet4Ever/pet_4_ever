import 'package:dio/dio.dart';

class VworldRepository {
  final Dio _client = Dio(BaseOptions(
    validateStatus: (status) => true,
  ));
  final API_KEY = "84EB70D3-51C5-3840-BDEF-C11273BA4C63";

  Future<List<String>> findByLatLng(double lat, double lng) async {
    final response = await _client.get(
      'https://api.vworld.kr/req/data',
      queryParameters: {
        'request': 'GetFeature',
        'key': API_KEY,
        'data': 'LT_C_ADEMD_INFO',
        'geomFilter': 'POINT($lng $lat)',
        'geometry': false,
        'size': 100,
      },
    );

    if (response.statusCode == 200 &&
        response.data['response']['status'] == 'OK') {
      final features =
          response.data['response']['result']['featureCollection']['features'];
      final featureList = List.from(features);
      final iterable = featureList.map((item) {
        return '${item['properties']['full_nm']}';
      });
      return iterable.toList();
    }

    return [];
  }
}
