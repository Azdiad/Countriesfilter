import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:countries_task/model/countries_model.dart';

class FetchCountriesService {
  final Dio _dio = Dio();

  Future<List<CountriesModel>> fetchCountries() async {
    final url = 'https://restcountries.com/v3.1/all';
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        dynamic data = response.data is String
            ? json.decode(response.data)
            : response.data;
        // log('Data received: ${data.toString()}');

        if (data is List) {
          return data.map((item) {
            // log('Item before processing to JSON: $item');
            if (item is Map<String, dynamic>) {
              return CountriesModel.fromJson(item);
            } else {
              log('Expected item to be a Map, found ${item.runtimeType}');
              throw FormatException(
                  'Expected item to be a Map, found ${item.runtimeType}');
            }
          }).toList();
        } else {
          log('Expected data to be a List, received ${data.runtimeType}');
          throw FormatException(
              'Expected data to be a List, received ${data.runtimeType}');
        }
      } else {
        log('Failed to load country data with status code: ${response.statusCode}');
        throw Exception(
            'Failed to load country data with status code: ${response.statusCode}');
      }
    } catch (e, stacktrace) {
      log('Failed to fetch countries: $e');
      log('Stack trace: $stacktrace');
      rethrow;
    }
  }
}
