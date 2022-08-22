import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pokedox/models/Pokemon.dart';
import 'package:pokedox/resources/color.dart';
import 'package:pokedox/resources/pokecolor.dart';

class PokemonProfile extends StatelessWidget {
  Pokemon pokemon;

  PokemonProfile({Key? key, required this.pokemon}) : super(key: key);
  late double _width;
  late double _height;

  @override
  Widget build(BuildContext context) {
    Logger().wtf(pokemon.toJson());
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    double top = (_height * 0.6) - 200;
    double backgroundH = _height;
    double bottomBackgroundH = _height * 0.6;
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            height: backgroundH,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.centerRight,
                  colors: [
                    PokeColor().getPokeColor(pokemon.types[0]),
                    PokeColor().getPokeColor(pokemon.types[0]).withOpacity(0.35)
                  ]),
            ),
          ),
          Positioned(
            top: _height * 0.075,
            child: Text(
              pokemon.id,
              textAlign: TextAlign.center,
              style: TextStyle(color: white, fontSize: 26),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Positioned(
            top: _height * 0.1,
            child: Text(
              pokemon.name,
              textAlign: TextAlign.center,
              style: TextStyle(color: white, fontSize: 32),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Positioned(
            top: _height * 0.13,
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: showTypes(pokemon.types),
            ),
          ),
          Positioned(
            left: _width * 0.05,
            top: _height * 0.075,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    color: white,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: bottomBackgroundH,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50))),
              child: _showContent(),
            ),
          ),
          Positioned(
              bottom: bottomBackgroundH - _height * 0.05,
              child: _showPokemonImage()),
        ],
      ),
    );
  }

  Widget _showPokemonImage() {
    return Hero(
      tag: pokemon.id,
      child: CachedNetworkImage(
        imageUrl: pokemon.imageUrl,
        fit: BoxFit.contain,
        width: _width * 0.5,
      ),
    );
  }

  Widget showTypes(List<String> types) {
    return ListView.builder(
      itemCount: types.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                margin: const EdgeInsets.only(right: 5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 1,
                ),
                decoration: BoxDecoration(
                    color: index == 0
                        ? white.withOpacity(0.3)
                        : PokeColor()
                            .getPokeColor(types[index])
                            .withOpacity(0.9),
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

  Widget _showContent() {
    Widget heightSpace = SizedBox(
      height: _height * 0.015,
    );
    double weightinKg = double.parse(pokemon.weight.split(" ").first) / 2.204;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: _width * 0.1, vertical: _height * 0.025),
      child: ListView(
        children: [
          Text(
            pokemon.xDescription,
            style: TextStyle(color: black, fontSize: 14),
          ),
          heightSpace,
          showTitle("About"),
          Divider(
            color: black.withOpacity(0.25),
          ),
          showSinlgeInfo("Species", pokemon.category),
          heightSpace,
          showSinlgeInfo("Height", pokemon.height),
          heightSpace,
          showSinlgeInfo("Weight",
              "${pokemon.weight}(${weightinKg.toStringAsFixed(1)} kg)"),
          heightSpace,
          showSinlgeInfo(
              "Abilities",
              pokemon.abilities
                  .toString()
                  .replaceAll("[", "")
                  .replaceAll("]", "")),
          heightSpace,
          heightSpace,
          showTitle("Breeding"),
          Divider(
            color: black.withOpacity(0.25),
          ),
          showSinlgeInfo("Egg Groups", pokemon.eggGroups ?? "-"),
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "Gender",
                  style: TextStyle(color: black.withOpacity(0.5), fontSize: 16),
                ),
              ),
              Flexible(
                flex: 4,
                child: Row(
                  children: [
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.mars,
                          size: 18,
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          pokemon.genderMalePercentage ?? "-",
                          style: TextStyle(color: black, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: _width * 0.05,
                    ),
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.venus,
                          size: 18,
                          color: Colors.pink,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          pokemon.genderFemalePercentage ?? "-",
                          style: TextStyle(color: black, fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          heightSpace,
        ],
      ),
    );
  }

  Widget showSinlgeInfo(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(color: black.withOpacity(0.5), fontSize: 16),
          ),
        ),
        Flexible(
          flex: 4,
          child: Text(
            value,
            style: TextStyle(color: black, fontSize: 16),
          ),
        ),
      ],
    );
  }

  showTitle(String s) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          s,
          style: TextStyle(color: black, fontSize: 20),
        ),
      ],
    );
  }
}
