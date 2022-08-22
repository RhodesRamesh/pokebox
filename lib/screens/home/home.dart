import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedox/models/Pokemon.dart';
import 'package:pokedox/resources/color.dart';
import 'package:pokedox/screens/home/controllers/homeController.dart';
import 'package:pokedox/screens/home/widgets/showSinglePokemon.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late double _width;
  late double _height;
  late HomeController homeCtrl;

  Timer? debouncer;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery
        .of(context)
        .size
        .width;
    _height = MediaQuery
        .of(context)
        .size
        .height;
    homeCtrl = Get.put(HomeController());
    return Scaffold(
      body: c(),
    );
  }

  Widget _showPokemons() {
    return Obx(
          () =>
          ListView.builder(
            itemCount: homeCtrl.pokemonList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              Pokemon pokemon = homeCtrl.pokemonList[index];
              return Text(
                pokemon.name,
                style: TextStyle(color: black),
              );
            },
          ),
    );
  }

  Widget _showPokemonsGrid() {
    if (homeCtrl.pokemonList.isEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              "No Pokemon found",
              style: TextStyle(fontSize: 16, color: black),
            ),
          ),
        ],
      );
    } else {
      return GridView.builder(
        primary: false,
        itemCount: homeCtrl.pokemonList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          Pokemon pokemon = homeCtrl.pokemonList[index];
          return PokemonGrid(
            pokemon: pokemon,
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.25,
        ),
      );
    }
  }

  void debounce(VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 500),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }
    debouncer = Timer(duration, callback);
  }

  Widget c() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          title: Text(
            "Pokedex",
            style: TextStyle(color: black, fontSize: 32),
          ),
          backgroundColor: white,
          elevation: 0,
        ),
        SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)),
              child: Obx(
                    () =>
                    TextFormField(
                      maxLines: 1,
                      controller: homeCtrl.searchCtrl,
                      cursorColor: black,
                      onChanged: (text) async {
                        homeCtrl.search.value = text;
                        debounce(() {
                          homeCtrl.searchPokemon();
                        });
                      },
                      autofocus: false,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        fillColor: grey.withOpacity(0.25),
                        hintText: "Search by name or type",
                        filled: true,
                        isDense: true,
                        counter: const Offstage(),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: grey.withOpacity(0.25),
                          ),
                        ),
                        suffixIcon: homeCtrl.search.isNotEmpty
                            ? InkWell(
                          onTap: () {
                            homeCtrl.searchCtrl.clear();
                            homeCtrl.search.value = "";
                            homeCtrl.searchPokemon();
                          },
                          child: Icon(
                            FontAwesomeIcons.solidTimesCircle,
                            color: iconColor,
                            size: 18,
                          ),
                        )
                            : null,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: grey.withOpacity(0.25),
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
              ),
            )),
        SliverToBoxAdapter(child: futureWidget())
      ],
    );
  }

  Widget futureWidget() {
    return FutureBuilder(
      future: homeCtrl.pokemonFuture,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SizedBox(
              width: _width * 0.5,
              height: _height * 0.5,
              child: LottieBuilder.asset('assets/pokeball_anime.json',
                  reverse: true, frameRate: FrameRate.max),
            ),
          );
        } else {
          return Obx(() =>
              Column(
                children: [
                  if(homeCtrl.isLoading.value)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CircularProgressIndicator(color: black, strokeWidth: 3),
                      ],
                    ),
                  _showPokemonsGrid()
                  ,
                ]
                ,
              )
          );
        }
      },
    );
  }

  Widget originalWidget() {
    return Container(
      width: _width,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      color: white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: _height * 0.05,
          ),
          Text(
            "Pokedex",
            style: TextStyle(color: black, fontSize: 32),
          ),
          Expanded(
            child: futureWidget(),
          ),
        ],
      ),
    );
  }
}
