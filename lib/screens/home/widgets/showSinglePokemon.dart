import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedox/models/Pokemon.dart';
import 'package:pokedox/resources/color.dart';
import 'package:pokedox/resources/pokecolor.dart';
import 'package:pokedox/routers/routes.dart';
import 'package:pokedox/screens/pokemonprofile/pokemonprofile.dart';

class PokemonGrid extends StatelessWidget {
  final Pokemon pokemon;

  PokemonGrid({Key? key, required this.pokemon}) : super(key: key);
  late double _width;
  late double _height;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: (){
        Get.to(()=>PokemonProfile(pokemon: pokemon));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        decoration: BoxDecoration(
          color: PokeColor().getPokeColor(pokemon.types[0]),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: PokeColor().getPokeColor(pokemon.types[0]),
              blurRadius: 2,spreadRadius: 0
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pokemon.name,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: white, fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        pokemon.id,
                        textAlign: TextAlign.end,
                        style: TextStyle(color: white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: showTypes(pokemon.types),
                ),
              ],
            ),
            Positioned(right: 2, bottom: 2, child: _showPokemonImage()),
          ],
        ),
      ),
    );
  }

  Widget showTypes(List<String> types) {
    return ListView.builder(
      itemCount: types.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 1,
                ),
                decoration: BoxDecoration(
                    color: index==0?white.withOpacity(0.3):PokeColor().getPokeColor(types[index]).withOpacity(0.9),
                    borderRadius: BorderRadius.circular(7)),
                child: Text(
                  types[index],
                  style: TextStyle(color: white, fontSize: 12),
                  softWrap: true,
                )),
          ],
        );
      },
    );
  }

  Widget _showPokemonImage() {
    return Hero(
      tag: pokemon.id,
      child: CachedNetworkImage(
        imageUrl: pokemon.imageUrl,
        fit: BoxFit.contain,
        width: _width * 0.25,
      ),
    );
  }
}
