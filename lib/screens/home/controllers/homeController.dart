import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedox/models/Pokemon.dart';
import 'package:pokedox/services/homeServices.dart';

class HomeController extends GetxController{

  RxList _pokemonList = [].obs;
  List OriginalList = [];


  RxList get pokemonList => _pokemonList;

  late Future pokemonFuture;

  TextEditingController searchCtrl = TextEditingController();

  RxString search = "".obs;


  @override
  void onInit() {
    super.onInit();
    pokemonFuture = getPokemons();
  }

  Future getPokemons() async{
    try{
      HomeAPI api = HomeAPI();
      dio.Response? res  = await api.getAllPokemon();
      if(res==null){
        return Future.error("Could not load");
      }
      if(res.statusCode ==200){
        final data = (json.decode(res.data) as List)
            .map((item) => Pokemon.fromJson(item))
            .toList();
        // _pokemonList.value = data;
        _pokemonList.value = data.where((element) => data.indexOf(element)<250).toList();
        OriginalList = _pokemonList.value;
      }
      print(_pokemonList.length);
      return Future.value();
    }catch(e){
      print(e);
      return Future.error("Could not load");
    }
  }

  RxBool isLoading = false.obs;
  void searchPokemon() {
    isLoading.value = true;
    if(search.isEmpty){
      _pokemonList.value = OriginalList;
    }else{
      _pokemonList.value = OriginalList.where((element) {
        Pokemon p = element;
        return p.name.toLowerCase().contains(search);
      }).toList();
    }
    isLoading.value = false;
  }

}