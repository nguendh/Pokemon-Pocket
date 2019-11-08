import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_pocket/model/PokemonResponse.dart';

const baseUrl =
    "https://raw.githubusercontent.com/ttpho/Pokemon-Pocket/master/datas/pokemons.json";

class PokemonService {
  static Future<List<Pokemon>> fetchJson() async {
    final response = await http.get(baseUrl);

    return compute(_parseJson, response.body);
  }

  static List<Pokemon> _parseJson(String response) {
    final responseJson = json.decode(response);
    final pokemonResponse = PokemonResponse.fromMap(responseJson);
    return pokemonResponse.results;
  }
}
