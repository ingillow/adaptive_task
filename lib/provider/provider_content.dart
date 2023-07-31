import 'dart:math';

import 'package:adaptive_task/api_service/api_service.dart';
import 'package:adaptive_task/model/rick_morty_char.dart';
import 'package:flutter/material.dart';

class ContentProvider extends ChangeNotifier {
  ApiService _apiService = ApiService();
  final List<RickMortyCharacter> _characters = [];
  List<RickMortyCharacter> get characters => _characters;


  bool _isLoading = false;
  bool get isLoading =>_isLoading;
  bool _hasError = false;
  bool get hasError => _hasError;

  String _name = '';
  String get name => _name;

  String _image = '';
  String get image => _image;

  String _species = '';
  String get species => _species;



  /// получить список персонажзей и переместить его в массив

  Future<RickMortyCharacter?> rickMortyCharacter() async {
    try {
      final response = await _apiService.fetchResultCharacters();
      _characters.addAll(response);
    } catch (e) {
      _hasError = true;
      notifyListeners();
      throw Exception(e.toString());
    }
    return null;
  }

  /// получить рандомное имя из АПИ
  Future<String?> getRandomCharacterName() async {
    await rickMortyCharacter();
    if (_characters.isNotEmpty) {
      final randomIndex = Random().nextInt(_characters.length);
      _name = _characters[randomIndex].name ?? '';
      return _name;
    }
    notifyListeners();
    return 'Nothing to show';
  }

  /// получить рандомное изображение из АПИ
  Future<String?> getRandomImageCharacter()async {
    await rickMortyCharacter();
    if (_characters.isNotEmpty) {
      final randomIndex = Random().nextInt(_characters.length);
      _image = characters[randomIndex].image ?? '';
      notifyListeners();
      return _image;
    }
    return 'Nothing to show';
  }

  /// получить рандомную разновидность из АПИ
  Future<String?> getRandomSpeciesCharacter() async {
    await rickMortyCharacter();
    if (_characters.isNotEmpty) {
      final randomIndex = Random().nextInt(_characters.length);
      _species = characters[randomIndex].species ?? '';
      notifyListeners();
      return _species;
    }
    return 'Nothing to show';
  }
}