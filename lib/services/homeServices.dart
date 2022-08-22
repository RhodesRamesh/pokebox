import 'package:dio/dio.dart';

class HomeAPI{

  Future<Response?> getAllPokemon() async{
    try{
      String url = "https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json";
      Response response =  await Dio().get(url,options: Options(responseType: ResponseType.json));
      return response;
    } on DioError catch(e){
      return e.response;
    }
  }

}