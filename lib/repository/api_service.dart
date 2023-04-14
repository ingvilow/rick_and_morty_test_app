import 'package:dio/dio.dart';
import 'package:rick_and_morty_test_app/models/list_characters.dart';

/// получает список персонажей из апи
class ApiService {
  final String _baseUrls = "https://rickandmortyapi.com/api";

  final _dio = Dio();

  Future<CharactersList>? fetchResultCharacters() async {

    try {
      final response = await _dio.get("$_baseUrls/character");
      if (response.statusCode == 200) {
        print(response.data);
        return CharactersList.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioError) {
        throw Exception('no internet');
      }
    }
    throw Exception('Somethig unxepected occured');
  }
}
