import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DetailScreen.dart';
import 'api/PokemonService.dart';
import 'model/PokemonResponse.dart';

class MasterScreen extends StatefulWidget {
  MasterScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MasterScreenState();
}

class MasterScreenState extends State<MasterScreen> {
  var _allPokemon = List<Pokemon>();

  @override
  void initState() {
    super.initState();
    _loadAllPokemon();
  }

  @override
  Widget build(BuildContext context) => Scaffold(body: _getBody());

  _getBody() => _isLoadingDialog() ? _makeProgressDialog() : _contentView();

  _isLoadingDialog() => _allPokemon.length == 0;

  _contentView() => new OrientationBuilder(builder: (context, orientation) {
        return _makeListView(orientation);
      });

  GridView _makeListView(Orientation orientation) {
    var crossAxisCount = orientation == Orientation.portrait ? 2 : 4;
    var gridDelegate = new SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      childAspectRatio: 2.0,
    );

    return GridView.builder(
        itemCount: _allPokemon.length,
        gridDelegate: gridDelegate,
        itemBuilder: (BuildContext context, int position) {
          return _makeCellItem(_allPokemon[position]);
        });
  }

  _makeProgressDialog() => Center(child: CircularProgressIndicator());

  void _loadAllPokemon() {
    PokemonService.fetchJson().then((list) {
      setState(() {
        _allPokemon = _removeDuplicatedItems(list);
      });
    }, onError: (e) {
      setState(() {
        _allPokemon = null;
      });
    });
  }

  bool _isNotContain(List<Pokemon> list, Pokemon item) =>
      list.every((i) => i.nationalNumber != item.nationalNumber);

  List<Pokemon> _removeDuplicatedItems(List<Pokemon> list) {
    var allPokemon = List<Pokemon>();
    for (int i = 0; i < list.length; i++) {
      final Pokemon item = list[i];
      if (_isNotContain(allPokemon, item)) {
        allPokemon.add(item);
      }
    }
    return allPokemon;
  }

  CachedNetworkImage _imagePreview(Pokemon pokemon) => CachedNetworkImage(
        imageUrl: pokemon.sprites.imagePreview(),
        width: 64,
        height: 64,
        errorWidget: (context, url, error) => Image.network(
          pokemon.sprites.large,
          width: 64,
          height: 64,
        ),
      );

  Widget _makeCellItem(Pokemon pokemon) {
    return Center(
      child: ListTile(
        leading: _imagePreview(pokemon),
        title: Text(pokemon.name),
        dense: true,
        subtitle: Text(pokemon.nationalNumber),
        onTap: () {
          _viewPokemonDetail(pokemon);
        },
      ),
    );
  }

  void _viewPokemonDetail(Pokemon pokemon) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailScreen(pokemon: pokemon)));
  }
}
