import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokemon_pocket/model/PokemonResponse.dart';

class PowerAttribute {
  int flex;
  String name;
  Color color;

  PowerAttribute({this.flex, this.name, this.color});

  static List<PowerAttribute> makeList(Pokemon pokemon) {
    return [
      PowerAttribute(
          flex: pokemon.hp * 100 ~/ pokemon.total,
          name: "hp",
          color: Colors.amberAccent),
      PowerAttribute(
          flex: pokemon.attack * 100 ~/ pokemon.total,
          name: "attack",
          color: Colors.blue),
      PowerAttribute(
          flex: pokemon.defense * 100 ~/ pokemon.total,
          name: "defense",
          color: Colors.red),
      PowerAttribute(
          flex: pokemon.spAtk * 100 ~/ pokemon.total,
          name: "spAtk",
          color: Colors.blueAccent),
      PowerAttribute(
          flex: pokemon.spDef * 100 ~/ pokemon.total,
          name: "spDef",
          color: Colors.redAccent),
      PowerAttribute(
          flex: pokemon.speed * 100 ~/ pokemon.total,
          name: "speed",
          color: Colors.amber),
    ];
  }
}
