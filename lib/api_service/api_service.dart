import 'package:adaptive_task/model/rick_morty_char.dart';
import 'package:dio/dio.dart';

/// выполняется запрос к АПИ для получения списка персонажей из него

class ApiService{
  static const String _baseUrls = "https://rickandmortyapi.com/api";

  final Dio _dio = Dio();


  Future<List<RickMortyCharacter>> fetchResultCharacters() async {
    try {
      final response = await _dio.get("$_baseUrls/character");
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['results'];
        final List<RickMortyCharacter> characters = data
            .map((characterJson) => RickMortyCharacter.fromJson(characterJson))
            .toList();
        return characters;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    throw Exception('Failed to fetch characters.');
  }
}