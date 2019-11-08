import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_pocket/model/PowerAttribute.dart';
import 'package:pokemon_pocket/model/PokemonResponse.dart';

class DetailScreen extends StatefulWidget {
  final Pokemon pokemon;

  DetailScreen({Key key, @required this.pokemon}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var pokemon = widget.pokemon;
    return Scaffold(
        appBar: AppBar(
          title: Text(pokemon.name),
        ),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _makeFullWidthImageView(pokemon.sprites.large),
                Row(children: _createWidgets(pokemon))
              ]),
        ));
  }

  List<Widget> _createWidgets(Pokemon pokemon) => PowerAttribute.makeList(pokemon)
      .map((item) => _createItem(item.flex, item.name, item.color))
      .toList();

  Widget _createItem(int flex, String text, Color color) => Expanded(
      flex: flex,
      child: Container(
        height: 48.0,
        color: color,
        child: Center(
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white)),
        ),
      ));

  _makeFullWidthImageView(String url) => new Container(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Image.network(url, fit: BoxFit.cover));
}
