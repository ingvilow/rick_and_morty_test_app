import 'package:dio/dio.dart';
import 'package:rick_and_morty_test_app/models/character_id/character_by_id.dart';
import 'package:rick_and_morty_test_app/models/list_characters.dart';

/// получает список персонажей из апи
class ApiService {
  final String _baseUrls = "https://rickandmortyapi.com/api";

  final _dio = Dio();

  Future<CharactersList>? fetchResultCharacters() async {
    try {
      final response = await _dio.get("$_baseUrls/character");
      if (response.statusCode == 200) {
        return CharactersList.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioError) {
        throw Exception('No Internet');
      }
    }
    throw Exception('Something unxepected occured');
  }

  /// получает одного персонажа по айди
  Future<CharactersById>? fetchResultCharactersById(int id) async {
    try {
      final response = await _dio.get("$_baseUrls/character/$id");
      if (response.statusCode == 200) {
        print(response.data);
        return CharactersById.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioError) {
        throw Exception('No Internet');
      }
    }
    throw Exception('Something unxepected occured');
  }

}
