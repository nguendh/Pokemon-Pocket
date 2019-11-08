class PokemonResponse {
  List<Pokemon> results = List();

  static PokemonResponse fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    PokemonResponse pokemonBean = PokemonResponse();
    pokemonBean.results = List()
      ..addAll((map['results'] as List ?? []).map((o) => Pokemon.fromMap(o)));
    return pokemonBean;
  }

  Map toJson() => {
        "results": results,
      };
}

/// national_number : "001"
/// evolution : null
/// sprites : {"normal":"https://img.pokemondb.net/sprites/omega-ruby-alpha-sapphire/dex/normal/bulbasaur.png","large":"https://img.pokemondb.net/artwork/bulbasaur.jpg","animated":"https://img.pokemondb.net/sprites/black-white/anim/normal/bulbasaur.gif"}
/// name : "Bulbasaur"
/// type : ["Grass","Poison"]
/// total : 318
/// hp : 45
/// attack : 49
/// defense : 49
/// sp_atk : 65
/// sp_def : 65
/// speed : 45

class Pokemon {
  String nationalNumber;
  SpritesBean sprites;
  String name;
  List<String> type;
  int total;
  int hp;
  int attack;
  int defense;
  int spAtk;
  int spDef;
  int speed;

  static Pokemon fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Pokemon resultsBean = Pokemon();
    resultsBean.nationalNumber = map['national_number'];
    resultsBean.sprites = SpritesBean.fromMap(map['sprites']);
    resultsBean.name = map['name'];
    resultsBean.type = List()
      ..addAll((map['type'] as List ?? []).map((o) => o.toString()));
    resultsBean.total = map['total'];
    resultsBean.hp = map['hp'];
    resultsBean.attack = map['attack'];
    resultsBean.defense = map['defense'];
    resultsBean.spAtk = map['sp_atk'];
    resultsBean.spDef = map['sp_def'];
    resultsBean.speed = map['speed'];
    return resultsBean;
  }

  Map toJson() => {
        "national_number": nationalNumber,
        "sprites": sprites,
        "name": name,
        "type": type,
        "total": total,
        "hp": hp,
        "attack": attack,
        "defense": defense,
        "sp_atk": spAtk,
        "sp_def": spDef,
        "speed": speed,
      };
}

/// normal : "https://img.pokemondb.net/sprites/omega-ruby-alpha-sapphire/dex/normal/bulbasaur.png"
/// large : "https://img.pokemondb.net/artwork/bulbasaur.jpg"
/// animated : "https://img.pokemondb.net/sprites/black-white/anim/normal/bulbasaur.gif"

class SpritesBean {
  String normal;
  String large;
  String animated;

  static SpritesBean fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    SpritesBean spritesBean = SpritesBean();
    spritesBean.normal = map['normal'];
    spritesBean.large = map['large'];
    spritesBean.animated = map['animated'];
    return spritesBean;
  }

  Map toJson() => {
        "normal": normal,
        "large": large,
        "animated": animated,
      };
}
